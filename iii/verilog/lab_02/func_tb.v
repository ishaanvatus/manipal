`timescale 1ns/1ns
`include "func.v"
module func_tb;
reg a, b, c, d;
wire f;
integer i;
func uut(f, a, b, c, d);
initial begin
    $dumpfile("func_tb.vcd");
    $dumpvars(0, func_tb);
    for (i = 0; i < 16; i = i + 1) begin
        {a, b, c, d} = i;
        #20;
    end
    $display("test complete");
end
endmodule
