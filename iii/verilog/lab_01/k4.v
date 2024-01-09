module k4(f, a, b, c, d);
input a, b, c, d;
output f;
assign f = (~c|d)&(a|~b|c|~d)&(~a|b|c);
endmodule;
