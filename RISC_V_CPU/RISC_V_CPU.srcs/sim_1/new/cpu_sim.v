`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2024 09:38:04 PM
// Design Name: 
// Module Name: cpu_sim
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


module cpu_sim();
reg clk;
reg rst;
wire [6:0] segments;
wire [3:0] anodes;
wire [31:0] data;
wire [11:0] programCounter;

CPU cp(.clk(clk),.rst(rst),.segments(segments),.anode(anodes),.data(data),.programCounter(programCounter));
initial begin
clk=0;
forever #25 clk=~clk;
end
initial begin 
 rst=0;

end
endmodule
