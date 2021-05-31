module tb_fsm;  
    reg clk;
    reg rstn;  
    reg X;
    wire out;
    fsm counter (rstn, clk, X, out);  
    always #5 clk = ~clk;  
    always #25 X = !X;
    initial begin
      $dumpfile("fsm.vcd");
			$dumpvars(0, tb_fsm);
      $monitor($time," %b", out);
      rstn <= 0;  
      clk <= 0;  
      X <= 1;
      repeat (1) @ (posedge clk);  
      rstn <= 1;  
      repeat (17) @ (posedge clk);  
      $finish;  
   end  
endmodule