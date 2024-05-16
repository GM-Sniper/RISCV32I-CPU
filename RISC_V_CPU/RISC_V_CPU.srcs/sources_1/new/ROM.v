`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//* Module: ROM.v
//* Project: RISCV_CPU
//* Author: Omar Ahmed Ganna,  omarganna@aucegypt.edu
//* Description: Built the ROM (program data) which is used to store instructions
//* Change history: 15/05/24:  Created the Program data
//////////////////////////////////////////////////////////////////////////////////

module program_ROM #(parameter width = 8,
parameter depth = 4096,
parameter filename = "assembly.txt",
parameter address_width = $clog2(depth))
(
input wire clk,
input wire [address_width-1:0] address,
output reg [31:0] data
); 
reg [width-1:0] memory [0:depth-1];


initial begin
    if(filename!=0) begin
        $readmemh("assembly.txt", memory);
        $display("name of file", filename);
        $display("Value of 8 bits" ,memory[address]);
    end
end
always @(posedge clk) begin
   // data<={memory[address+3],memory[address+2],memory[address+1],memory[address]};
   data<=32'b00000000011100000000000110010011;
end
endmodule
