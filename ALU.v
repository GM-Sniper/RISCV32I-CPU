`timescale 1ns / 1ps
/***********************
*
* Module: module_name.v
* Project: Project_Name
* Author: name and email
* Description: put your description here
*
* Change history: 01/01/17 – Did something
* 10/29/17 – Did something else
*
************************/
module ALU (
    input [31:0] A, B,
    input [3:0] ALUOp,  // {instruction[30],instruction[14:12]}
    output reg [31:0] Result,
    output  ZFlag,  NFlag, reg CFlag, reg OFlag
);

parameter ADD = 4'b0000;
parameter SUB = 4'b1001;  
parameter AND = 4'b0111; 
parameter OR = 4'b0110;
parameter XOR = 4'b0100;
parameter SLL = 4'b0001;
parameter SRL = 4'b0101;
parameter SRA = 4'b1101;
parameter SLT = 4'b0010;
parameter SLTU = 4'b0011;

assign ZFlag = (Result == 32'b0);
assign NFlag = (Result[31] == 1); 

always @ (*) begin
    case (ALUOp)
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
        SLTU: Result = (A < B) ? 1 : 0; 
        default: Result = 32'b0; 
    endcase
end

endmodule
