`timescale 1ns/1ns
`include "seq3.v"
module seq3_tb;
reg rst, clk;
wire [3:1] out; 
seq3 uut(clk, rst, out);
initial begin
    $dumpfile("seq3_tb.vcd");
    $dumpvars(0, seq3_tb);
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
