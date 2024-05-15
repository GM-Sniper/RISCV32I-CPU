`timescale 1ns / 1ps
/***********************
*
* Module: Adder_tb.v
* Project: RISCV_CPU
* Author: Mohamed Abdelfatah Khaled, mohamedabdelfatah572@aucegypt.edu
* Description: This module is the Adder, which is responsible for  
* testig adding 4 to the input or testing adding two inputs based on the sel signal.
* Change history: 15/05/24:  Created the Adder_rb module  
* 		   
*				 	   
************************/
module Adder_tb();

    // Signals
    reg [31:0] in1, in2;
    reg sel;
    wire [31:0] out;

    // Instantiate the Adder module
    Adder test(
        .in1(in1),
        .in2(in2),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Test adding 4 to in1 (sel = 1)
        in1 = 10;
        sel = 1;
        #10;  

        // Test adding in1 and in2 (sel = 0)
        in1 = 20;
        in2 = 30;
        sel = 0;
        #10;  

        $finish;
    end

endmodule
