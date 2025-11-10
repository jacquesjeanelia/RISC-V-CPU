
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
        // mem[address] = value;
        mem[0]  = 32'd1;     // For lw x1, 0(x5)
        mem[1]  = 32'd2;     // For lw x2, 4(x5)
        mem[2]  = 32'd3;     // For lw x3, 8(x5)
        mem[3]  = 32'd4;     // For lw x4, 12(x5)
        mem[4]  = 32'd5;     // For lw x5, 16(x5)
        mem[5]  = 32'd6;     // For lw x6, 20(x5)
        mem[6]  = 32'd7;     // For lw x7, 24(x5)
        mem[7]  = 32'd8;     // For lw x8, 28(x5)
        mem[8]  = 32'd9;     // For lw x9, 32(x5)
        mem[9]  = 32'd10;    // For lw x10, 36(x5)
        mem[10] = 32'd11;    // For lw x11, 40(x5)
        mem[11] = 32'd12;    // For lw x12, 44(x5)
        mem[12] = 32'd13;    // For lw x13, 48(x5)
        mem[13] = 32'd14;    // For lw x14, 52(x5)
        mem[14] = 32'd15;    // For lw x15, 56(x5)
        mem[15] = 32'd16;    // For lw x16, 60(x5)
        mem[16] = 32'd17;    // For lw x17, 64(x5)
        mem[17] = 32'd18;    // For lw x18, 68(x5)
        mem[18] = 32'd19;    // For lw x19, 72(x5)
        mem[19] = 32'd20;    // For lw x20, 76(x5)
        mem[20] = 32'd21;    // For lw x21, 80(x5)
        mem[21] = 32'd22;    // For lw x22, 84(x5)
        mem[22] = 32'd23;    // For lw x23, 88(x5)
        mem[23] = 32'd24;    // For lw x24, 92(x5)
        mem[24] = 32'd25;    // For lw x25, 96(x5)
        mem[25] = 32'd26;    // For lw x26, 100(x5)
        mem[26] = 32'd27;    // For lw x27, 104(x5)
        mem[27] = 32'd28;    // For lw x28, 108(x5)
        mem[28] = 32'd29;    // For lw x29, 112(x5)
        mem[29] = 32'd30;    // For lw x30, 116(x5)
        mem[30] = 32'd31;    // For lw x31, 120(x5)
    end
endmodule
