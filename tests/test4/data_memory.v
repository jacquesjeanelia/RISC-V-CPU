`include "defines.v"

module DataMem(
    input clk, MemRead, MemWrite,
    input [2:0] function3,
    input [5:0] addr, 
    input [31:0] data_in, 
    output reg [31:0] data_out
);

    wire [31:0] mem_access_out;
    
    Memory_Access_Unit memory_access_unit(
        .data_in(MemWrite ? data_in : mem[addr]),
        .function3(function3),
        .data_out(mem_access_out)
    );

    reg [31:0] mem [0:63];

    always @(posedge clk) begin
        if (MemWrite) begin
            mem[addr] <= mem_access_out;
        end
    end

    always @(*) begin
        if (MemRead) begin
            data_out = mem_access_out;
        end
    end

    initial begin
        // --- Part 1: Initial values to be loaded by the program ---
        // Corresponds to the .data section labeled initial_values.
        // The la s0, initial_values instruction will point to the address of mem[0].
        mem[0] = 32'h11223344; // Loaded into register t1
        mem[1] = 32'hAABBCCDD; // Loaded into register t2
        
        // --- Part 2: The memory region for store operations ---
        // Corresponds to the .bss section labeled store_region.
        // This is where your sw, sh, and sb instructions will write.
        // It is initialized to zero to make the changes clearly visible.
        // The la s1, store_region will point to the address of mem[2].
        mem[2] = 32'h00000000;
        mem[3] = 32'h00000000;
        mem[4] = 32'h00000000;

        // Initialize the rest of memory to a known state (e.g., zero)
        mem[5]  = 32'h0; mem[6]  = 32'h0; mem[7]  = 32'h0; mem[8]  = 32'h0;
        mem[9]  = 32'h0; mem[10] = 32'h0; mem[11] = 32'h0; mem[12] = 32'h0;
        // ...and so on for the rest of the memory.
    end

endmodule