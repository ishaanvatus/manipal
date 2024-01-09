`timescale 1ns/1ns
`include "decoder4to16.v"
module decoder4to16_tb;
reg en;
reg [3:0] s;
wire [15:0] y;
integer i, j;
decoder4to16 uut(en, s, y);
initial 
begin
    $dumpfile("decoder4to16_tb.vcd");
    $dumpvars(0, decoder4to16_tb);
    /*
    for (i = 0; i < 2; i = i + 1) begin
        for (j = 0; j < 16; j = j + 1) begin
            en = i; s = j; #40;
        end
    end
    */
   en = 1; s = 4; #20;
   en = 1; s = 0; #20;
   en = 1; s = 15; #20;
   en = 0; s = 4; #20;
end
endmodule
