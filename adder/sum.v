module sum(sumi, a, b, cy_in);
	input a,b,cy_in;
	output sumi;

	wire t;

	xor x1(t,a,b);
	xor x2(sumi,t,cy_in);
endmodule