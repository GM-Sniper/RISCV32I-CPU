`timescale 1ns / 1ps

/***********************
*
* Module: RegFile.v
* Project: RISCV_CPU
* Author: Ramy Shehata, ramyshehata65@aucegypt.edu
* Description: This module is the Register File that stores and processes data for the RISC-V CPU
* It has 32 32-bit registers from x0 (=zero) to x31, and can read from and write to them
* Change history: 14/05/24-> finished the registerfile module, needs testing and synthesis

************************/

module registerFile
(clk, rst, Rs1_data, Rs2_data, Write_Rd_data, 
Rs1_addr, Rs2_addr, Rd_addr, writeControl);
input clk, rst;
output[31:0] Rs1_data, Rs2_data;
input[31:0] Write_Rd_data;
input[4:0] Rs1_addr, Rs2_addr, Rd_addr;
input writeControl;
// declaring array of 32 32-bit registers - Register File
reg[31:0] Registers[0:31];
// Reading registers
localparam[31:0] ZERO = 32'd0;
assign Rs1_data = Registers[Rs1_addr];
assign Rs2_data = Registers[Rs2_addr];
// Writing to a register
integer i; 

always @ (*) begin
Registers[0] = 32'd0;
if(rst == 0)begin
    if(Rd_addr&&writeControl)
        Registers[Rd_addr] = Write_Rd_data;
    else
        $display("Cannot write x0 register");
 end
  else 
    $display("rst");
  end
endmodule