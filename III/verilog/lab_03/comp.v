module comp(a, b, l, g, eq);
input[2:0] a, b;
output reg l, g, eq;
reg[2:0] xn, an;
reg ga1, ga2, gx1, gx2;
reg la1, la2, lx1, lx2;
integer i;
reg eqa1, eqa2;
always @ (a or b)
begin
    for (i = 0; i < 3; i = i + 1) begin
        xn[i] = a[i]~^b[i];
        an[i] = (~a[i])&b[i];
    end
    la1 = xn[1]&xn[2];
    la2 = an[0]&la1;
    eqa1 = xn[2]&an[1];
    lx1 = eqa1~^an[2];
    lx2 = lx1~^la2;
    l = lx2; //less
    eqa2 = la1&xn[0];
    eq = eqa2; //equals
    ga1 =(~b[0])&a[0]; 
    ga2 =la1&(~ga1); 
    gx1 =an[2]^eqa1;
    gx2 =ga2~^gx1; 
    g = gx2; //greater
end
endmodule
