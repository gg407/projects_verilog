 module mux31_3(d0,d1,d2,s0,s1,y);
  input d0,d1,d2,s0,s1;
  output y;

  // add reg declarations for variables assigned inside of
  // the behavioral block below
  reg y;

  always @ (d0 or d1 or d2 or s0 or s1)
  begin
    case ({s1,s0})
     2'b00: y <= d0;
     2'b01: y <= d1;
     2'b10, 2'b11: y <= d2;
    endcase
  end
endmodule