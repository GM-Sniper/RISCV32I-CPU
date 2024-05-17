`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 03:31:41 PM
// Design Name: 
// Module Name: tocounter
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


module tocounter(input [1:0] sel,
input [11:0] in0,
input [11:0] in1,
input [11:0] in2,
output reg [11:0] PC);


always @(sel) begin
    case(sel)
        2'b00: PC=in0[11:0];
        2'b01: PC=in1[11:0];
        2'b10: PC=in2[11:0];
 endcase
end
endmodule
