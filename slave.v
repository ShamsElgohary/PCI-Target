module slave (reset, CLK, TRDY, IRDY, BUS, CBE, FRAME, DEVSEL);
input wire CLK, FRAME,IRDY,reset;
input [3:0] CBE ;
output reg TRDY,DEVSEL;
inout [31:0] BUS;

parameter add=32'h11111111;
parameter ro= 4'b0110 ;
parameter wo= 4'b0111 ;
reg[31:0] mem[0:7];
reg[31:0] cache[0:7];
reg[1:0] r_w=2'b00;
reg[7:0] FR_DA=100;
reg overflow=0;
reg[3:0] i=0;

reg[31:0] bus_reg;
reg enable=0;
reg[3:0] clk_count =0;
reg[3:0] over_count =0;

////////////////////////////////  CLOCK COUNTER & RESET  ////////////////////////////////////
always @ (negedge CLK)
begin
    if (~FRAME && reset)
        begin
        clk_count = clk_count + 1'b1;
        end
        
    else if( (clk_count ==  FR_DA ) && reset)
        begin
                TRDY=1;
                DEVSEL=1;
                clk_count=0;
            	enable=0;
		r_w=2'b00;
      	 	FR_DA=100;
        end
    else if (~reset)
    begin
	TRDY=1;
        DEVSEL=1;
        clk_count=0;
    	enable=0;
    	r_w=2'b00;
     	FR_DA=100;
	mem[0]=0;
    	mem[1]=1;	
    	mem[2]=2;
    	mem[3]=3;
    	mem[4]=4;
    	mem[5]=5;
    	mem[6]=6;
    	mem[7]=7;
    end	
end
////////////////////////////////   CHECK THE ADDRESS   ////////////////////////////////////
always@(negedge FRAME)
begin
    if (BUS[31:3]==add[31:3])
    begin
    enable=1;
    i[2:0] = BUS[2:0];
    end
end
////////////////////////////////  CHECK THE CONTROL SIGNAL   ////////////////////////////////////

always@(negedge FRAME)
begin
    if(enable)
    begin
        if (CBE==ro)
        	r_w=2'b10; 
     
        if (CBE==wo)
        	r_w=2'b01;    
    end
end
///////////////////////////  ASSERTING OF TRDY & DEVSEL ///////////////////////////////////
always@(negedge CLK)
begin
    if(r_w==2'b01 && clk_count==2 )
    begin
    TRDY=0;
    DEVSEL=0;
    end
    
    if(r_w==2'b10 && clk_count==3 )
    begin
    TRDY=0;
    DEVSEL=0;
    end
end
////////////////////////  DEASSERTING OF TRDY & DEVSEL  ///////////////////////////////
//////////////////////////  RESET FLAG ////////////////////////////////////////////////

always@(posedge FRAME)
begin
FR_DA=clk_count;
end

////////////////////////////////////       BYTE ENABLE        ///////////////////////////////////

always@(negedge CLK)
begin	
	if (r_w==2'b10 && TRDY==0 && IRDY==0 && i<8)
	    begin
	    bus_reg=mem[i];  
    
	    i=i+1;
		if (i==8)
			i=0;
	    end

end

always@(posedge CLK)
begin

    if(r_w==2'b01 && TRDY==0 && IRDY==0 && i<8)
    
	begin
	
	if(CBE[0])
	mem[i][7:0] =BUS[7:0];
	if(CBE[1])
	mem[i][15:8] =BUS[15:8];
	if(CBE[2])
	mem[i][23:16] =BUS[23:16];
	if(CBE[3])
	mem[i][31:24] =BUS[31:24];
    
	i=i+1;
	if(i==8)
		begin
		overflow=1;
		over_count=clk_count;
		end	
	end

end
////////////// mem overflow (BOUNS) \\\\\\\\\\\\\\\\
always@(negedge CLK)
begin
if (overflow && r_w==2'b01 && over_count == clk_count-1)
	begin
	TRDY=1;
	cache[0]=mem[0];
    	cache[1]=mem[1];	
    	cache[2]=mem[2];
    	cache[3]=mem[3];	
    	cache[4]=mem[4];
    	cache[5]=mem[5];	
    	cache[6]=mem[6];
    	cache[7]=mem[7];	

	end
if (overflow && r_w==2'b01 && over_count == clk_count-2)
	begin
	TRDY=0;
	overflow=0;
	i=0;
	over_count=0;
	end
end

assign BUS = (r_w==2'b10 && TRDY==0 ) ? bus_reg : (32'hzzzzzzzz);

endmodule


