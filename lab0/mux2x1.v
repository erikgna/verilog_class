module mux2x1
(
	input a, 
	input b, 
	input sel,
	
	output reg op
);

always @(a or b or sel)
begin
  if (sel == 1'b1)
    op = a;
  else
    op = b;
end

endmodule
