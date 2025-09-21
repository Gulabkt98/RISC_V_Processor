module ALU_tb;
    // Testbench signals
    reg [31:0] A, B;
    reg [2:0] ALUcontrol;
    wire [31:0] Result;
    wire Z, V, N, C;    // Status flags
    
    // Instantiate the ALU
    ALU dut(
        .A(A),
        .B(B),
        .ALUcontrol(ALUcontrol),
        .Result(Result),
        .Z(Z),          // Zero flag
        .V(V),          // Overflow flag
        .N(N),          // Negative flag
        .C(C)           // Carry flag
    );
    
    initial begin
        // Create a dump file
        $dumpfile("ALU_test.vcd");
        $dumpvars(0, ALU_tb);
        
        // Test case 1: Addition (A + B)
        A = 32'h0000_0005;
        B = 32'h0000_0003;
        ALUcontrol = 3'b000;
        #10;
        
        // Test case 2: Subtraction (A - B)
        A = 32'h0000_0005;
        B = 32'h0000_0003;
        ALUcontrol = 3'b001;
        #10;
        
        // Test case 3: AND
        A = 32'hF0F0_F0F0;
        B = 32'hFFFF_0000;
        ALUcontrol = 3'b010;
        #10;
        
        // Test case 4: OR
        A = 32'hF0F0_F0F0;
        B = 32'hFFFF_0000;
        ALUcontrol = 3'b011;
        #10;
        
        // End simulation
        $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("Time=%0d A=%h B=%h ALUcontrol=%b Result=%h Z=%b V=%b N=%b C=%b",
                 $time, A, B, ALUcontrol, Result, Z, V, N, C);
    end
endmodule