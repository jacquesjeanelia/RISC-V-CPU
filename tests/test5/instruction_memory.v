`include "defines.v"

module InstrMem (
    input [5:0] address,
    output [31:0] data_out
);

    // 64-entry memory, where each entry is a 32-bit instruction
    reg [31:0] mem [0:63];

    // Combinational read port
    assign data_out = mem[address];

    // Initialize the instruction memory with the assembled B-type test program
    initial begin
        // --- Test Setup ---
        mem[0]  = 32'h00042483; // lw x9, 0(x8)   (s1)
        mem[1]  = 32'h00442903; // lw x18, 4(x8)  (s2)
        mem[2]  = 32'h00842983; // lw x19, 8(x8)  (s3)
        mem[3]  = 32'h00c42a03; // lw x20, 12(x8) (s4)

        // --- Branch Tests ---
        mem[4]  = 32'h01248463; // beq x9, x18, 8
        mem[5]  = 32'h0540006f; // jal x0, 84 (fail)
        mem[6]  = 32'h001f8f93; // addi x31, x31, 1
        mem[7] = 32'h01449463; // bne x9, x20, 8
        mem[8] = 32'h0480006f; // jal x0, 72 (fail)
        mem[9] = 32'h001f8f93; // addi x31, x31, 1
        mem[10] = 32'h0099c463; // blt x19, x9, 8
        mem[11] = 32'h03c0006f; // jal x0, 60 (fail)
        mem[12] = 32'h001f8f93; // addi x31, x31, 1
        mem[13] = 32'h009a5463; // bge x20, x9, 8
        mem[14] = 32'h0300006f; // jal x0, 48 (fail)
        mem[15] = 32'h001f8f93; // addi x31, x31, 1
        mem[16] = 32'h0134e463; // bltu x9, x19, 8
        mem[17] = 32'h0240006f; // jal x0, 36 (fail)
        mem[18] = 32'h001f8f93; // addi x31, x31, 1
        mem[19] = 32'h013a7e63; // bgeu x20, x19, 28 (fail)
        mem[20] = 32'h001f8f93; // addi x31, x31, 1

        // --- Fail State ---
        mem[21] = 32'h0000006f; // jal x0, 0 (loop)

    end
endmodule