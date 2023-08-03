 module dpr_sync(clk, din, dout, rst, wr_en, rd_en, blk_select, addr_wr, addr_rd);
	parameter MEM_WIDTH = 16;
	parameter MEM_DEPTH = 1024;
	parameter ADDR_SIZE = 10;
	input clk, rst, wr_en, rd_en, blk_select;
	input [MEM_WIDTH-1:0] din;
	input [ADDR_SIZE-1:0] addr_rd, addr_wr;
	output reg [MEM_WIDTH-1:0] dout;

	integer i = 0;
	reg [MEM_WIDTH-1:0] mem [MEM_DEPTH-1:0];

	//Read/Write Operation
	always @(posedge clk or posedge rst)
		begin 
			if(rst)
				begin
						for (i = 0; i < MEM_DEPTH; i=i+1)
							begin
								mem [i] <= 'b0;
							end
								dout <= 'b0;
				end
			else
				begin
						if (blk_select) 
							begin
									if (wr_en) 
										begin
											mem [addr_wr] <= din;
										end
										
									if (rd_en) 
										begin
											dout <= mem[addr_rd];
										end
							end
				
						else	
							dout <= 'b0;
							
				end
		end

endmodule 