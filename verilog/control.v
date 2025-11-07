`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2025 03:45:10 PM
// Design Name: 
// Module Name: control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.v"
module Control (
    input [4:0] instruction6_2,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite
);


    always @(*) begin
        if (instruction6_2 == 5'b01100) begin // R-type
             Branch = 0;
             MemRead = 0;
             MemtoReg = 0;
             ALUOp = 2'b10;
             MemWrite = 0;
             ALUSrc = 0;
             RegWrite = 1;
        end
        else if (instruction6_2 == 5'b00000) begin // LW
             Branch = 0;
             MemRead = 1;
             MemtoReg = 1;
             ALUOp = 2'b00;
             MemWrite = 0;
             ALUSrc = 1;
             RegWrite = 1;
        end
        else if (instruction6_2 == 5'b01000) begin // SW
             Branch = 0;
             MemRead = 0;
             MemtoReg = 1'bx;
             ALUOp = 2'b00;
             MemWrite = 1;
             ALUSrc = 1;
             RegWrite = 0;
        end
        else if (instruction6_2 == 5'b11000) begin // BEQ
             Branch = 1;
             MemRead = 0;
             MemtoReg = 1'bx;
             ALUOp = 2'b01;
             MemWrite = 0;
             ALUSrc = 0;
             RegWrite = 0;
        end
        else begin
             Branch = 0;
             MemRead = 0;
             MemtoReg = 0;
             ALUOp = 2'b00;
             MemWrite = 0;
             ALUSrc = 0;
             RegWrite = 0;
        end 
    end
    
endmodule
