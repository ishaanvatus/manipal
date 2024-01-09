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
