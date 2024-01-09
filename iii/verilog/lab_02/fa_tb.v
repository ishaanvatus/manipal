`timescale 1ns/1ns
`include "fa.v"
module fa_tb;
reg cin, a, b;
wire sum, cout;
integer i;
fa uut(cin, a, b, sum, cout);
initial begin
    $dumpfile("fa_tb.vcd");
    $dumpvars(0, fa_tb);
    for (i = 0; i < 8; i = i + 1) begin
        {cin, a, b} = i;
        #20;
    end
    $display("test Complete");
end 
endmodule
