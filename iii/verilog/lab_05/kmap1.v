`include "mux4to1.v"
module kmap1(a, b, c, d, f);
input a, b, c, d;
output f;
wire [3:0] in;
wire [1:0] sel;
assign in[0] = (~c&d)|(~d);
assign in[1] = ~d;
assign in[2] = ~c&d;
assign in[3] = ~d;
assign sel = {a, b};
mux4to1 mux1(sel, in, f);
endmodule
