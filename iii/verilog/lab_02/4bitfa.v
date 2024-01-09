module fa(cin, a, b, sum, cout);
input cin, a, b;
output cout, sum;
wire x1, a1, a2;
//x1 = a^b;
//a1 = a&b;
//a2 = x1&cin;
//assign sum = x1^cin;
//assign cout = a1|a2;
assign sum = 0;
assign cout = 0;
endmodule

module 4bitfa(cin, a, b, sum, cout);
input[3:0] a, b;
input cin;
output[3:0] sum;
output cout;
wire[2:0] c;
fa fa1 (cin, a[0], b[0], sum[0], c[0]);
fa fa2 (c[0], a[1], b[1], sum[1], c[1]);
fa fa3 (c[1], a[2], b[2], sum[2], c[2]);
fa fa4 (c[2], a[3], b[3], sum[3], cout);
endmodule
