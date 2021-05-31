module dff(input D, input iniv, input clk, input rst, output reg Q, output Qbar);
always @(posedge clk)
if(!rst) 
    Q <= iniv;
else
    Q <= D;
assign Qbar = !Q;
endmodule

module ringcounter(input rst, input clk, output [3:0] out);

wire d0,d1,d2,d3,q0,q1,q2,q3,qn0,qn1,qn2,qn3;

assign d0 = q1;
assign d1 = q2;
assign d2 = q3;
assign d3 = q1^q0;

dff df0 (d0, 1'b1, clk, rst, q0, qn0);
dff df1 (d1, 1'b0, clk, rst, q1, qn1);
dff df2 (d2, 1'b0, clk, rst, q2, qn2);
dff df3 (d3, 1'b0, clk, rst, q3, qn3);

assign out = {d3,d2,d1,d0};
endmodule