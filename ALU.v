module (A,B,ALUcontrol,Result);
//input declare
 input [31:0] A,B;
 input [2:0] ALUcontrol;

 ///output declare
 output [31:0] Result;

 // declaring interim wires
 wire [31:0] a_&_b;
 wire [31:0] a_or_b;
 wire [31:0] not_b;

 //mux1
 wire [31:0] mux_1;
 wire [31:0] sum; 
 wire [31:0] mux_2;

 //assign //logic design 
 //and operation
 assign a_&_b = A & B;

 //or operation
 assign a_or_b = A | B;

 //not operation
 assign not_b =~B; 

 //ternary operation
 assign mux_1 = (ALUcontrol[0] == 1'b0) ? B : not_b;

 //additonand subtraction operation
    assign sum = A + mux_1 + ALUcontrol[0];

 //assign mux2
 assign mux_2 = (ALUcontrol[1:0] == 2'b00) ? sum : 
                (ALUcontrol[1:0] == 2'b01) ? sum :
                 (ALUcontrol[1:0] == 2'b10) ? a_&_b : a_or_b;  
 //assign result 
 assign Result = mux_2;                 
    
endmodule