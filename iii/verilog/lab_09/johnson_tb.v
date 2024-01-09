`timescale 1ns/1ns
`include "johnson.v"
module johnson_tb;
reg clk, rst;
wire [4:0] out;
johnson uut(clk, rst, out);
initial begin
    $dumpfile("johnson_tb.vcd");
    $dumpvars(0, johnson_tb);
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
