module shift_left_right (C, SI, LEFT_RIGHT, PO);
input  C,SI,LEFT_RIGHT; 
output PO; 
reg [7:0] tmp; 
 
  always @(posedge C) 
  begin 
    if (LEFT_RIGHT==1'b0) 
      begin 
        tmp = {tmp[6:0], SI}; 
      end 
    else 
      begin 
        tmp = {SI, tmp[7:1]}; 
      end 
  end 
  assign PO  = tmp; 
endmodule 