`include "dff.v"
module shiftreg6bit(load, clk, data);
input load, clk;
output[6:1] data;
dff d1(load, clk, data[1]);
dff d2(data[1], clk, data[2]);
dff d3(data[2], clk, data[3]);
dff d4(data[3], clk, data[4]);
dff d5(data[4], clk, data[5]);
dff d6(data[5], clk, data[6]);
endmodule
