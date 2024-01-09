`include "mux8to1.v"
module graymux(g, b);
input [3:0] g;
output [3:0] b;
wire [2:0] sel;
wire [7:0] h3, h2, h1, h0;
assign h3 = {1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1};
assign h2 = {1'b0, 1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 1'b0};
assign h1 = {1'b0, 1'b1, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b1};
assign h0 = {g[0], ~g[0], ~g[0], g[0], ~g[0], g[0], g[0], ~g[0]};
assign sel = g[3:1];
mux8to1 bit3(sel, h3, b[3]);
mux8to1 bit2(sel, h2, b[2]);
mux8to1 bit1(sel, h1, b[1]);
mux8to1 bit0(sel, h0, b[0]);
endmodule
