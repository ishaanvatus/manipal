`timescale 1ns/1ns
`include "shiftreg6bit.v"
module shiftreg6bit_tb;
reg load, clk;
wire [6:1] data;
parameter timeout = 500;
shiftreg6bit uut(load, clk, data);
initial begin
    $dumpfile("shiftreg6bit_tb.vcd");
    $dumpvars(0, shiftreg6bit_tb);
    clk = 0;
    forever #20 clk = ~clk;
end
initial begin
    load = 1; #20;
    #(timeout) $finish;
end
endmodule
