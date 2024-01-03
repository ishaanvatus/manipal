`include "tff.v"
module state2(state, in, clk, rst);
input in, clk, rst;
output [1:0] state;
wire a, b;
assign a = state[1];
assign b = state[0];
tff ta((~a&b)|(b&~in), clk, rst, state[1]);
tff tb((~b&~in)|(a&~in)|(~a&b&in), clk, rst, state[0]);
endmodule
