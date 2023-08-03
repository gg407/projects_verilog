module dff_en(E, D, Q, clk);
	input E, D, clk;
	output reg Q;

	always @(posedge clk) begin
		if (E) 
			Q <= D;
	end

endmodule