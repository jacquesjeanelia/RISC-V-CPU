`include "defines.v"

module InstrMem (
    input [5:0] address,
    output [31:0] data_out
);

    // 64-entry memory, where each entry is a 32-bit instruction
    reg [31:0] mem [0:63];

    // Combinational read port
    assign data_out = mem[address];

    // Initialize the instruction memory with the assembled program
    initial begin
        // Load registers for tests
        mem[0]  = 32'h0142a483; // lw x9, 20(x5)   (s1)
        mem[1]  = 32'h0182a903; // lw x18, 24(x5)  (s2)
        mem[2]  = 32'h03c2a983; // lw x19, 60(x5)  (s3)

        // --- I-Type Arithmetic/Logical Tests ---
        mem[3]  = 32'h06448313; // addi x6, x9, 100
        mem[4]  = 32'h0644a393; // slti x7, x9, 100
        mem[5]  = 32'hfff4be13; // sltiu x28, x9, -1
        mem[6]  = 32'h00f4ce93; // xori x29, x9, 15
        mem[7]  = 32'h00f96f13; // ori x30, x18, 15
        mem[8] = 32'h00f97f93; // andi x31, x18, 15

        // --- Shift Immediate Tests ---
        mem[9] = 32'h00449a13; // slli x20, x9, 4
        mem[10] = 32'h0029da93; // srli x21, x19, 2
        mem[11] = 32'hff000b13; // addi x22, x0, -16
        mem[12] = 32'h402b5b93; // srai x23, x22, 2
    end
endmodule