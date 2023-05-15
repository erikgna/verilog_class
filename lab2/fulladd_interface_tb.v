`timescale 1ns/1ps

module fulladd_interface_tb;

reg a_tb, b_tb, carry_in_tb;
wire sum_tb, carry_out_tb;

fulladd_interface U0(
    .a(a_tb), 
    .b(b_tb), 
    .carry_in(carry_in_tb), 
    .sum(sum_tb), 
    .carry_out(carry_out_tb)
);

initial begin
    a_tb = 0; 
    b_tb = 0; 
    carry_in_tb = 0;
    
    a_tb = 0; 
    b_tb = 0; 
    carry_in_tb = 1;
    
    a_tb = 0; 
    b_tb = 1; 
    carry_in_tb = 0;
    
    a_tb = 0; 
    b_tb = 1; 
    carry_in_tb = 1;
    
    a_tb = 1; 
    b_tb = 0; 
    carry_in_tb = 0;
    
    a_tb = 1; 
    b_tb = 0; 
    carry_in_tb = 1;
    
    a_tb = 1; 
    b_tb = 1; 
    carry_in_tb = 0;
    
    a_tb = 1; 
    b_tb = 1; 
    carry_in_tb = 1;
    $end();
end
endmodule

