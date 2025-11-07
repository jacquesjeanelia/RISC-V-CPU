`include "defines.v"
module branch_control (
    input Branch,
    input [2:0] function3,
    input zero_flag, carry_flag, overflow_flag, sign_flag,
    output wire branch_sel
);

    always @(*) begin
        if (Branch) begin
            case (function3)
                3'b000: branch_sel = zero_flag;               // BEQ
                3'b001: branch_sel = ~zero_flag;              // BNE
                3'b100: branch_sel = sign_flag != overflow_flag; // BLT
                3'b101: branch_sel = (sign_flag == overflow_flag); // BGE
                3'b110: branch_sel = ~carry_flag;            // BLTU
                3'b111: branch_sel = carry_flag;             // BGEU
                default: branch_sel = 1'b0;
            endcase
        end
        else begin
            branch_sel = 1'b0;
        end
    end

endmodule