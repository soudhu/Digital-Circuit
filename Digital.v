module fsm(clk,x,y,c,d2,d1,d0);
input x,clk;

reg [2:0] q;
output c;
output reg y,d2,d1,d0;
assign c = clk;

initial begin
d0<=0;
d1<=0;
d2<=0;
y<=0;
end

always @(posedge clk) begin


q[2] = d2;
q[1] = d1;
q[0] = d0;

d2 <= (q[1] & q[0] )|(q[2] & ~q[0]);
d1 <= (~q[0] & q[1] )|(~q[2] & ~q[1] & q[0]);
d0 <= (~q[0] & x)|(~q[0] & q[1] )|(q[2] & ~q[0]);

y <= ( q[1] & ~q[0] ) |(~q[2] & ~q[1] & x) | (~q[2] & ~q[1] & q[0]);

end



endmodule