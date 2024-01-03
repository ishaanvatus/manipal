`timescale 1ns/1ns
`include "seq1.v"
module seq1_tb;
reg rst, clk;
wire [3:1] out; 
seq1 uut(clk, rst, out);
initial begin
    $dumpfile("seq1_tb.vcd");
    $dumpvars(0, seq1_tb);
    clk = 0; 
    forever #20 clk = ~clk;
end
initial begin
	rst = 0; #20;
	rst = 1; #20;
	rst = 0; #360;
	$finish;
end
endmodule
