`include "jkff.v"
module seq1(clk, rst, out);
input clk, rst;
output [3:1] out;
assign b3 = out[3];
assign b2 = out[2];
assign b1 = out[1];
jkff j3(b2, b2&b1, clk, rst, out[3]);
jkff j2(b1, ~b3|b1, clk, rst, out[2]);
jkff j1(~b2|b3, 1'b1, clk, rst, out[1]);
endmodule
