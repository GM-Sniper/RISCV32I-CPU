`timescale 1ns / 1ps
/***********************
*
* Module: Controlunit.v
* Project: RISCV_CPU
* Author: Omar Ahmed Ganna, omarganna@aucegypt.edu
* Description: This module is the control unit of the RISCV CPU
*
* Change history: 12/05/24

************************/


module ControlUnit (
    input [6:0] opcode,
    output reg [3:0] ALUControl,
    output reg RegWrite,//
    output reg MemtoReg,//
    output reg MemWrite,//
    output reg MemRead,//
    output reg Branch,//
    output reg [1:0] Jump,//
    output reg  ALUSrc,
    output reg LUI,
    output reg AUIPC,
    output [6:0] detect, // 7-bit output anodes
    output [3:0] anode
    );
reg test=1'b0;
always @(*) begin
    case(opcode[6:2])   
        5'b01100: begin //R-type
//             ALUControl = 4'b0111;
            RegWrite <= 1;
            MemtoReg <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            Branch <= 0;
            Jump <= 2'b00;
            ALUSrc <= 0;
            LUI <= 0;
            AUIPC <= 0;
        end
        5'b00100: begin//I-type
//             ALUControl = 4'b0111;
            RegWrite <= 1;
            MemtoReg <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            Branch <= 0;
            Jump <= 2'b00;
            ALUSrc <= 1;
            LUI <= 0;
            AUIPC <= 0;
        end
        5'b11000: begin //SB-type
//             ALUControl = 4'b0111;
            RegWrite <= 1;
            MemtoReg <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            Branch <= 1;
            Jump <= 2'b00;
            ALUSrc <= 1;
            LUI <= 0;
            AUIPC <= 0;
        end
        5'b00000: begin //U-type
//             ALUControl = 4'b0111;
            RegWrite <= 1;
            MemtoReg <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            Branch <= 0;
            Jump <= 2'b00;
            ALUSrc <= 1;
            LUI <= 1;
            AUIPC <= 0;
        end
        5'b01000: begin //S-type
//             ALUControl = 4'b0000;
            RegWrite <= 1;
            MemtoReg <= 0;
            MemWrite <= 1;
            MemRead <= 0;
            Branch <= 0;
            Jump <= 2'b00;
            ALUSrc <= 1;
            LUI <= 0;
            AUIPC <= 0;
        end
        5'b01101: begin 
//             ALUControl = 4'b0111;
            RegWrite <= 1;
            MemtoReg <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            Branch <= 0;
            Jump <= 2'b00;
            ALUSrc <= 1;
            LUI <= 1;
            AUIPC <= 0;
        end
        5'b00101: begin 
//             ALUControl = 4'b0111;
            RegWrite <= 1;
            MemtoReg <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            Branch <= 0;
            Jump <= 2'b00;
            ALUSrc <= 1;
            LUI <= 0;
            AUIPC <= 1;
        end
        5'b11011: begin //Jal
//             ALUControl = 4'b0111;
            RegWrite <= 1;
            MemtoReg <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            Branch <= 0;
            Jump <= 2'b01;
            ALUSrc <= 1;
            LUI <= 0;
            AUIPC <= 0;
        end
        5'b11001: begin //jalr
//             ALUControl = 4'b0111;
            RegWrite <= 1;
            MemtoReg <= 0;
            MemWrite <= 0;
            MemRead <= 0;
            Branch <= 0;
            Jump <= 2'b10;
            ALUSrc <= 1;
            LUI <= 0;
            AUIPC <= 0;
        end
        default: begin
            test<=1;
        end
endcase
end
assign detect=test ? 7'b0110000 : 7'b1111111; 
assign anode=4'b0111;
endmodule
