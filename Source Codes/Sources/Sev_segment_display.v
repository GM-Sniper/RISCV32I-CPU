`timescale 1ns / 1ps
/***********************
*
* Module: Sec_segment_display.v
* Project: RISCV_CPU
* Author: Mohamed Abdelfatah Khaled, mohamedabdelfatah572@aucegypt.edu
* Description: This module responsible for displaying the results on the FBGA
* Change history: 16/05/24:  Created the Sev_segment_display module  
* 		   
*				 	   
************************/


module Sev_segment_display(input clk,input rst, input [3:0] units,tens,hundreds,thousands,
output reg [3:0] active_anode,output reg [6:0] seg);

reg [3:0]num;
reg[1:0] sel;

always @(posedge clk,posedge rst) begin////////e/rthg/brhrg/hrtg/h
       if(rst) sel<=2'b00;
       else if(sel==3) sel<=0;
       else sel<=sel+1;
end
always @(sel) begin
        case(sel)
            2'b00: num<=units;
            2'b01: num<=tens;
            2'b10: num<=hundreds;
            2'b11: num<=thousands;
    endcase
end

always@(sel)begin
    case(sel)
    0:active_anode=4'b1110;
    1: active_anode=4'b1101;
    2: active_anode=4'b1011;
    3: active_anode=4'b0111;
    endcase
end

always@(num) begin
case(num)
    0 : seg = 7'b0000001;
    1 : seg = 7'b1001111;
    2 : seg = 7'b0010010;
    3 : seg = 7'b0000110;
    4 : seg = 7'b1001100;
    5 : seg = 7'b0100100;
    6 : seg = 7'b0100000;
    7 : seg = 7'b0001111;
    8 : seg = 7'b0000000;
    9 : seg = 7'b0000100;
    default : seg = 7'b0110000; 
endcase
end
endmodule
