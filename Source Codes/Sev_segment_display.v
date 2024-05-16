`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2024 07:20:33 PM
// Design Name: 
// Module Name: Sev_segment_display
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Sev_segment_display( input [1:0] sel, input[3:0] num,output reg [3:0] active_anode,output reg [6:0] seg);

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
    
    default : seg = 7'b1111111; 

endcase
end

endmodule
