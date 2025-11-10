module DataMem(
    input clk, MemRead, MemWrite,
    input [5:0] addr, 
    input [31:0] data_in, 
    output reg [31:0] data_out
);

    reg [31:0] mem [0:63];

    always @(posedge clk) begin
        if (MemWrite) begin
            mem[addr] <= data_in;
        end
    end

    always @(*) begin
        if (MemRead) begin
            data_out = mem[addr];
        end
    end

    initial begin
        mem[0]=32'd17;
        mem[1]=32'd9;
        mem[2]=32'd25;
    end
endmodule