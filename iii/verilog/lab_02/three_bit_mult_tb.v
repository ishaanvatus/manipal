`timescale 1ns/1ns
`include "three_bit_mult.v"
module three_bit_mult_tb;
reg [2:0] m, q;
wire[5:0] p;
three_bit_mult uut(m, q, p);
initial begin
    $dumpfile("three_bit_mult_tb.vcd");
    $dumpvars(0, three_bit_mult_tb);
    m = 6; q = 5; #20;
    m = 8; q = 3; #20;
    m = 4; q = 6; #20;
    m = 3; q = 7; #20;
end
endmodule
