`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/15/2024 06:31:50 PM
// Design Name: 
// Module Name: CPU
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


module CPU(
    input clk,
    input rst,
    output [6:0] segments,
    output [3:0] anode
    );
    wire clk_out;
    wire clk_200;
    clk_div #(250000) clo(.clk(clk),.rst(rst),.out_clk(clk_200));
    clk_div #(1000000) cl(.clk(clk),.rst(rst),.out_clk(clk_out));
    reg [11:0] programCounter;
    wire [11:0] programOutput;
    wire [31:0] instructions;
    wire [31:0] A_data;
    wire [31:0] B_data;
    wire RegWrite;//
    wire MemtoReg;//
    wire MemWrite;//
    wire MemRead;//
    wire Branch;//
    wire [1:0] Jump;//
    wire  ALUSrc;
    wire LUI;
    wire AUIPC; 
    wire ZFlag,NFlag,CFlag, OFlag;
    wire ALUresult;
    parameter lol="assembl.txt";

//    tocounter pc(2'b00,programCounter,32'd0,32'd0,programOutput);
    
    program_ROM test(.clk(clk_out),.address(programOutput),.data(instructions));
    initial begin
        $display("hellllllllllllljdkflsjdfkls ",instructions);
    end    
    ControlUnit cu(.opcode(instructions[6:0]),.RegWrite(RegWrite),.MemtoReg(MemtoReg),.MemWrite(MemWrite),
    .MemRead(MemRead),.Branch(Branch),.Jump(Jump),.ALUSrc(ALUsrc),.AUIPC(AUIPC),.detect(segments),.anode(anode));
    
    registerFile rgf(.clk(clk),.rst(rst),.Rs1_data(A_data),.Rs2_data(B_data),.Write_Rd_data(data),.Rs1_addr(instructions[19:15]),.Rs2_addr(instructions[24:20]),.Rd_addr(instructions[11:7]),.writeControl(Regwrite));
    wire [31:0]in1,in2;
    wire  [11:0] immgenout;
    ImmGen imgen(.instructions(instruction),.immediate(immgenout));
    
    assign in1 = (AUIPC) ? programCounter : A_data;
    assign in2 = (ALUSrc)? immgenout : B_data;
    
    ALU al(.A(in1),.B(in2),.ALUop(ALUSrc),.Result(data),.ZFlag(ZFlag),.NFlag(Nflag),.CFlag(CFlag),.OFlag(OFlag));   
    reg [1:0] sel;
    reg [3:0] num;
    wire [3:0] units;
    wire [3:0] tens;
    wire [3:0] hundreds;
    wire [3:0] thousands;  
    always @(sel) begin
        case(sel)
            0: num=units;
            1: num=tens;
            2: num=hundreds;
            3: num=thousands;
          endcase
          end
 always @(posedge clk_200,posedge rst) begin
    if(rst) sel<=2'b00;
    else sel<=sel+1;
 end
 wire branching;
 wire addedPC;
 Sev_segment_display svg(.sel(sel),.num(num),.active_anode(anode),.seg(segments));   
 Branch_Control BC(.B_control(instructions[14:12]),.Zflag(ZFlag),.Nflag(Nflag),
 .Cflag(CFlag),.Oflag(OFlag),.Branch(Branch),.BranchTaken(branching));
 wire [11:0] shifted;
 wire  [11:0]tempcounter;
 shifter shift(.in(immgenout),.out(shifted));
 Adder ad(.in1(programCounter),.in2(shifted),.sel(branching),.out(addedPC));
 wire [1:0] sel2={(Jump[0]|Jump[1]),LUI};
 
 always @(sel2) begin
    case(sel2) 
        2'b00: programCounter=addedPC;
        2'b01: programCounter=shifted;
        2'b10: programCounter=11'd0;
    endcase
 end
endmodule
