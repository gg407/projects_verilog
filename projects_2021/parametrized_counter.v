module counter(clk, clr, q);
  parameter COUNTER_LIMIT = 9;
  input clk, clr;
  output reg [3:0] q;

  always @(posedge clk, posedge clr) begin
    if (clr)
      q <= 1'b0;
    else if (q == COUNTER_LIMIT) 
      q <= 1'b0;
    else
      q <= q + 1;
  end

endmodule