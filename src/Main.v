`include "ALU.v"
`include "ALUControl.v"

module Main (
  input       [1:0]  aluOp,
  input       [31:0] instruction, muxOutA, muxOutB,
  output      [31:0] aluOut,
  output wire [3:0]  aluControlOutMain,
  output wire        overflow
  );

  /* Both R-Type and I-Type instructions. */
  wire [5:0] opCode = instruction[31:26];
  wire [4:0] rs = instruction[25:21];
  wire [4:0] rt = instruction[20:16];

  /* R-Type instructions. */
  wire [5:0] rd = instruction[15:11];
  wire [5:0] shamt = instruction[10:6];
  wire [5:0] funct = instruction[5:0];

  /* I-Type instructions. */
  wire [15:0] imm = instruction[15:0];

  ALUControl aluControl (
    .ALUOp(aluOp),
    .OpCode(opCode),
    .Funct(funct),
    .ALUControlOut(aluControlOutMain)
  );

  ALU alu (
    .MuxOutA(muxOutA),
    .MuxOutB(muxOutB),
    .ALUCtrlOut(aluControlOutMain),
    .ALUOut(aluOut),
    .Overflow(overflow)
  );

endmodule
