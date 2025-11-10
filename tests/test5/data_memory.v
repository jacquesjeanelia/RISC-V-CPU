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
            // --- Part 1: Initial values for comparison ---
            // Corresponds to the vals label.
            mem[0] = 32'd100;       // Loaded into s1 (x9)
            mem[1] = 32'd100;       // Loaded into s2 (x18)
            mem[2] = 32'hFFFFFF9C;  // -100, loaded into s3 (x19)
            mem[3] = 32'd200;       // Loaded into s4 (x20)
    
            // --- Part 2: Memory location for the final result ---
            // Corresponds to result_space.
            // The program will sw the value of t6 (should be 6) here.
            mem[4] = 32'h00000000;
    
            // Initialize the rest of memory to 0
            mem[5] = 32'h0; mem[6] = 32'h0; // etc...
    end
    
endmodule