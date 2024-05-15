`timescale 1ns / 1ps

/***********************
*
* Module: memory_data.v
* Project: RISCV_CPU
* Author: Mohamed Abdelfatah Khaled, mohamedabdelfatah572@aucegypt.edu
* Description: This module is the memory_data, which is responsible for  
* store and read the data.
* Change history: 15/05/24:  Created the memory_data module  
* 		  
*				  		   
************************/



module memory_data # (parameter WIDTH=8, 
    parameter DEPTH=256, 
    parameter INIT_F="",
    parameter ADDRW=$clog2(DEPTH))
    (
    input wire  clk,                      
    input wire  write_data,               
    input wire  [ADDRW-1:0] addr_write,    
    input wire [ADDRW-1:0] addr_read,     
    input wire  [WIDTH-1:0] data_in,       
    output   reg  [WIDTH-1:0] data_out       
    );

reg [WIDTH-1:0] memory [0:DEPTH-1];

    initial begin
        if (INIT_F != 0) begin
            $display("Loading memory init file '%s' into bram_basic.", INIT_F);
            $readmemh(INIT_F, memory);
        end
    end

    always @(posedge clk) begin
        if (write_data) begin
            memory[addr_write] <= data_in;
        end
    end

     always @(posedge clk) begin
        data_out <= memory[addr_read];
    end

endmodule
