`timescale 1ns/1ns
`include "regn.v"
module regn_tb;
reg [7:0] I;
reg clk;
wire [7:0] A; 
integer i;
regn uut(I, clk, A);
parameter timeout = 500;
initial begin
    $dumpfile("regn_tb.vcd");
    $dumpvars(0, regn_tb);
    clk = 0; 
    forever #20 clk = ~clk;
end
initial begin
    for (i = 0; i < 256; i = i + 1) begin
        I = i; #20;
    end
    #(timeout) $finish;
end
endmodule
