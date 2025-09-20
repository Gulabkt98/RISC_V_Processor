module (A,B,ALUcontrol,Result);
//input declare
 input [31:0] A,B;
 input [2:0] ALUcontrol;

 ///output declare
 output [31:0] Result;

 //assign 
 wire a_&_b=A & B;
 wire a_or_b=A | B;
 wire not_b = ~B;
   
    
endmodule