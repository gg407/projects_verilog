module posedge_det(clk, rstn, x, y);
	parameter ZERO = 0;
	parameter ONE = 1;
	input clk, rstn, x;
	output y;

	reg cs, ns; // cs >> current state, ns >> next state

	//Next State Logic
	always @(cs, x) begin
		case (cs)

			ZERO: 
				if (x)
					ns = ONE;
				else 
					ns = ZERO;

			ONE:
				if (x)
					ns = ONE;
				else 
					ns = ZERO;

			default: ns = ZERO;
		endcase
	end


	//State Memory
	always @(posedge clk or negedge rstn) begin
		if(~rstn)
			cs <= ZERO;
		else
			cs <= ns;
	end

	//Output Logic
	assign y = (x == 1 && cs == ZERO)? 1'b1 : 1'b0;

endmodule