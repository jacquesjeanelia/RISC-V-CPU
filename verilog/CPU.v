`include "defines.v"
module CPU (
    input clk, rst
);

    wire [31:0] PC_out;
    wire [31:0] mux1;
    assign mux1 = Branch & zero_flag ? PC_plus_imm : PC_plus4;
    register PC(
        .clk(clk),
        .rst(rst),
        .load(1'b1),
        .D(mux1),
        .Q(PC_out)
    );
    
    wire cout1;
    wire [31:0] PC_plus4;
    RCA pc_incrementer (
        .A(PC_out),
        .B(32'd4),
        .cin(1'b0),
        .Sum(PC_plus4),
        .Cout(cout1)
    );

    wire [31:0] instruction;
    InstrMem instruction_memory (
        .address(PC_out),
        .data_out(instruction)
    );

    wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    wire [1:0] ALUOp;
    Control control_unit(
        .instruction6_2(instruction[6:2]), // instruction[6:0]?
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .ALUOp(ALUOp),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite)
    );

    wire [31:0] read_data1, read_data2, write_data;
    register_file reg_file (
        .clk(clk),
        .rst(rst),
        .readReg1(instruction[19:15]),
        .readReg2(instruction[24:20]),
        .writeReg(instruction[11:7]),
        .regWriteEnable(RegWrite),
        .readData1(read_data1),
        .readData2(read_data2),
        .writeData(write_data)
    );

    wire [31:0] immediate;
    immediate_generator imm_gen (
        .instruction(instruction),
        .immediate(immediate)
    );

    wire [31:0] imm_shifted;
    n_bit_shift_left #(32) shifter (
        .in(immediate),
        .out(imm_shifted)
    );

    wire [31:0] ALU_input2;
    assign ALU_input2 = ALUSrc ? immediate : read_data2;

    wire [3:0] ALU_select;
    ALU_control alu_control_unit (
        .ALUOp(ALUOp),
        .function3(instruction[14:12]),
        .function7(instruction[30]),
        .ALU_select(ALU_select)
    );

    wire [31:0] ALU_result;
    wire zero_flag, carry_flag, overflow_flag, sign_flag;

    ALU alu(
        .A(read_data1),
        .B(ALU_input2),
        .sel(ALU_select),
        .zero(zero_flag),
        .carry(carry_flag),
        .overflow(overflow_flag),
        .sign(sign_flag),
        .out(ALU_result)
    );

    wire [31:0] PC_plus_imm;
    wire cout2;
    RCA pc_adder (
        .A(PC_out),
        .B(imm_shifted),
        .cin(1'b0),
        .Sum(PC_plus_imm),
        .Cout(cout2)
    );

    wire [31:0] read_data_memory;
    DataMem data_memory(
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .addr(ALU_result[7:2]), // ALU_result?
        .data_in(read_data2),
        .data_out(read_data_memory)
    );

    assign write_data = MemtoReg ? read_data_memory : ALU_result;

endmodule