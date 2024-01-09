module mux8to1(s, w, f);
input [2:0] s;
input [0:7] w;
output reg f;
integer i;
always @ (s or w) begin
    for (i = 0; i < 8; i = i + 1) begin
        if (s == i)
            f = w[i];
    end
end
endmodule
