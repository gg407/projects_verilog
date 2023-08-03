module tb_ff_dff();
	reg d, rstn, clk;
	wire q_dut_ff, q_dff, qbar_dut_ff, qbar_ff;

	d_t_ff #("DFF") ff(d, q_dut_ff, qbar_dut_ff, rstn, clk);
	dff_rstn d1(d, q_dff, qbar_ff, rstn, clk);
	//tff t1(d, q_tff, qbar, reset, clk);

	integer i;
	

	//clock generation
  initial begin
    clk = 0;
    forever
      #1 clk = ~clk;
  end

	//reset and initial values for inputs
  initial begin
    rstn = 0;
    d = 0;
    #50
    rstn = 1;
    #100;
    for (i = 0; i < 10000; i=i+1) begin
    	#2
    	d = $random;
      
    end
    $stop;
  end

	always @(posedge clk) begin
		if ( (q_dff != q_dut_ff) || (qbar_ff != qbar_dut_ff) ) begin
			$display ("Error");
			$stop;
		end
	end

	//Test monitor and results
  initial begin
    $monitor("d = %b, rstn = %b, clk = %b, q_dff = %b, q_dut_ff = %b, qbar_dff = %b, qbar_dut_ff = %b", d, rstn, clk, q_dff, q_dut_ff, qbar_ff, qbar_dut_ff);
  end

endmodule