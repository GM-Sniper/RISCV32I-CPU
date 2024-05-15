`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 06:31:50 PM
// Design Name: 
// Module Name: CPU
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


module CPU(
    input clk,
    input rst,
    output [31:0] data
    );
    wire clk_out;
    clk_div #(1000000) cl(.clk(clk),.rst(rst),.out_clk(clk_out));
    wire [11:0] programCounter;
    wire [11:0] programOutput;
    wire [31:0] instructions;
    wire [31:0] A_data;
    wire [31:0] B_data;
    wire RegWrite;//
    wire MemtoReg;//
    wire MemWrite;//
    wire MemRead;//
    wire Branch;//
    wire [1:0] Jump;//
    wire  ALUSrc;
    wire LUI;
    wire AUIPC;
    wire [6:0] detect; // 7-bit output anodes
    wire [3:0] anode;   
    wire ZFlag,NFlag,CFlag, OFlag;
    wire ALUresult;
    tocounter pc(2'b00,programCounter,32'd0,32'd0,programOutput);
    
    program_ROM#(8,4096,"assembly.txt") test(clk_out,programOutput,instructions);
    
    control_Unit cu(.opcode(instructions[6:0]),.RegWrite(RegWrite),.MemtoReg(MemtoReg),.MemWrite(MemWrite),
    .MemRead(MemRead),.Branch(Branch),.Jump(Jump),.ALUSrc(ALUsrc),.AUIPC(AUIPC),.detect(detect),.anode(anode));
    
    registerFile rgf(.clk(clk),.rst(rst),.Rs1_data(A_data),.Rs2_data(B_data),.Write_Rd_data(data),.Rs1_addr(instructions[19:15]),.Rs2_addr(instructions[24:20]),.Rd_addr(instructions[11:7]),.writeControl(Regwrite));
    wire [31:0]in1,in2, temp;
    immGen imgen(.instructions(instruction),.immediate(temp));
    
    assign in1 = (AUIPC) ? programCounter : A_data;
    assign in2 = (ALUSrc)? temp : B_data;
    
    ALU al(.A(in1),.B(in2),.ALUop(ALUSrc),.Result(data),.ZFlag(ZFalg),.NFlag(Nfalg),.CFlag(CFlag),.OFlag(OFlag));    
endmodule
