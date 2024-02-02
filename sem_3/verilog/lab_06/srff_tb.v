`timescale 1ns/1ns
`include "srff.v"
module srff_tb;
reg s, r, clk, rst;
wire q;
parameter timeout = 500;
srff uut(s, r, clk, rst, q);
initial begin
    $dumpfile("srff_tb.vcd");
    $dumpvars(0, srff_tb);
    clk = 0;
    forever #20 clk = ~clk;
end
initial begin
    #(timeout) $finish;
end
endmodule
