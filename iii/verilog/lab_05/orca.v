`include "decoder4to16.v"
module orca(f, a, b, c, d);
input a, b, c, d;
output f;
wire [15:0] q;
decoder4to16 d1(1'b1, {a, b, c, d}, q);
assign f = q[1]|q[4]|q[6]|q[8]|q[9]|q[13]|q[15];
endmodule
