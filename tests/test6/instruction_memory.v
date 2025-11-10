`include "defines.v"

module InstrMem (
    input [5:0] address,
    output [31:0] data_out
);

    // 64-entry memory for instructions
    reg [31:0] mem [0:63];

    // Combinational read port
    assign data_out = mem[address];

    // Initialize memory with the assembled U-type test program
    initial begin
        // --- U-Type Instruction Tests ---
        mem[0] = 32'habcde337; // lui x6, 703710 (lui t1, 0xABCDE)
        mem[1] = 32'h00001397; // auipc x7, 1

        // --- Store Results ---
        // la s0, result_lui is expanded into auipc and addi
        mem[2] = 32'h00000417; // auipc x8, 0
        mem[3] = 32'hff840413; // addi x8, x8, -8
        // Store the test results to memory
        mem[4] = 32'h00642023; // sw x6, 0(x8)   (sw t1, 0(s0))
        mem[5] = 32'h00742223; // sw x7, 4(x8)   (sw t2, 4(s0))

        // --- Program Termination ---
        mem[6] = 32'h00a00513; // addi x10, x0, 10
        mem[7] = 32'h00000073; // ecall

    end
endmodule