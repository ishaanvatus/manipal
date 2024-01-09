/*
* active high reset, posedge clk
* 0 0 0 1
* 0 0 1 0
* 0 1 0 0
* 1 0 0 0
*/
module ringcounter(clk, rst, out);
input clk, rst;
output reg [3:0] out;
integer i;
always @ (posedge clk) begin
    if (rst) 
        out <= 4'b0001;
    else
        out <= out<<1;
end
endmodule
