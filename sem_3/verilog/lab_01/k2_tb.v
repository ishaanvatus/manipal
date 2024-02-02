`timescale 1ns/1ns
`include "k2.v"
module k2_tb;
reg a, b, c, d;
wire f;
k2 uut(f, a, b, c, d);
initial begin
    $dumpfile("k2_tb.vcd");
    $dumpvars(0, k2_tb);
    a=0; b=0; c=0; d=0; #20;
    a=0; b=0; c=0; d=1; #20;
    a=0; b=0; c=1; d=0; #20;
    a=0; b=0; c=1; d=1; #20;
    a=0; b=1; c=0; d=0; #20;
    a=0; b=1; c=0; d=1; #20;
    a=0; b=1; c=1; d=0; #20;
    a=0; b=1; c=1; d=1; #20;
    a=1; b=0; c=0; d=0; #20;
    a=1; b=0; c=0; d=1; #20;
    a=1; b=0; c=1; d=0; #20;
    a=1; b=0; c=1; d=1; #20;
    a=1; b=1; c=0; d=0; #20;
    a=1; b=1; c=0; d=1; #20;
    a=1; b=1; c=1; d=0; #20;
    a=1; b=1; c=1; d=1; #20;
    $display("Test Complete");
end
endmodule
