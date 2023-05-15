module fourbits_adder_tb;

reg [3:0] a;
reg [3:0] b;
reg carry_in;

wire [3:0] sum;
wire carry_out;

fourbits_adder U0 (
    .a(a),
    .b(b),
    .carry_in(carry_in),
    .sum(sum),
    .carry_out(carry_out)
);

reg clk = 0;
always #5 clk = ~clk;

initial begin
    a = 4'b0000;
    b = 4'b0000;
    carry_in = 0;

    a = 4'b0000; b = 4'b0000; carry_in = 0;
    if (sum !== 4'b0000 || carry_out !== 0) $error("Test case 1 failed");

    a = 4'b0001; b = 4'b0010; carry_in = 0;
    if (sum !== 4'b0011 || carry_out !== 0) $error("Test case 2 failed");

    a = 4'b1111; b = 4'b0001; carry_in = 0;
    if (sum !== 4'b0000 || carry_out !== 1) $error("Test case 3 failed");

    a = 4'b0111; b = 4'b1000; carry_in = 1;
    if (sum !== 4'b0000 || carry_out !== 1) $error("Test case 4 failed");

    $end;
end
endmodule