module three_bit_mult(m, q, p);
input[2:0] m, q;
output[5:0] p;
wire [2:0] aq0, aq1, aq2;
wire [2:0] s1;
wire [3:1] c1, c2;
assign aq0[0] = m[0] & q[0];
assign aq0[1] = m[1] & q[0];
assign aq0[2] = m[2] & q[0];
assign aq1[0] = m[0] & q[1];
assign aq1[1] = m[1] & q[1];
assign aq1[2] = m[2] & q[1];
assign aq2[0] = m[0] & q[2];
assign aq2[1] = m[1] & q[2];
assign aq2[2] = m[2] & q[2];
fa fa11(1'b0, aq0[1], aq1[0], p[1], c1[1]);
fa fa12(c1[1], aq0[2], aq1[1], s1[1], c1[2]);
fa fa13(c1[2], 1'b0, aq1[2], s1[2], c1[3]);
fa fa21(1'b0, aq2[0], s1[1], p[2], c2[1]);
fa fa22(c2[1], aq2[1], s1[2], p[3], c2[2]);
fa fa23(c2[2], aq2[2], c1[3], p[4], p[5]);
assign p[0] = aq1[0];
endmodule

module fa(cin, a, b, sum, cout);
input cin, a, b;
output cout, sum;
wire x1, a1, a2;
assign x1 = a^b;
assign a1 = a&b;
assign a2 = x1&cin;
assign sum = x1^cin;
assign cout = a1|a2;
endmodule
