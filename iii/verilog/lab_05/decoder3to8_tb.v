`timescale 1ns/1ns
`include "decoder3to8.v"
module decoder3to8_tb;
reg en;
reg [2:0] s;
wire [7:0] y;
integer i, j;
decoder3to8 uut(en, s, y);
initial 
begin
    $dumpfile("decoder3to8_tb.vcd");
    $dumpvars(0, decoder3to8_tb);
    for (i = 0; i < 2; i = i + 1) begin
        for (j = 0; j < 8; j = j + 1) begin
            en = i; s = j; #40;
        end
    end
end
endmodule
