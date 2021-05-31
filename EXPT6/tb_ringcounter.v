module tb_ringcounter;  
    reg clk;
    reg rstn;  
    wire [3:0] out;  
    ringcounter counter (rstn, clk, out);  
    always #5 clk = ~clk;  
    initial begin
      $dumpfile("ringcounter.vcd");
			$dumpvars(0, tb_ringcounter);
      $monitor($time," %b", out);
      rstn <= 0;  
      clk <= 0;  
      repeat (1) @ (posedge clk);  
      rstn <= 1;  
      repeat (17) @ (posedge clk);  
      $finish;  
   end  
endmodule