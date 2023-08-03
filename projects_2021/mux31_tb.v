module mux31_tb();

  reg d0,d1,d2,s0,s1;
  wire y_dut2, y_dut3;

  mux31_2 dut2(d0,d1,d2,s0,s1,y_dut2);
  mux31_3 dut3(d0,d1,d2,s0,s1,y_dut3);
  integer i;

  initial begin
    for (i = 0; i < 99; i = i+1) begin
      d0 = $random;
      d1 = $random;
      d2 = $random;
      s0 = $random;
      s1 = $random;
      #10;
      if (y_dut2 != y_dut3) begin
        $display("Error - Incorrent mux31 output");
		end 
		
	  else  begin
	  
		$display("my design is perfect");
		
			end
	  
     
      
    end
    $stop;
  end

    //Test monitor and results
  initial begin
  	$monitor("d0 = %b, d1 = %b, d2 = %b, s0 = %b, s1 = %b, y_dut2 = %b, y_dut3 = %b ", d0, d1, d2, s0, s1, y_dut2, y_dut3);
  end

endmodule