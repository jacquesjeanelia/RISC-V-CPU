`include "defines.v"

module InstrMem (
    input [5:0] address,
    output [31:0] data_out
);

    // 64-entry memory, where each entry is a 32-bit instruction
    reg [31:0] mem [0:63];

    // Combinational read port
    assign data_out = mem[address];

    // Initialize the instruction memory with the assembled S-type test program
    initial begin
        // Load test values into registers
        mem[0] = 32'h00042303; // lw x6, 0(x8)   (t1)
        mem[1] = 32'h00442383; // lw x7, 4(x8)   (t2)

        // --- S-Type Instruction Tests ---
        mem[2] = 32'h0064a023; // sw x6, 0(x9)
        mem[3] = 32'h00749223; // sh x7, 4(x9)
        mem[4] = 32'h00748423; // sb x7, 8(x9)

    end
endmodule