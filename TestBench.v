module TestBench1();
////////// DEFAULT  \\\\\\\\

reg reset;
reg CLK,FRAME,IRDY;
reg [3:0] CBE;
wire TRDY,DEVSEL;
wire [31:0] BUS;
parameter add=32'h11111111;
reg cond; // Writing Condition
reg[31:0] buffer;

assign BUS = (cond ) ? buffer : (32'hzzzzzzzz);

initial
begin
$monitor($time, , ,  " %d   %b  %b  %b ", BUS, FRAME, TRDY, DEVSEL);

reset=1;
CLK=0;
IRDY=1;
FRAME=1;
cond=0;
reset=0;
#10
reset=1;
#10
////////// DEFAULT  \\\\\\\\
//code 
cond=1;
CBE=4'b0110;
buffer[31:0]= add;
buffer[2:0]= 3'b000;
FRAME=0;
#10
cond=0;
IRDY=0;
#30
FRAME=1;
#10
IRDY=1;






//code

///////// DEFAULT \\\\\\\\


FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;
#10
FRAME=1;
CBE=4'b1111;

end 

always
begin
#5
CLK= ~ CLK;
end


slave s1 ( reset,CLK, TRDY,IRDY, BUS,CBE, FRAME, DEVSEL);
endmodule

module TestBench2();
////////// DEFAULT  \\\\\\\\

reg reset;
reg CLK,FRAME,IRDY;
reg [3:0] CBE;
wire TRDY,DEVSEL;
wire [31:0] BUS;
parameter add=32'h11111111;
reg cond; // Writing Condition
reg[31:0] buffer;

assign BUS = (cond ) ? buffer : (32'hzzzzzzzz);

initial
begin
$monitor($time, , ,  " %d   %b  %b  %b ", BUS, FRAME, TRDY, DEVSEL);

reset=1;
CLK=0;
IRDY=1;
FRAME=1;
cond=0;
reset=0;
#10
reset=1;
#10
////////// DEFAULT  \\\\\\\\
//code
cond=1;
FRAME=0;
buffer[31:0]= add;
buffer[2:0]= 3'b000;
CBE=4'b0111;
#10
buffer=0;
CBE=4'b1111;
IRDY=0;


#10
buffer=1;
CBE=4'b1111;

#10
buffer=2;
CBE=4'b1111;
#10
FRAME=1;
buffer=123456789;
CBE=4'b0110;
#10



//code
///////// DEFAULT \\\\\\\\

IRDY=1;
FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;
#10
FRAME=1;
CBE=4'b1111;

end 

always
begin
#5
CLK= ~ CLK;
end


slave s1 ( reset,CLK, TRDY,IRDY, BUS,CBE, FRAME, DEVSEL);
endmodule

module TestBench3();
////////// DEFAULT  \\\\\\\\

reg reset;
reg CLK,FRAME,IRDY;
reg [3:0] CBE;
wire TRDY,DEVSEL;
wire [31:0] BUS;
parameter add=32'h11111111;
reg cond; // Writing Condition
reg[31:0] buffer;

assign BUS = (cond ) ? buffer : (32'hzzzzzzzz);

initial
begin
$monitor($time, , ,  " %d   %b  %b  %b ", BUS, FRAME, TRDY, DEVSEL);

reset=1;
CLK=0;
IRDY=1;
FRAME=1;
cond=0;
reset=0;
#10
reset=1;
#10
////////// DEFAULT  \\\\\\\\
//code
cond=1;
FRAME=0;
buffer[31:0]= add;
buffer[2:0]= 3'b100;
CBE=4'b0111;
#10
buffer=10;
CBE=4'b1111;
IRDY=0;


#10
buffer=20;
CBE=4'b1111;

#10
buffer=2;
CBE=4'b1111;
#10
FRAME=1;
buffer=223456789;
CBE=4'b0110;
#10



//code
///////// DEFAULT \\\\\\\\

IRDY=1;
FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;
#10
FRAME=1;
CBE=4'b1111;

end 

always
begin
#5
CLK= ~ CLK;
end


slave s1 ( reset,CLK, TRDY,IRDY, BUS,CBE, FRAME, DEVSEL);
endmodule
module TestBench4();
////////// DEFAULT  \\\\\\\\

reg reset;
reg CLK,FRAME,IRDY;
reg [3:0] CBE;
wire TRDY,DEVSEL;
wire [31:0] BUS;
parameter add=32'h11111111;
reg cond; // Writing Condition
reg[31:0] buffer;

assign BUS = (cond ) ? buffer : (32'hzzzzzzzz);

initial
begin
$monitor($time, , ,  " %d   %b  %b  %b ", BUS, FRAME, TRDY, DEVSEL);

reset=1;
CLK=0;
IRDY=1;
FRAME=1;
cond=0;
reset=0;
#10
reset=1;
#10
////////// DEFAULT  \\\\\\\\
//code 
cond=1;
CBE=4'b0110;
buffer[31:0]= add;
buffer[2:0]= 3'b100;
FRAME=0;
#10
cond=0;
IRDY=0;
#40
FRAME=1;
#10
IRDY=1;






//code

///////// DEFAULT \\\\\\\\


FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;
#10
FRAME=1;
CBE=4'b1111;

end 

always
begin
#5
CLK= ~ CLK;
end


slave s1 ( reset,CLK, TRDY,IRDY, BUS,CBE, FRAME, DEVSEL);

endmodule
module TestBench5();

////////// DEFAULT  \\\\\\\\

reg reset;
reg CLK,FRAME,IRDY;
reg [3:0] CBE;
wire TRDY,DEVSEL;
wire [31:0] BUS;
parameter add=32'h11111111;
reg cond; // Writing Condition
reg[31:0] buffer;

assign BUS = (cond ) ? buffer : (32'hzzzzzzzz);

initial
begin
$monitor($time, , ,  " %d   %b  %b  %b ", BUS, FRAME, TRDY, DEVSEL);

reset=1;
CLK=0;
IRDY=1;
FRAME=1;
cond=0;
reset=0;
#10
reset=1;
#10
////////// DEFAULT  \\\\\\\\

//code 
cond=1;
CBE=4'b0110;
buffer[31:0]= add;
buffer[2:0]= 3'b011;
FRAME=0;
#10
cond=0;
IRDY=0;
#30
IRDY=1;
#10
IRDY=0;
#20
FRAME=1;
#10
IRDY=1;

//code

///////// DEFAULT \\\\\\\\


FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;
#10
FRAME=1;
CBE=4'b1111;

end 

always
begin
#5
CLK= ~ CLK;
end


slave s1 ( reset,CLK, TRDY,IRDY, BUS,CBE, FRAME, DEVSEL);

endmodule 
///////// DEFAULT \\\\\\\\

module TestBench6();

////////// DEFAULT  \\\\\\\\

reg reset;
reg CLK,FRAME,IRDY;
reg [3:0] CBE;
wire TRDY,DEVSEL;
wire [31:0] BUS;
parameter add=32'h11111111;
reg cond; // Writing Condition
reg[31:0] buffer;

assign BUS = (cond ) ? buffer : (32'hzzzzzzzz);

initial
begin
$monitor($time, , ,  " %d   %b  %b  %b ", BUS, FRAME, TRDY, DEVSEL);

reset=1;
CLK=0;
IRDY=1;
FRAME=1;
cond=0;
reset=0;
#10
reset=1;
#10
////////// DEFAULT  \\\\\\\\

//code 
cond=1;
CBE=4'b0110;
buffer[31:0]= add;
buffer[2:0]= 3'b000;
FRAME=0;
#10
cond=0;
IRDY=0;
#100
FRAME=1;
#10
IRDY=1;

//code

///////// DEFAULT \\\\\\\\


FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;
#10
FRAME=1;
CBE=4'b1111;

end 

always
begin
#5
CLK= ~ CLK;
end


slave s1 ( reset,CLK, TRDY,IRDY, BUS,CBE, FRAME, DEVSEL);

endmodule 
///////// DEFAULT \\\\\\\\



module TestBench7();

////////// DEFAULT  \\\\\\\\

reg reset;
reg CLK,FRAME,IRDY;
reg [3:0] CBE;
wire TRDY,DEVSEL;
wire [31:0] BUS;
parameter add=32'h11111111;
reg cond; // Writing Condition
reg[31:0] buffer;

assign BUS = (cond ) ? buffer : (32'hzzzzzzzz);

initial
begin
$monitor($time, , ,  " %d   %b  %b  %b ", BUS, FRAME, TRDY, DEVSEL);

reset=1;
CLK=0;
IRDY=1;
FRAME=1;
cond=0;
reset=0;
#10
reset=1;
#10
////////// DEFAULT  \\\\\\\\

//code 
cond=1;
FRAME=0;
buffer[31:0]= add;
buffer[2:0]= 3'b000;
CBE=4'b0111;

#10
buffer=0;
CBE=4'b1111;
IRDY=0;


#10
buffer=1;
CBE=4'b1111;

#10
buffer=2;
CBE=4'b1111;
#10
buffer=3;
CBE=4'b1111;
#10
buffer=4;
CBE=4'b1111;
#10
buffer=5;
CBE=4'b1111;
#10
buffer=6;
CBE=4'b1111;
#10
buffer=7;
CBE=4'b1111;
#20
buffer=8;
CBE=4'b1111;
#10

///////// DEFAULT \\\\\\\\

FRAME=1;
buffer=9;
CBE=4'b1111;
#10
IRDY=1;
FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;

#10
FRAME=1;
CBE=4'b1111;








//code

///////// DEFAULT \\\\\\\\


FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;
#10
FRAME=1;
CBE=4'b1111;

end 

always
begin
#5
CLK= ~ CLK;
end


slave s1 ( reset,CLK, TRDY,IRDY, BUS,CBE, FRAME, DEVSEL);

endmodule 
///////// DEFAULT \\\\\\\\




module TestBench8();

////////// DEFAULT  \\\\\\\\

reg reset;
reg CLK,FRAME,IRDY;
reg [3:0] CBE;
wire TRDY,DEVSEL;
wire [31:0] BUS;
parameter add=32'h11111111;
reg cond; // Writing Condition
reg[31:0] buffer;

assign BUS = (cond ) ? buffer : (32'hzzzzzzzz);

initial
begin
$monitor($time, , ,  " %d   %b  %b  %b ", BUS, FRAME, TRDY, DEVSEL);

reset=1;
CLK=0;
IRDY=1;
FRAME=1;
cond=0;
reset=0;
#10
reset=1;
#10
////////// DEFAULT  \\\\\\\\
//code 
cond=1;
FRAME=0;
buffer[31:0]= add;
buffer[2:0]= 3'b000;
CBE=4'b0111;

#10
buffer=0;
CBE=4'b1111;
IRDY=0;


#10
buffer=1;
CBE=4'b1111;

#10
buffer=2;
CBE=4'b1111;
#10
buffer=3;
CBE=4'b1111;
#10
buffer=4;
CBE=4'b1111;
#10
buffer=5;
CBE=4'b1111;
#10
buffer=6;
CBE=4'b1111;
#10
buffer=7;
CBE=4'b1111;
#20
buffer=8;
CBE=4'b1111;
#10

FRAME=1;
buffer=9;
CBE=4'b1111;
#10
IRDY=1;
FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;

#10
FRAME=1;
CBE=4'b1111;
#10

//read 
cond=1;
CBE=4'b0110;
buffer[31:0]= add;
buffer[2:0]= 3'b100;
FRAME=0;
#10
cond=0;
IRDY=0;
#10
#50
IRDY=1;
#20
IRDY=0;
#10

FRAME=1;
#10
IRDY=1;
FRAME=1'bz;
buffer=32'hzzzzzzzz;
CBE=4'bzzzz;

#10
FRAME=1;
CBE=4'b1111;
end 

always
begin
#5
CLK= ~ CLK;
end


slave s1 ( reset,CLK, TRDY,IRDY, BUS,CBE, FRAME, DEVSEL);

endmodule 
///////// DEFAULT \\\\\\\\



