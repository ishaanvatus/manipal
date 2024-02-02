module k2(f, a, b, c, d);
input a, b, c, d;
output f;
assign f = (b & ~c)|(c & ~d);
endmodule;
