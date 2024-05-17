`timescale 1ns / 1ps
module testbench;

    // Parameters
    parameter width = 8;
    parameter depth = 4096;
    parameter filename = "assembly.txt";
    parameter address_width = $clog2(depth);

    // Signals
    reg clk;
    reg [address_width-1:0] address;
    wire [31:0] data;

    // Instantiate the ROM module
    program_ROM #(width, depth, filename, address_width) ROM_inst (
        .clk(clk),
        .address(address),
        .data(data)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test stimulus
    initial begin
        // Initialize clock
        clk = 0;

        // Provide some address values and observe data
        address = 0;
        #10;
        address = 1;
        #10;
        address = 2;
        #10;

        // Add more test cases as needed
    end

    // Monitor
    always @(posedge clk) begin
        $display("At time %t, address = %d, data = %h", $time, address, data);
    end

endmodule
