module seq_det(clk, rstn, x, y);
	parameter A = 2'b00;
	parameter B = 2'b01;
	parameter C = 2'b11;
	parameter D = 2'b10;
	input clk, rstn, x;
	output reg [2:0] y;

	reg [1:0] cs, ns; // cs >> current state, ns >> next state

	//Next State Logic
	always @(cs, x) begin
		case (cs)

			A: 
				if (x)
					ns = A;
				else 
					ns = B;

			B:
				if (x)
					ns = C;
				else 
					ns = B;

			C: 
				if (x)
					ns = D;
				else 
					ns = B;

			D:
				if (x)
					ns = A;
				else 
					ns = B;

			default: 	ns = A;
		endcase
	end


	//State Memory
	always @(posedge clk or negedge rstn) begin
		if(~rstn)
			cs <= A;
		else
			cs <= ns;
	end

	//Output Logic
	always @(cs) begin
		case (cs)
			A: y = 3'b000;
			B: y = 3'b001;
			C: y = 3'b011;
			D: y = 3'b111; 
		endcase

	end
endmodule