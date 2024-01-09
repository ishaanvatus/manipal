`timescale 1ns/1ns
`include "gray2bin.v"
module gray2bin_tb;
reg[3:0] g;
wire[3:0] b;
gray2bin uut(g, b);
initial begin
    $dumpfile("gray2bin_tb.vcd");
    $dumpvars(0, gray2bin_tb);
    g = 4'b0010; #20;
    g = 4'b1101; #20;
    g = 4'b1111; #20;
    g = 4'b1001; #20;
end
endmodule
