`include "dff.v"
module johnson(clk, rst, out);
input clk, rst;
output [4:0] out;
dff d4(~out[0], clk, rst, out[4]);
dff d3(out[4], clk, rst, out[3]);
dff d2(out[3], clk, rst, out[2]);
dff d1(out[2], clk, rst, out[1]);
dff d0(out[1], clk, rst, out[0]);
endmodule
