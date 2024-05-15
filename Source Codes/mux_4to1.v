`timescale 1ns / 1ps

/***********************
*
* Module: mux_4to1.v
* Project: RISCV_CPU
* Author: Mohamed Abdelfatah Khaled, mohamedabdelfatah572@aucegypt.edu
* Description: This module is the mux_4to1, which is responsible for  
* select between 4 inputs and select based on the sel signal.
* Change history: 15/05/24:  Created the mux_4to1 module  
* 		  
************************/

// we will need to modify it based on the input and output needed


module mux_4to1 (
    input wire in0, in1, in2, in3,
    input wire [1:0] sel,
    output reg out
);

    always @(sel) begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = 1'b0; 
        endcase
    end
endmodule
