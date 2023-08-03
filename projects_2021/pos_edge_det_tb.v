module posedge_det_tb();
	reg x, rstn, clk;
	wire y;

  posedge_det p1(clk, rstn, x, y);

	integer i;
  integer test_start = 0;
	
	//clock generation
  initial begin
    clk = 0;
    forever
      #1 clk = ~clk;
  end

	//reset and initial values for inputs
  initial begin
    rstn = 0;
    x = 0;
    #50
    rstn = 1;
    #100;
    test_start = 1;
    for (i = 0; i < 10000; i=i+1) begin
    	#2
    	x = $random;
    end
    $stop;
  end

  //Selfcheck
	always @(posedge x) begin
		if ( y != 1 && test_start == 1) begin
			$display ("Error");
			$stop;
		end
	end

	//Test monitor and results
  initial begin
    $monitor("rstn = %b, clk = %b, x = %b, y = %b", rstn, clk, x, y);
  end

endmodule