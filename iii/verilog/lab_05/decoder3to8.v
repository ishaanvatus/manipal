`include "decoder2to4.v"
module decoder3to8(en, s, w);
input en;
input [2:0] s;
output [7:0] w;
decoder2to4 dlow(~s[2]&en, s[1:0], w[3:0]);
decoder2to4 dhigh(s[2]&en, s[1:0], w[7:4]);
endmodule
