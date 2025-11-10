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
            // The .bss section starts at the beginning of the data segment in RARS.
            // We assume it maps to the start of our data memory here.
            // The la s0, result_lui will resolve to the address of mem[0].
    
            // Expected to become 0xABCDE000 after sw t1, 0(s0)
            mem[0] = 32'h00000000;
    
            // Expected to become 0x00401004 after sw t2, 4(s0)
            mem[1] = 32'h00000000;
    
            // Initialize the rest of memory to 0
            mem[2] = 32'h0; mem[3] = 32'h0; // and so on...
        end
        
endmodule