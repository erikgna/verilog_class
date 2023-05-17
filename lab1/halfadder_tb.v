`timescale 1ns/1ps  

module halfadder_tb;

reg  a_tb, b_tb; 
wire carry_tb, sum_tb;

halfadd U0(
	.a		(a_tb), 
	.b		(b_tb), 
	.sum	(sum_tb), 
	.carry	(carry_tb)
);

initial begin
  a_tb = 1'b0;
  b_tb = 1'b0;
  #2;
  a_tb = 1'b1;
  b_tb = 1'b0;
  #2;
  a_tb = 1'b0;
  b_tb = 1'b1;
  #2;
  a_tb = 1'b1;
  b_tb = 1'b1;
  #5;
  $end();
end
endmodule