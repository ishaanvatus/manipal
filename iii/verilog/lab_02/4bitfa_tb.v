`timescale 1ns/1ns
`include "4bitfa.v"
module 4bitfa_tb;
reg[3:0] a, b;
reg cin;
wire sum[3:0], cout;
integer i, j;
4bitfa uut(cin, a, b, sum, cout);
initial begin
    $dumpfile("4bitfa_tb.vcd");
    $dumpvars(0, 4bitfa_tb);
    for (int i = 0; i < 8; i = i + 1)
        cin = 0;
        a = i;
        for (int j = 0; j < 8; j = j + 1)
            b = j;
    $display("Test Complete");
end 
endmodule
