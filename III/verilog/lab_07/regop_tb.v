`timescale 1ns/1ns
`include "regop.v"
module regop_tb;
reg [3:0] I;
reg shift, load, serial, clk;
wire [3:0] A; 
integer i;
regop uut(shift, load, serial, clk, I, A);
parameter timeout = 500;
initial begin
    $dumpfile("regop_tb.vcd");
    $dumpvars(0, regop_tb);
    clk = 0; 
    forever #20 clk = ~clk;
end
initial begin
end
endmodule
