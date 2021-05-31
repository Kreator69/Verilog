module srff(input S,
input R,
input clk,
input rst,
output Q,
output Qbar
    );
reg M,N;
always @(posedge clk) begin
  M <= !(S & clk) & rst;
  N <= !(R & clk) & rst;
end
assign Q = !(M & Qbar);
assign Qbar = !(N & Q);
endmodule