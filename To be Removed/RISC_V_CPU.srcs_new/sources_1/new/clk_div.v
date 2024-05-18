`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 07:36:21 PM
// Design Name: 
// Module Name: clk_div
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


module clk_div #(parameter n=5000000)(
    input clk,
    input rst,
    output reg out_clk
    );
parameter Width=$clog2(n);
reg [Width-1:0] count;

always @(posedge clk, posedge rst) begin
    if(rst)
        count<=32'b0;
    else if(count==n-1)
        count<=32'b0;
    else 
        count<=count+1;
end

always @(posedge clk, posedge rst)begin
    if(rst) out_clk<=0;
    else if(count==n-1) out_clk<=~out_clk;
end
endmodule
