module k3(f, a, b, c, d);
input a, b, c, d;
output f;
assign f = (c|d)&(c|b)&(~a|~b|~c|~d);
endmodule;
