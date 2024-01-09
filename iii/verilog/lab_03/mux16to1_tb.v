`timescale 1ns/1ns
`include "mux16to1.v"
module mux16to1_tb;
reg[15:0] w;
reg[3:0] s;
wire f;
integer i;
mux16to1 uut(w, s, f);
initial begin
    $dumpfile("mux16to1_tb.vcd");
    $dumpvars(0, mux16to1_tb);
    for (i = 0; i < 15; i = i + 1) begin
        w = 65280; s = i; #20;
    end
end
endmodule

