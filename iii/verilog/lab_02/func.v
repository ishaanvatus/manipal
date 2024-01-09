module func(f, a, b, c, d);
input a, b, c, d;
output f;
wire i1, i2;
assign i1 = c^d;
assign i2 = ~i1;
assign f = (a&i1) | (b&i2);
endmodule
