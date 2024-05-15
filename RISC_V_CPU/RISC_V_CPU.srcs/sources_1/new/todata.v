`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////


module todata(
input [1:0] sel,
input [31:0]in0, //The data coming from the combinational logic
input [31:0]in1, // The data coming from the immediate generater
input [11:0]in2, //The data coming from programcounter+4
output reg [31:0]data
);

always @(sel) begin
    case(sel)
        2'b00: data=in0;//neither jump nor LUI
        2'b01: data=in1;// LUI
        2'b10: data=in2;// Jumping (can be either JAL or JALR)
      endcase
 end 
endmodule
