`timescale 1ns/1ns
`include "kmap1.v"
module kmap1_tb;
reg a, b, c, d;
wire f;
integer i;
kmap1 uut(a, b, c, d, f);
initial begin
    $dumpfile("kmap1_tb.vcd");
    $dumpvars(0, kmap1_tb);
    for (i = 0; i < 16; i = i + 1) begin
        {a, b, c, d} = i;
        #20;
    end
end
endmodule
