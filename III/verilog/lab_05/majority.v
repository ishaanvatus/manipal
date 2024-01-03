`include "decoder3to8.v"
module majority(b, f);
input [2:0] b;
output f;
wire [7:0] g;
decoder3to8 major(1, b, g);
assign f = g[3]|g[5]|g[6]|g[7];
endmodule;
