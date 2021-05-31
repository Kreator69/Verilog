module srff(input S, input R, input clk, input rst, output reg Q, output Qbar);

always @(posedge clk)
if (!rst)
    Q <= 0;
else begin
    if(!S & !R)
        Q <= Q;
    else if(!S & R)
        Q <= 0;
    else if(S & !R)
        Q <= 1;
end
assign Qbar = !Q;
endmodule

module graycode(input rst, input clk, output [3:0] out);

wire r0,r1,r2,r3,s0,s1,s2,s3,s4,q0,q1,q2,q3,qn0,qn1,qn2,qn3;

assign s0 = (!q3 & !q2 & !q1) | (!q3 & q2 & q1) | (q3 & !q2 & q1) | (q3 & q2 & !q1);
assign r0 = (!q3 & !q2 & q1) | (!q3 & q2 & !q1) | (q3 & !q2 & !q1) | (q3 & q2 & q1);

assign s1 = (!q3 & !q2 & q0) | (q3 & q2 & q0);
assign r1 = (!q3 & q2 & q0) | (q3 & !q2 & q0);

assign s2 = (!q3 & q1 & !q0);
assign r2 = (q3 & q1 & !q0);

assign s3 = (q2 & !q1 & !q0);
assign r3 = (!q2 & !q1 & !q0);

srff sr3 (s3, r3, clk, rst, q3, qn3);
srff sr2 (s2, r2, clk, rst, q2, qn2);
srff sr1 (s1, r1, clk, rst, q1, qn1);
srff sr0 (s0, r0, clk, rst, q0, qn0);

assign out = {q3, q2, q1, q0};

endmodule