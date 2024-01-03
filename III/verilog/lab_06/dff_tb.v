`timescale 1ns/1ns
`include "dff.v"
module dff_tb;
reg d, clk, rst;
wire q;
parameter timeout = 200;
dff uut(d, clk, rst, q);
initial begin
    $dumpfile("dff_tb.vcd");
    $dumpvars(0, dff_tb);
    clk = 0;
    forever #20 clk = ~clk;
end
initial begin
    d = 0; rst = 0; #20
    d = 0; rst = 1; #20
    d = 1; rst = 0; #20
    d = 1; rst = 0; #20
    d = 0; rst = 0; #20
    d = 1; rst = 1; #20
    d = 0; rst = 1; #20
    #(timeout) $finish;
end
endmodule
