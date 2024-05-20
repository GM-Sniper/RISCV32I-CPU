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
input wire  clk, 
input wire [address_width-1:0] address,
output reg  [31:0] data 
);  
reg [width-1:0] memory [0:depth-1]; 


initial begin
    if (filename != 0) begin
        $readmemb("C:/Users/Omar Ganna/project_2/assembly2.txt", memory);
        $display("diofskldfusfpd   ", memory[0]);
    end   
end

always @(posedge clk ) begin
    data[7:0]<=memory[address];
    data[15:8]<=memory[address+1];
    data[23:16]<=memory[address+2];
    data[31:24]<=memory[address+3];
end
endmodule
