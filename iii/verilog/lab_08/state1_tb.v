`timescale 1ns/1ns
`include "state1.v"
module state1_tb;
reg rst, in, clk;
wire [2:0] state; 
wire out;
state1 uut(state, in, out , clk, rst);
initial begin
    $dumpfile("state1_tb.vcd");
    $dumpvars(0, state1_tb);
    clk = 0; 
    forever #20 clk = ~clk;
end
initial begin
	rst = 1; in = 0; #20;
	rst = 0; in = 0; #20;
	in = 0; #20;
	in = 1; #20;
	in = 0; #20;
	in = 0; #20;
	in = 0; #20;
	in = 1; #20;
	in = 1; #20;
	in = 1; #20;
	in = 1; #20;
	$finish;
end
endmodule
