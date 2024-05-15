`timescale 1ns / 1ps
/***********************
* Module: ALU_tb.v
* Project: RISCV_CPU
* Author: Mohamed Abdelfatah Khaled, mohamedabdelfatah572@aucegypt.edu
* Description: This module is the ALU, which is responsible for testing the ALU
*
* Change history: 12/05/24: created the first version of the ALU_tb, but still need modifications  
*  15/05/24: update the descripiton of the module
*
************************/

module ALU_tb();
localparam ADD = 4'b0000;
localparam SUB = 4'b1001;  
localparam AND = 4'b0111; 
localparam OR = 4'b0110;
localparam XOR = 4'b0100;
localparam SLL = 4'b0001;
localparam SRL = 4'b0101;
localparam SRA = 4'b1101;
localparam SLT = 4'b0010;
localparam SLTU = 4'b0011;

reg [31:0] rs1, rs2;
reg [3:0] ALUControl;
wire [31:0] Result;
wire ZFlag, NFlag, CFlag, OFlag;

ALU test (
    .data1(rs1),
    .data2(rs2),
    .ALUControl(ALUControl),
    .Result(Result),
    .ZFlag(ZFlag),
    .NFlag(NFlag),
    .CFlag(CFlag),
    .OFlag(OFlag)
);

initial begin
    // Test ADD operation
    rs1 = 5;
    rs2 = 7;
    ALUControl = ADD;
    #10;


//    // Test SUB operation
    rs1 = 10;
    rs2 = 3;
    ALUControl = SUB;
    #10;

    // Test AND operation
    rs1 = 5;
    rs2 = 3;
    ALUControl = AND;
    #10;


//    // Test OR operation
    rs1 = 5;
    rs2 = 3;
    ALUControl = OR;
    #10;


    // Test XOR operation
    rs1 = 5;
    rs2 = 3;
    ALUControl = XOR;
    #10;

    // Test SLL operation
    rs1 = 5;
    rs2 = 2;
    ALUControl = SLL;
    #10;

    // Test SRL operation
    rs1 = 20;
    rs2 = 2;
    ALUControl = SRL;
    #10;

    // Test SRA operation
    rs1 = 5;
    rs2 = 7;
    ALUControl = SRA;
    #10;

    // Test SLT operation
    rs1 = 5;
    rs2 = 7;
    ALUControl = SLT;
    #10;

    // Test SLTU operation
    rs1 = -5;
    rs2 = 7;
    ALUControl = SLTU;
    #10;
  
      $finish;

end

endmodule
