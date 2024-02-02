`timescale 1ns/1ns
`include "pencoder4to2.v"
module pencoder4to2_tb;
reg en;
reg [3:0] s;
wire [1:0] y;
integer i;
pencoder4to2 uut(s, y);
initial begin
    $dumpfile("pencoder4to2_tb.vcd");
    $dumpvars(0, pencoder4to2_tb);
    for (i = 0; i < 16; i = i + 1) begin
        s = i; #20;
    end
end
endmodule
