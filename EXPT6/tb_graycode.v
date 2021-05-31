module tb_graycode;  
    reg clk;
    reg rstn;  
    wire [3:0] out;  
    graycode counter (rstn, clk, out);  
    always #5 clk = ~clk;  
    initial begin
      $dumpfile("graycode.vcd");
			$dumpvars(0, tb_graycode);
      $monitor($time," %b", out);
      rstn <= 0;  
      clk <= 0;  
      repeat (1) @ (posedge clk);  
      rstn <= 1;  
      repeat (17) @ (posedge clk);  
      $finish;  
   end  
endmodule