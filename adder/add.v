module add(cy_out, sumi, a, b, cy_in);
	input a, b, cy_in;
	output sumi, cy_out;
	output cy4;

	sum s1(sumi, a, b, cy_in);
	carry c1(cy_out, a, b, cy_in);

endmodule