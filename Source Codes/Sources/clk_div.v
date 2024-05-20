`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//* Module: clk_div.v
//* Project: RISCV_CPU
//* Author: Omar Ahmed Ganna
//* Description: This module is used to divide the clock frequency to a certain value
//* Change history: 12/05/24:  Created the Program data
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
