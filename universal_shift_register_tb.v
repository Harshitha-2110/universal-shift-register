`timescale 1ns/1ps

module universal_shift_register_tb;

    reg clk;
    reg reset;
    reg [1:0] sel;
    reg serial_in_left;
    reg serial_in_right;
    reg [3:0] parallel_in;

    wire [3:0] q;

    universal_shift_register uut (
        .clk(clk),
        .reset(reset),
        .sel(sel),
        .serial_in_left(serial_in_left),
        .serial_in_right(serial_in_right),
        .parallel_in(parallel_in),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, universal_shift_register_tb);

        clk = 0;
        reset = 1;
        sel = 2'b00;
        serial_in_left = 0;
        serial_in_right = 0;
        parallel_in = 4'b0000;

        // Reset
        #10;
        reset = 0;

        // Parallel Load: 1010
        sel = 2'b11;
        parallel_in = 4'b1010;
        #10;

        // Hold
        sel = 2'b00;
        #10;

        // Shift Right
        sel = 2'b01;
        serial_in_left = 1;
        #10;

        // Shift Left
        sel = 2'b10;
        serial_in_right = 0;
        #10;

        // Parallel Load: 1100
        sel = 2'b11;
        parallel_in = 4'b1100;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | Reset=%b | Sel=%b | Parallel=%b | Q=%b",
                 $time, reset, sel, parallel_in, q);
    end

endmodule