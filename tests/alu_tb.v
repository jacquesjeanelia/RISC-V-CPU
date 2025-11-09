module ALU_tb ();
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALU_select;
    wire zero_flag, carry_flag, overflow_flag, sign_flag;
    wire [31:0] out;

    ALU alu_inst (
        .A(A),
        .B(B),
        .ALU_select(ALU_select),
        .zero_flag(zero_flag),
        .carry_flag(carry_flag),
        .overflow_flag(overflow_flag),
        .sign_flag(sign_flag),
        .out(out)
    );

    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, ALU_tb);
    end
    
    initial begin
        // Test ADD
        A = 32'd15; B = 32'd10; ALU_select = 4'b0000; #10; // expect out = 25
        // Test SUB
        A = 32'd20; B = 32'd5; ALU_select = 4'b0001; #10; // expect out = 15
        // Test OR
        A = 32'b1010; B = 32'b1100; ALU_select = 4'b0100; #10; // expect out = 1110
        // Test AND
        A = 32'b1010; B = 32'b1100; ALU_select = 4'b0101; #10; // expect out = 10100
        // Test XOR
        A = 32'b1010; B = 32'b1100; ALU_select = 4'b0111; #10; // expect out = 10010
        // Test SLL
        A = 32'b0001; B = 32'd2; ALU_select = 4'b1000; #10; // expect out = 100
        // Test SRL
        A = 32'b1000; B = 32'd2; ALU_select = 4'b1001; #10; // expect out = 10
        // Test SRA
        A = 32'b1000_0000_0000_0000_0000_0000_0000_0000; B = 32'd2; ALU_select = 4'b1010; #10; // expect out = 10000000000000000000000000000010
        // Test SLT
        A = 32'd5; B = 32'd10; ALU_select = 4'b1101; #10; // expect out = 0
        A = 32'd5; B = 32'd5; ALU_select = 4'b1101; #10; // expect out = 1
        // Test SLTU
        A = 32'd5; B = 32'd10; ALU_select = 4'b1111; #10; // expect out = 0
        #100;
        $dumpflush;
        $finish;
    end
endmodule