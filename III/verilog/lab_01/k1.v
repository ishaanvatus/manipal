module k1(f, a, b, c, d);
input a, b, c, d;
output f;
assign f = c|(a&d);
endmodule;
