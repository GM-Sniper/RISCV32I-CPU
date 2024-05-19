`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 04:58:35 PM
// Design Name: 
// Module Name: data_display
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


module data_display(
    input [31:0] data,
    output [3:0] units,
    output [3:0] tens,
    output [3:0] hundreds,
    output [3:0] thousands
    );
assign units=data%10;
assign tens=(data/10)%10;
assign hundreds=(data/100)%10;
assign thousands=(data/1000)%10;
endmodule
