`timescale 1ns / 1ps

/***********************
*
* Module: Adder.v
* Project: RISCV_CPU
* Author: Mohamed Abdelfatah Khaled, mohamedabdelfatah572@aucegypt.edu
* Description: This module is the Adder, which is responsible for  
* adding 4 to the input or adding two inputs based on the sel signal.
* Change history: 15/05/24: 1:55 Created the Adder module  
* 		  15/05/24: 2:30 updated the Adder module to be able add 4 or 
*				  add two inputs based on the sel signal.		   
************************/

module Adder(
    input [11:0] in1,
    input [11:0] in2,
    input sel,    
    output [11:0] out   
);

    // Define 4 as a constant
    localparam [11:0] FOUR = 11'd4;

    // If sel is 1, add FOUR to in1; otherwise, add in1 and in2
    assign out = sel ? (in1 + FOUR) : (in1 + in2);	 

endmodule
