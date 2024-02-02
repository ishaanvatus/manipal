`include "decoder2to4.v"
module decoder4to16(en, s, y);
input en;
input [3:0] s;
output [15:0] y;
wire [0:3] w;
decoder2to4 out0(en, s[3:2], w);
decoder2to4 out1(w[0], s[1:0], y[15:12]);
decoder2to4 out2(w[1], s[1:0], y[11:8]);
decoder2to4 out3(w[2], s[1:0], y[7:4]);
decoder2to4 out4(w[3], s[1:0], y[3:0]);
endmodule
