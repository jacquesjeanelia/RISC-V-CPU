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

        // Loading registers x1-x31 from data memory
        mem[2]  = 32'h0002a083; // lw x1, 0(x5)
        mem[3]  = 32'h0042a103; // lw x2, 4(x5)
        mem[4]  = 32'h0082a183; // lw x3, 8(x5)
        mem[5]  = 32'h00c2a203; // lw x4, 12(x5)
        mem[6]  = 32'h0142a303; // lw x6, 20(x5)
        mem[7]  = 32'h0182a383; // lw x7, 24(x5)
        mem[8]  = 32'h01c2a403; // lw x8, 28(x5)
        mem[9]  = 32'h0202a483; // lw x9, 32(x5)
        mem[10] = 32'h0242a503; // lw x10, 36(x5)
        mem[11] = 32'h0282a583; // lw x11, 40(x5)
        mem[12] = 32'h02c2a603; // lw x12, 44(x5)
        mem[13] = 32'h0302a683; // lw x13, 48(x5)
        mem[14] = 32'h0342a703; // lw x14, 52(x5)
        mem[15] = 32'h0382a783; // lw x15, 56(x5)
        mem[16] = 32'h03c2a803; // lw x16, 60(x5)
        mem[17] = 32'h0402a883; // lw x17, 64(x5)
        mem[18] = 32'h0442a903; // lw x18, 68(x5)
        mem[19] = 32'h0482a983; // lw x19, 72(x5)
        mem[20] = 32'h04c2aa03; // lw x20, 76(x5)
        mem[21] = 32'h0502aa83; // lw x21, 80(x5)
        mem[22] = 32'h0542ab03; // lw x22, 84(x5)
        mem[23] = 32'h0582ab83; // lw x23, 88(x5)
        mem[24] = 32'h05c2ac03; // lw x24, 92(x5)
        mem[25] = 32'h0602ac83; // lw x25, 96(x5)
        mem[26] = 32'h0642ad03; // lw x26, 100(x5)
        mem[27] = 32'h0682ad83; // lw x27, 104(x5)
        mem[28] = 32'h06c2ae03; // lw x28, 108(x5)
        mem[29] = 32'h0702ae83; // lw x29, 112(x5)
        mem[30] = 32'h0742af03; // lw x30, 116(x5)
        mem[31] = 32'h0782af83; // lw x31, 120(x5)
        mem[32] = 32'h0102a283; // lw x5, 16(x5) -- Reloading x5

        // R-Format Instruction Tests
        mem[33] = 32'h002083b3; // add x7, x1, x2
        mem[34] = 32'h40430433; // sub x8, x6, x4
        mem[35] = 32'h002195b3; // sll x11, x3, x2
        mem[36] = 32'h0020a633; // slt x12, x1, x2
        mem[37] = 32'h01f0b733; // sltu x14, x1, x31
        mem[38] = 32'h00a4c7b3; // xor x15, x9, x10
        mem[39] = 32'h002858b3; // srl x17, x16, x2
        mem[40] = 32'h402959b3; // sra x19, x18, x2
        mem[41] = 32'h00a4ea33; // or x20, x9, x10
        mem[42] = 32'h00a4fab3; // and x21, x9, x10
    end
endmodule