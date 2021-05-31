module dff(input D, input iniv, input clk, input rst, output reg Q, output Qbar);
always @(posedge clk)
if(!rst) 
    Q <= iniv;
else
    Q <= D;
assign Qbar = !Q;
endmodule

module fsm(input rst, input clk, input X, output Y);

wire d0,d1,d2,q0,q1,q2,q3,qn0,qn1,qn2,qn3;

assign d0 = (!q0 & X) | (q1 & !q0) | (q2 & !q0);
assign d1 = (q1 & !q0) | (!q2 & !q1 & q0);
assign d2 = (q2 & !q0) | (q1 & q0);


dff df0 (d0, 1'b0, clk, rst, q0, qn0);
dff df1 (d1, 1'b0, clk, rst, q1, qn1);
dff df2 (d2, 1'b0, clk, rst, q2, qn2);

assign Y = q1 & !q0;
endmodule