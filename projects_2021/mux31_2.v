module mux31_2(d0,d1,d2,s0,s1,y);
  input d0,d1,d2,s0,s1;
  output y;

  assign y = (s1) ? d2 : (s0) ? d1 : d0;
endmodule