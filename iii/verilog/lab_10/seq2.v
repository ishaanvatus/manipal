`include "srff.v"
module seq2(clk, rst, out);
input clk, rst;
output [3:1] out;
assign b3 = out[3];
assign b2 = out[2];
assign b1 = out[1];
srff s3(~b2&~b1, ~b2&b1, clk, rst, out[3]);
srff s2(~b3&~b2, (b3&~b1)|(~b3&b2&b1),clk, rst, out[2]);
srff s1(~b1, (~b3&b1)|(b2&b1),clk, rst, out[1]);
endmodule
