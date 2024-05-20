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
    parameter INIT_F="C:/Users/Omar Ganna/project_2/memory1.txt",
    parameter ADDRW=$clog2(DEPTH))
    (
    input wire  clk,                      
    input wire  write_data, 
    input wire read_data,              
    input wire  [ADDRW-1:0] addr,
    input wire  [2:0] sel,         
    input wire  [31:0] data_in,       
    output reg  [31:0] data_out       
    );

reg [WIDTH-1:0] memory [0:DEPTH-1];

    initial begin
        if (INIT_F != 0) begin
            $display("C:/Users/Omar Ganna/project_2/memory1.txt", INIT_F);
            $readmemh(INIT_F, memory);
        end
    end

always @(*) begin
        if (write_data) begin
            case(sel)
                3'b000: memory[addr]=data_in[7:0];
                3'b001: begin
                    memory[addr]=data_in[7:0];
                    memory[addr+1]=data_in[15:8];
                end
                3'b010: begin
                memory[addr]=data_in[7:0];
                memory[addr+1]=data_in[15:8];
                memory[addr+2]=data_in[23:16];
                memory[addr+3]=data_in[31:24];
                end
            endcase
            end
         else if(read_data) begin
            case(sel)
                3'b000: begin
                    data_out[7:0]=memory[addr];
                    data_out[31:8]={24{data_out[7]}};
                end 
                3'b001: begin
                    data_out[7:0]=memory[addr];
                    data_out[15:8]=memory[addr+1];
                    data_out[31:16]={16{data_out[15]}};
                end
                3'b010: begin
                data_out[7:0]=memory[addr];
                data_out[15:8]=memory[addr+1];
                data_out[23:16]=memory[addr+2];
                data_out[31:24]=memory[addr+3];
                end
                3'b100: data_out={24'd0,memory[addr]};
                3'b101: data_out={16'd0,memory[addr+1],memory[addr]};
            endcase
 end           
end
endmodule
