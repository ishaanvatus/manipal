`timescale 1ns/1ns
`include "mux4to1.v"
module mux4to1_tb;
reg[3:0] w;
reg[1:0] s;
wire f;
mux4to1 uut(w, s, f);
initial begin
    $dumpfile("mux4to1_tb.vcd");
    $dumpvars(0, mux4to1_tb);
    w = 10; s = 0; #20;
    w = 10; s = 1; #20;
    w = 10; s = 2; #20;
    w = 10; s = 3; #20;
end
endmodule

