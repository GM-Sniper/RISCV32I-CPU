`timescale 1ns / 1ps
/***********************
* Module: ALU.v
* Project: RISCV_CPU
* Author: Mohamed Abdelfatah Khaled, mohamedabdelfatah572@aucegypt.edu
* Description: This module is the ALU, which is responsible for performing arithmetic and logical
  operations. It outputs the Zflag, Nflag, Oflag, and Cflag.
*
* Change history: 12/05/24: created the first version of the ALU, but still need modifications  
*  15/05/24: update the descripiton of the module
*************************/
module ALU (
    input [31:0] A, B,
    input ALUop,
    input [3:0] ALUControl,  // {instruction[30],instruction[14:12]}
    output reg [31:0] Result,
    output  ZFlag,  NFlag, reg CFlag, reg OFlag
);

localparam  ADD = 4'b0000;//
localparam  SUB = 4'b1000;  
localparam  AND = 4'b0111; 
localparam  OR = 4'b0110;//
localparam  XOR = 4'b0100;//
localparam  SLL = 4'b0001;//
localparam  SRL = 4'b0101;//
localparam  SRA = 4'b1101;//
localparam  SLT = 4'b0010;//
localparam  SLTU = 4'b0011;//

assign ZFlag = (Result == 32'b0);
assign NFlag = (Result[31] == 1); 

always @ (*) begin
if(ALUop) begin
    case (ALUControl)
        ADD: begin
            Result = A + B; 
            CFlag = (Result < A) | (Result < B);
            OFlag = (A[31] == B[31]) & (Result[31] != A[31]);
        end
        SUB: begin
            Result = A - B; 
            CFlag = (A >= B);
            OFlag = (A[31] != B[31]) & (Result[31] != A[31]);
        end
        AND: Result = A & B; 
        OR: Result = A | B; 
        XOR: Result = A ^ B; 
        SLL: Result = A << B; 
        SRL: Result = A >> B; 
        SRA: Result = A >>> B; 
        SLT: Result = (A < B) ? 1 : 0; 
        SLTU: Result = (A < B) ? 1 : 0;//manage unsigned 
        default: begin
        if(ALUControl[2:0]==3'b000) Result = A + B;
        else if(ALUControl[2:0]==3'b010) Result = (A < B) ? 1 : 0;
        else if (ALUControl[2:0]==3'b011) Result = (A < B) ? 1 : 0;
        else if(ALUControl[2:0]==3'b100)Result = A ^ B;
        else if(ALUControl[2:0]==3'b110) Result = A | B;
        else if(ALUControl[2:0]==3'b111) Result = A & B;
        else Result = 32'b0;
        end  
    endcase
 end
else Result = A + B;
end
endmodule

