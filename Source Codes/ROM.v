    module program_ROM #(parameter width = 8,
    parameter depth = 4096,
    parameter filename = "",
    parameter address_width = $clog2(depth))
    (
    input wire clk,
    input wire [address_width-1:0] address,
    output reg [width-1:0] data
    ); 

    reg [width-1:0] memory [0:depth-1];


    initial begin
        if(filename!=0) begin
            $readmemh(filename, memory);
        end
    end

    always @(posedge clk) begin
        data <= memory[address];
    end

    endmodule