`timescale 1ns/1ns
`include "pencoder16to4.v"
module pencoder16to4_tb;
reg en;
reg [15:0] s;
wire [3:0] y;
integer i;
pencoder16to4 uut(s, y);
initial begin
    $dumpfile("pencoder16to4_tb.vcd");
    $dumpvars(0, pencoder16to4_tb);
    for (i = 0; i < 65536; i = i + 1) begin
        s = i; #20;
    end
end
endmodule
