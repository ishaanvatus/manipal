/*
* upcounter using tff
* posedge, active high
*/
`include "tff.v"
module upcounter(clk, rst, out);
input clk, rst; output [3:0] out;
tff t0(1'b1, ~clk, rst, out[0]);
tff t1(1'b1, ~out[0], rst, out[1]);
tff t2(1'b1, ~out[1], rst, out[2]);
tff t3(1'b1, ~out[2], rst, out[3]);
endmodule
