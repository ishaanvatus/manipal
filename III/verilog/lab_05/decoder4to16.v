module decoder4to16(en, s, w);
input en;
input [3:0] s;
output reg [15:0] w;
integer i;
always @ (en or s) begin
    if (en) begin
        for (i = 0; i < 16; i = i + 1) begin
            if (s == i)
                w[i] = 1;
            else
                w[i] = 0;
        end
    end
    else 
        w[i]=0;
end
endmodule
