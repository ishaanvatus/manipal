`include "tff.v"
module seq3(clk, rst, out);
input clk, rst;
output [3:1] out;
assign b3 = out[3];
assign b2 = out[2];
assign b1 = out[1];
tff t3(b3^b2, clk, rst, out[3]);
tff t2(b1^b2, clk, rst, out[2]);
tff t1(~(b3^b1), clk, rst, out[1]);
endmodule
