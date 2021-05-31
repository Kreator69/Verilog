module tb_add4;
	reg [3:0] x, y; 
	reg cy_in;
	wire cy4;
	wire [3:0] s;

	add4 DUT(s, cy4, cy_in, x, y);

	initial
		begin
			$dumpfile("add4.vcd");
			$dumpvars(0, tb_add4);
			$monitor($time,"  x=%b, y=%b, cy_in=%b, s=%b, cy4=%b", x,y,cy_in,s,cy4);
			#5 x=0000;y=0001;cy_in=1;
			#5 x=0000;y=0011;cy_in=0;
			//#5 x=0010;y=1000;cy_in=0;
			//#5 x=0000;y=0001;cy_in=1;
			#5 $finish;
		end
endmodule