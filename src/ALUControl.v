module ALUControl (
  input [1:0] ALUOp;
  input [5:0] op, funct;
  output [3:0] operation );

  always @(ALUOp or op or funct)
  begin
    case (ALUOp)
      2'b00: operation = 4'b0001 ;    /* ADD */
      2'b01: operation = 4'b0010 ;    /* SUB */
      2'b10:    /* R-Type Instructions */
        begin
          case (funct)
            6'b100000: operation = 4'b0000;    /* AND */
            6'b100001: operation = 4'b0001;    /* ADD */
            6'b100010: operation = 4'b0010;    /* SUB */
            6'b100011: operation = 4'b0011;    /* OR  */
            6'b100101: operation = 4'b0101;    /* SLL */
            6'b100110: operation = 4'b0110;    /* SRL */
            6'b101000: operation = 4'b1000;    /* SRA */
            6'b101001: operation = 4'b1001;    /* SLT */
          endcase
        end
      2'b11:    /* I-Type Instructions */
        begin
          case (op)
            6'b110001: operation = 4'b0001;    /* ADDI */
            6'b110000: operation = 4'b0000;    /* ANDI */
          endcase
        end
    endcase
  end

endmodule
