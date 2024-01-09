module decoder2to4(en, s, y);
input en;
input [1:0] s;
output reg [3:0] y;
integer i;
always @ (en or s) begin
    y = 4'b0;
    if (en) begin
        for(i=0;i<4;i=i+1) begin
            if(s == i) begin
                y[i] = 1'b1;
            end
        end
    end
    else 
        y=4'b0;
end
endmodule
