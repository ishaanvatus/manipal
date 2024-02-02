`timescale 1ns/1ns
`include "decoder2to4.v"
module decoder2to4_tb;
reg en;
reg [1:0] s;
wire [3:0] y;
integer i, j;
decoder2to4 uut(en, s, y);
initial begin
    $dumpfile("decoder2to4_tb.vcd");
    $dumpvars(0, decoder2to4_tb);
    for (i = 0; i < 2; i = i + 1) begin
        for (j = 0; j < 4; j = j + 1) begin
            en = i; s = j; #20;
        end
    end
end
endmodule
