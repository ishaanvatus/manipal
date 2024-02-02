module example1(f, x1, x2, x3);
inputs x1, x2, x3;
outputs f;
assign f = (x1&x2)|(~x2 & x3);
endmodule;
