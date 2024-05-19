`timescale 1ns / 1ps
/***********************
*
* Module: Branch_Control.v
* Project: RISCV_CPU
* Author: Mohamed Abdelfatah Khaled, mohamedabdelfatah572@aucegypt.edu
* Description: This module is the control Branch unit to control the branching of the RISC_V 
*
* Change history: 15/05/24: created the branch countrol unit

************************/ 


module Branch_Control(  input [2:0] B_control,
    input Zflag, Oflag, Cflag, Nflag,
    input Branch,
    output reg BranchTaken
);

// Define branch conditions based on B_control
localparam BEQ = 3'b000;
localparam BNE = 3'b001;
localparam BLT = 3'b100;
localparam BGE = 3'b101;
localparam BLTU = 3'b110;
localparam BGEU = 3'b111;



always @ (*) begin
    // Check if branching is required based on B_control and flags
//    if(Branch==0)BranchTaken=0;
//    else if(B_control==BEQ)BranchTaken=Zflag;
//    else
//    BranchTaken=0;
     
//    end
    case (B_control)
        BEQ: 
            BranchTaken = Branch & Zflag;
        
        BNE: 
            BranchTaken = Branch & !Zflag;
        BLT: 
            BranchTaken = Branch & (Nflag != Oflag);
        BGE:                                                                                    
            BranchTaken = Branch & (Nflag==Oflag);
        BLTU: 
            BranchTaken = Branch & !Cflag;
        BGEU: 
            BranchTaken = Branch & (Cflag);
        default: 
            BranchTaken = 0;
    endcase
end

endmodule