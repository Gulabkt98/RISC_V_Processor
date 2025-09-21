module (A,B,ALUcontrol,Result,Z,V,N,C);
//input declare
 input [31:0] A,B;
 input [2:0] ALUcontrol;
 input Z,V,N,C; //flags

 ///output declare
 output [31:0] Result;

 // declaring interim wires
 wire [31:0] a_&_b;
 wire [31:0] a_or_b;
 wire [31:0] not_b;
 wire cout; //carry out

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
 assign {cout,sum } = A + mux_1 + ALUcontrol[0]; /// use of carry out using concating property 

 //assign mux2
 assign mux_2 = (ALUcontrol[1:0] == 2'b00) ? sum : 
                (ALUcontrol[1:0] == 2'b01) ? sum :
                 (ALUcontrol[1:0] == 2'b10) ? a_&_b : a_or_b;  
 //assign result 
 assign Result = mux_2;    

//=================flag assignment==//

assign Z= &{~Result}; //zero flag

assign N= Result[31];  //negative flag if first bit is 1 then result is negative

assign C= cout & (~ALUcontrol[1]); //carry out flag  

assign V= (~ALUcontrol[1]) & (A[31] ^ sum[31]) & (~(A[31] ^ B[31]^ALUcontrol[0])); //overflow flag

endmodule