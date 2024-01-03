`timescale 1ns/1ns
`include "ringcounter.v"
module ringcounter_tb;
reg clk, rst;
wire [3:0] out;
ringcounter uut(clk, rst, out);
initial begin
    $dumpfile("ringcounter_tb.vcd");
    $dumpvars(0, ringcounter_tb);
    clk = 0;
    forever #20 clk = ~clk;
end
initial begin
    rst = 1; #20;
    rst = 1; #20;
    rst = 0; #20;
    rst = 0; #20;
    rst = 0; #20;
    rst = 0; #20;
    rst = 0; #20;
    rst = 0; #20;
    rst = 1; #20;
    rst = 1; #20;
    $finish;
end
endmodule
