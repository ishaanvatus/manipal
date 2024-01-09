`timescale 1ns/1ns
`include "k1.v"
module k1_tb;
reg a, b, c, d;
wire f;
k1 uut(f, a, b, c, d);
initial begin
    $dumpfile("k1_tb.vcd");
    $dumpvars(0, k1_tb);
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
