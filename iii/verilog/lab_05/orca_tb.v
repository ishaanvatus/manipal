`timescale 1ns/1ns
`include "orca.v"
module orca_tb;
reg a, b, c, d;
wire f;
integer i;
orca uut(f, a, b, c, d);
initial begin
    $dumpfile("orca_tb.vcd");
    $dumpvars(0, orca_tb);
    for (i = 0; i < 16; i = i + 1) begin
        {a, b, c, d} = i;
        #20;
    end
    $display("test complete");
end
endmodule
