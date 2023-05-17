module halfadd (a, b, sum, carry);

input  wire a, b; 
output wire sum, carry;

assign sum = a ^ b;   // OPERADOR LÓGICO OU
assign carry = a & b; // OPERADOR LÓGICO AND

endmodule