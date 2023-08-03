module vending_machine_tb();
	reg Q_in, D_in, rstn, clk;
	wire dispense, change;

  vending_machine v1(clk, rstn, Q_in, D_in, dispense, change);

  integer test_start;
	
	//clock generation
  initial begin
    clk = 0;
    forever
      #1 clk = ~clk;
  end

	//reset and initial values for inputs
  initial begin
    test_start = 0;
    rstn = 0;
    Q_in = 0;
    D_in = 0;
    #50
    rstn = 1;
    #100;

    #0   D_in = 1; Q_in = 0; 
    #100 D_in = 0; Q_in = 1; 
    #100;

    $stop;
  end


	//Test monitor and results
  initial begin
    $monitor("rstn = %b, clk = %b, Q_in = %b, D_in = %b, dispense = %b, change = %b", rstn, clk, Q_in, D_in, dispense, change);
  end

endmodule