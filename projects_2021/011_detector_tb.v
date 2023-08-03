module seq_det_tb();

  reg clk, rstn, x;
  wire [2:0] y;
  integer i = 0;

  seq_det dut(clk, rstn, x, y);

  initial begin
    clk = 0;
    forever
   	  #1 clk = ~clk;
  end

  initial begin
    rstn = 0;
    x = 0;
    #50
    rstn = 1;
    #100;

    for (i = 0; i < 10000; i = i+1) begin
      #2
      x = $random;
    end
    $stop;
  end

endmodule