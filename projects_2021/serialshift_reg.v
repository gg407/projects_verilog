module shift_left_reg (C, ALOAD, SI, D, SO); 
input  C,SI,ALOAD; 
input [7:0] D; 
output SO; 
reg [7:0] tmp; 
 
  always @(posedge C or posedge ALOAD) 
  begin 
    if (ALOAD) 
      tmp <= D; 
    else 
      begin 
        tmp <= {tmp[6:0], SI}; 
      end 
  end 
  assign SO  = tmp[7]; 
endmodule