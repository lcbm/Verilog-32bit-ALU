module ALU (
  input       [31:0] MuxOutA, MuxOutB,
  input  wire [3:0]  ALUCtrlOut,
  output reg  [31:0] ALUOut,
  output reg         Overflow
  );

  always @(*)
  begin
    case (ALUCtrlOut)
      4'b0000:            ALUOut  <= MuxOutA & MuxOutB;                  /* AND  */
      4'b0000:            ALUOut  <= MuxOutA & MuxOutB;                  /* ANDI */
      4'b0001: {Overflow, ALUOut} <= MuxOutA + MuxOutB;                  /* ADD  */
      4'b0001: {Overflow, ALUOut} <= MuxOutA + MuxOutB;                  /* ADDI */
      4'b0010: {Overflow, ALUOut} <= MuxOutA - MuxOutB;                  /* SUB  */
      4'b0011:            ALUOut  <= MuxOutA | MuxOutB;                  /* OR   */
      4'b0101:            ALUOut  <= MuxOutB << MuxOutA;                 /* SLL  */
      4'b0110:            ALUOut  <= $unsigned (MuxOutB) >>  MuxOutA;    /* SRL  */
      4'b1000:            ALUOut  <= $signed   (MuxOutB) >>> MuxOutA;    /* SRA  */
      4'b1001:            ALUOut  <= MuxOutA < MuxOutB ? 1 : 0;          /* SLT  */
    endcase
  end

endmodule