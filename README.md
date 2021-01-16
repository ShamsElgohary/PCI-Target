# PCI-Target Project
PCI target implemented using Verilog which is a hardware description language.  
Target receives commands from the initiator (master) and starts acting according to it.  
Target is capable of identifying if the master is calling it’s address or another address.  
Target performs read/write operation with different scenarios for each operation.  
An 8 words (32-bit) register is used as the main memory in the target and another 8 words cache memory as storage in case of overflow of registers main memory.  
Target address is assigned as 32’h111111xxx with the last 3 bits determining which register to perform the operation on  

# Target opreates as follows:
-When the PCI target device receives the command and recognize its address,   
a. The DEVSEL should be configured properly (asserted low at certain time).   
b. The TRDY should be configured properly (asserted low at certain time).  

-If the received command in PCI target device is a read operation.   
a. The target device should start sending out a frame upon having FRAME signal asserted to low.  
b. The target device should stop sending out a frame upon having FRAME signal asserted to high.  

-If the received command in PCI target device is a write operation.  
a. The target device should start saving the received data in an internal storage with respect to byte enable (BE) bits upon having FRAME signal asserted to low.  
b. The target device should stop saving the received data in internal storage upon having FRAME signal asserted to high.  
