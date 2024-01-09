`timescale 1ns/1ns
`include "comp.v"
module comp_tb;
reg[2:0] a, b;
wire l, g, eq;
comp uut(a, b, l, g, eq);
initial begin
    $dumpfile("comp_tb.vcd");
    $dumpvars(0, comp_tb);
    a = 7; b = 7; #20;
    a = 6; b = 3; #20;
    a = 6; b = 7; #20;
    a = 5; b = 5; #20;
end
endmodule

