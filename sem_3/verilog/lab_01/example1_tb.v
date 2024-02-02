`timescale 1ns/1ns
`include "example1.v"
module example1_tb;
reg a, b, c;
wire f;
example1 uut(f, a, b, c);
initial begin
    $dumpfile("example1_tb.vcd");
    $dumpvars(0, example1_tb);
    a=0; b=0; c=0; #20;
    a=0; b=0; c=1; #20;
    a=0; b=1; c=0; #20;
    a=0; b=1; c=1; #20;
    a=1; b=0; c=0; #20;
    a=1; b=0; c=1; #20;
    a=1; b=1; c=0; #20;
    a=1; b=1; c=1; #20;
    $display("Test Complete");
end 
endmodule
