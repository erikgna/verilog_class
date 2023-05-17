module control_interface_tb;

reg clk;
reg reset;
reg data_valid;
reg [7:0] data;

wire [7:0] local_buffer;
wire data_read;

control_interface dut (
.clk(clk),
.reset(reset),
.data_valid(data_valid),
.data(data),
.local_buffer(local_buffer),
.data_read(data_read)
);

always begin
    #5 clk = ~clk;
end

initial begin
    clk = 0;
    reset = 1;
    data_valid = 0;
    data = 0;

    #10 reset = 0;

    // Waiting state
    #20;
    data_valid = 1;

    // State 1
    #20;
    data = 8'hAA;

    // State 2
    #20;

    // State 3
    #20;
    data_valid = 0;
   
    #20;
    data_valid = 1;

    #50 $finish;
end
  
always @(posedge clk) begin
    $display("Local Buffer: %h, Data Read: %b", local_buffer, data_read);
end
endmodule
