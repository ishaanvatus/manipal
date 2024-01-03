module pencoder16to4(s, y);
input [15:0] s;
output reg [3:0] y;
integer i;
always@(s) begin 
    for(i = 0; i < 16; i = i + 1) begin
        if (s[i] == 1'b1) begin
            y = i;
        end
    end
end
endmodule
