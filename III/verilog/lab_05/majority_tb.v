`timescale 1ns/1ns
`include "majority.v"
module majority_tb;
reg en;
reg [2:0] b;
wire f;
integer i;
majority uut(b, f);
initial 
begin
    $dumpfile("majority_tb.vcd");
    $dumpvars(0, majority_tb);
    for (i = 0; i < 8; i = i + 1) begin
        b = i; #20;
    end
end
endmodule
