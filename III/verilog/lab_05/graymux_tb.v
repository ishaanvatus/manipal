`timescale 1ns/1ns
`include "graymux.v"
module graymux_tb;
reg[3:0] g;
wire[3:0] b;
integer i;
graymux uut(g, b);
initial begin
    $dumpfile("graymux_tb.vcd");
    $dumpvars(0, graymux_tb);
    for (i = 0; i < 16; i = i + 1) begin
        g = i; #20;
    end
end
endmodule
