`timescale 1ns / 1ps

/***********************
*
* Module: ImmGen.v
* Project: RISCV_CPU
* Author: Ramy Shehata, ramyshehata65@aucegypt.edu
* Description: This module is the immediate generator for getting the immediate from the instruction
*
* Change history: 13/05/24-> finished the immediate Generator with no default case
		14/05/24-> Added default case
        15/05/24-> Added the sign extend bit
************************/
module ImmGen(input [31:0] instructions, output reg [31:0] immediate);
wire [6:0] opcode;
assign opcode=instructions[6:0];
always @ (*) begin
case(opcode)
3:  immediate={20'd0,instructions[31:20]};
19: begin 
    if(instructions [14:12]==3'b001 ||instructions [14:12]==3'b101)   
        immediate={{27{instructions[24]}},instructions[24:20]};
    else
    immediate={{20{instructions[31]}},instructions[31:20]};

end
23: immediate={{12{instructions[31]}},instructions[31:12]};
35: immediate={{20{instructions[31]}},instructions[31:25],instructions[11:7]};
55: immediate ={instructions[31:12],12'd0};
99: immediate={{20{instructions[31]}},instructions[31],instructions[7],instructions[30:25],instructions[11:8]};
103: immediate={{20{instructions[31]}},instructions[31:20]};
111: immediate={{12{instructions[31]}},instructions[31],instructions[19:12],instructions[20],instructions[30:21]};
default: immediate=32'b0;
endcase
end
endmodule
