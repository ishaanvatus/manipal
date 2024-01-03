`include "dff.v"
module state1(state, in, out, clk, rst);
input in, clk, rst;
output [2:0] state;
output out;
wire a, b, c, x;
assign a = state[2];
assign b = state[1];
assign c = state[0];
assign x = in;
dff da((~a&b&~c&~x)|(a&~b&~c&~x), clk, rst, state[2]);
dff db((~a&~b&~x)|(~a&b&x), clk, rst, state[1]);
dff dc((~a&~b&~c)|(~a&b&c&~x), clk, rst, state[0]);
assign out = (~a&b&~c&~x)|(~a&b&c)|(a&~b&~x);
endmodule
