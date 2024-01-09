`include "mux4to1.v"
`include "dff.v"
module regop(shift, load, serial, clk, I, A);
input shift, load, clk, serial;
input [3:0] I;
output [3:0] A;
wire [1:0] select = {shift, load};
wire [3:0] y;
mux4to1 m0(select, {serial, I[0], A[0], A[0]}, y[0]);
dff d0(y[0], clk, A[0]);
mux4to1 m1(select, {A[0], I[1], A[1], A[1]}, y[1]);
dff d1(y[1], clk, A[1]);
mux4to1 m2(select, {A[1], I[2], A[2], A[2]}, y[2]);
dff d2(y[2], clk, A[2]);
mux4to1 m3(select, {A[2], I[3], A[3], A[3]}, y[3]);
dff d3(y[3], clk, A[3]);
endmodule
