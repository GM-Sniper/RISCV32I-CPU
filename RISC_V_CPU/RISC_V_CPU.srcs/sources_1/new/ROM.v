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
    if (filename != 0) begin
        $readmemb("C:/Users/Omar Ganna/AUC/Digital 1/RISCV32I-CPU/assembly.txt", memory);
        $display("Value of 1-8 bits", memory[address]);
        $display("Value of 1-8 bits", memory[address+1]);
        $display("Value of 1-8 bits", memory[address+2]);
        $display("Value of 1-8 bits", memory[address+3]);
        $display("sfnsm,dnfkmsdn,mfnmdsnfwkdbc ", {memory[address+3],memory[address+2],memory[address+1],memory[address]});
        data={memory[address+3],memory[address+2],memory[address+1],memory[address]};
        $display("jfhdksjdlkf  ", data);
    end
end

//assign data2=memory[address];
//always @(*) begin 
////    data<={memory[address+3],memory[address+2],memory[address+1],memory[address]};
////   data<=32'b00000000011100000000000110010011;
        
//end
endmodule
