module dff(input D, input iniv, input clk, input rst, output reg Q, output Qbar);
always @(posedge clk)
if(!rst) 
    Q <= iniv;
else
    Q <= D;
assign Qbar = !Q;
endmodule