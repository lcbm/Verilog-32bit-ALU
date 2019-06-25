module ALU (
  input [3:0] ALUOp,
  input [31:0] MuxOutA, MuxOutB,
  output [31:0] ALUOut
  output overflow );

  assign RS = MuxOutA;       /* output from MUX A. */
  assign RT = MuxOutB;       /* output from MUX B. */
  assign ALUOut = result;    /* ALU's output, or operation result. */

  always @(ALUOp or RS or RT)
  begin
    case (ALUOp)
      /* for shift operations, RS will take the shift amount (shamt). */
      4'b0000: result = RS + RT;            /* ADD  */
      4'b0001: result = RS + RT;            /* ADDI */
      4'b0010: result = RS - RT;            /* SUB  */
      4'b0011: result = RS & RT;            /* AND  */
      4'b0100: result = RS & RT;            /* ANDI */
      4'b0101: result = RS | RT;            /* OR   */
      4'b0110: result = RT << RS;           /* SLL  */
      4'b0111: result = RT >> RS;           /* SRL  */
      4'b1000: result = RT >>> RS;          /* SRA  */
      4'b1001: result = RS < RT ? 1 : 0;    /* SLT  */
    endcase
  end

endmodule
