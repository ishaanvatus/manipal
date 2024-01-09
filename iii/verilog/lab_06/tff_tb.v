`timescale 1ns/1ns
`include "tff.v"
module tff_tb;
reg t, clk, rst;
wire q;
parameter timeout = 200;
tff uut(t, clk, rst, q);
initial begin
    $dumpfile("tff_tb.vcd");
    $dumpvars(0, tff_tb);
    clk = 0;
    forever #20 clk = ~clk;
end
initial begin
    t = 0; rst = 0; #20
    t = 0; rst = 1; #20
    t = 1; rst = 0; #20
    t = 1; rst = 0; #20
    t = 0; rst = 0; #20
    t = 1; rst = 1; #20
    t = 0; rst = 1; #20
    #(timeout) $finish;
end
endmodule
