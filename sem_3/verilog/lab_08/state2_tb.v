`timescale 1ns/1ns
`include "state2.v"
module state2_tb;
reg in, clk, rst;
wire [1:0] state; 
state2 uut(state, in , clk, rst);
initial begin
    $dumpfile("state2_tb.vcd");
    $dumpvars(0, state2_tb);
    clk = 0; 
    forever #20 clk = ~clk;
end
initial begin
	rst = 1; in = 0; #20;
	rst = 0; in = 1; #20;
	in = 0; #20;
	in = 1; #20;
	in = 0; #20;
	in = 0; #20;
	in = 1; #20;
	in = 0; #20;
	$finish;
end
endmodule
