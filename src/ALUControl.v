module ALUControl (
  input       [1:0] ALUOp,
  input       [5:0] OpCode,
  input       [5:0] Funct,
  output reg  [3:0] ALUControlOut
  );

  always @(*)
  begin
    case (ALUOp)
      2'b00: ALUControlOut <= 4'b0001;    /* ADD */
      2'b01: ALUControlOut <= 4'b0010;    /* SUB */
      2'b10:    /* R-Type Instructions. */
        begin
          case (Funct)
            6'b100000: ALUControlOut <= 4'b0000;    /* AND */
            6'b100001: ALUControlOut <= 4'b0001;    /* ADD */
            6'b100010: ALUControlOut <= 4'b0010;    /* SUB */
            6'b100011: ALUControlOut <= 4'b0011;    /* OR  */
            6'b100101: ALUControlOut <= 4'b0101;    /* SLL */
            6'b100110: ALUControlOut <= 4'b0110;    /* SRL */
            6'b101000: ALUControlOut <= 4'b1000;    /* SRA */
            6'b101001: ALUControlOut <= 4'b1001;    /* SLT */
          endcase
        end
      2'b11:    /* I-Type Instructions. */
        begin
          case (OpCode)
            6'b110000: ALUControlOut <= 4'b0000;    /* ANDI */
            6'b110001: ALUControlOut <= 4'b0001;    /* ADDI */
          endcase
        end
    endcase
  end

endmodule