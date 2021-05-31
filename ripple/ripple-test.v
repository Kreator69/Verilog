module testbench_ripple;  
    reg clk;  
    reg rstn;  
    wire [1:0] out;  
    ripple r0 (clk, rstn, out);  
    always #5 clk = ~clk;  
    initial begin
      $dumpfile("ripple.vcd");
			$dumpvars(0, testbench_ripple);
      $monitor($time," %b", out);
      rstn <= 0;  
      clk <= 0;  
      repeat (1) @ (posedge clk);  
      rstn <= 1;  
      repeat (17) @ (posedge clk);  
      $finish;  
   end  
endmodule
