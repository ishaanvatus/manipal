module mux4to1(w, s, f);
input[3:0] w;
input[1:0] s;
output reg f;
always @ (w or s)
begin
    if (s == 0)
        f = w[0];
    else if (s == 1)
        f = w[1];
    else if (s == 2)
        f = w[2];
    else
        f = w[3];
end
endmodule
