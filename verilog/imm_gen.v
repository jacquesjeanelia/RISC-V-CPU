`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2025 02:13:35 PM
// Design Name: 
// Module Name: immediate_generator
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
module immediate_generator (
    input [31:0] instruction,
    output reg [31:0] immediate
);

    always@(*)begin
        if (instruction[6] == 1'b1) begin // SB-type
            immediate = {{20{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8]};
        end
        else if (instruction[5] == 1'b1) begin // S-type
            immediate = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
        end
        else begin // I-type
            immediate = {{20{instruction[31]}}, instruction[31:20]};
        end
    end
    
endmodule