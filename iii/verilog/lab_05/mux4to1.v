module mux4to1(s, w, f);
input [1:0] s;
input [3:0] w;
output reg f;
always @ (s or w) begin
    case (s)
        2'b00: f = w[0];
        2'b01: f = w[1];
        2'b10: f = w[2];
        2'b11: f = w[3];
    endcase
end
endmodule
