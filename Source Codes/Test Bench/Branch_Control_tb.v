`timescale 1ns / 1ps
/***********************
*
* Module: Branch_Control_tb.v
* Project: RISCV_CPU
* Author: Mohamed Abdelfatah Khaled, mohamedabdelfatah572@aucegypt.edu
* Description: This module is the control Branch test bench to test tje control Branch unit  
*
* Change history: 15/05/24: created the branch countrol test bench

************************/ 


module Branch_Control_tb();

reg [2:0] B_control;
reg Zflag, Oflag, Cflag, Nflag;
reg Branch;
wire BranchTaken;

// Instantiate the module under test
Branch_Control Branch_Control_inst (
    .B_control(B_control),
    .Zflag(Zflag),
    .Oflag(Oflag),
    .Cflag(Cflag),
    .Nflag(Nflag),
    .Branch(Branch),
    .BranchTaken(BranchTaken)
);

// Stimulus
initial begin
    // Case 1: BEQ
    B_control = 3'b000;
    Zflag = 1; Oflag = 0; Cflag = 0; Nflag = 0; Branch = 1;
    #5 Branch = 1'b0;
    #5 Branch = 1'b1;
    
    // Case 2: BNE
    B_control = 3'b001;
    Zflag = 0; Oflag = 0; Cflag = 0; Nflag = 0; Branch = 1;
    #5 Branch = 1'b1;
    
    // Case 3: BLT
    B_control = 3'b100;
    Zflag = 0; Oflag = 0; Cflag = 0; Nflag = 1; Branch = 1;
    #5 Branch = 1'b1;
    
    // Case 4: BGE
    B_control = 3'b101;
    Zflag = 0; Oflag = 0; Cflag = 0; Nflag = 0; Branch = 1;
    #5 Branch = 1'b1;
    
    // Case 5: BLTU
    B_control = 3'b110;
    Zflag = 0; Oflag = 0; Cflag = 1; Nflag = 0; Branch = 1;
    #5 Branch = 1'b1;
    
    // Case 6: BGEU
    B_control = 3'b111;
    Zflag = 0; Oflag = 0; Cflag = 0; Nflag = 0; Branch = 1;
    #5 Branch = 1'b1;

end



endmodule

