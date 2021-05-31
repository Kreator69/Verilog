module dff (
    input d,  
    input clk,  
    input rstn,  
    output reg q,  
    output qn);  

    always @ (posedge clk or negedge rstn)  
      if (!rstn) q <= 0;  
      else q <= d;  
    assign qn = ~q;  
endmodule  
  
module ripple (
    input clk,  
    input rstn,  
    output [1:0] out);  
    
    wire  q0, qn0;  
    wire  q1, qn1;  
  
    dff dff0 ( .d (qn0),  
      .clk (clk),  
      .rstn (rstn),  
      .q (q0),  
      .qn (qn0));  
  
    dff dff1 ( .d (qn1),  
      .clk (q0),  
      .rstn (rstn),  
      .q (q1),  
      .qn (qn1)); 
   assign out = {qn1, qn0};
   
endmodule