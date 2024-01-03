`timescale 1ns/1ns
`include "jkff.v"
module jkff_tb;
reg j, k, clk, rst;
wire q;
parameter timeout = 500;
jkff uut(j, k, clk, rst, q);
initial begin
    $dumpfile("jkff_tb.vcd");
    $dumpvars(0, jkff_tb);
    clk = 0;
    forever #20 clk = ~clk;
end
initial begin
    #(timeout) $finish;
end
endmodule
