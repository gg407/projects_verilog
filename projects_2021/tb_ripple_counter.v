module tb_ripple();
	reg rstn, clk;
	wire [3:0] out_struct, out_beh;

	ripple_struct rip(clk, rstn, out_struct);
	ripple_beh beh(clk, rstn, out_beh);

  integer i = 0;

	//clock generation
  initial begin
    clk = 0;
    forever
      #1 clk = ~clk;
  end

	//reset and initial values for inputs
  initial begin
    rstn = 0;
    #50
    rstn = 1;
    #1000;
    $stop;
  end

	always @(posedge clk) begin
		if (out_struct != out_beh) begin
			$display ("Error");
			$stop;
		end
	end

	//Test monitor and results
  initial begin
    $monitor("rstn = %b, clk = %b, out_struct = %b, out_beh = %b", rstn, clk, out_struct, out_beh);
  end

endmodule