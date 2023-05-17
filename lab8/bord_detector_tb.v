module bord_detector_testbench;
reg clk_tb;
reg signal_in_tb;
wire Mealy_tick_tb;
wire Moore_tick_tb;

detector_borda U00 (
    .clk(clk_tb),
    .signal_in(signal_in_tb),
    .Mealy_tick(Mealy_tick_tb),
    .Moore_tick(Moore_tick_tb)
);
  
always begin
    clk_tb = 0;
    #5;
    clk_tb = 1;
    #5;
end

initial begin    
    signal_in_tb = 0;    

    #10;
    for (int i = 0; i < 8; i = i + 1) begin
        signal_in_tb = 0;
        #5;
        signal_in_tb = 1;
        #5;
    end
    
    #10;
    for (int i = 0; i < 8; i = i + 1) begin
        signal_in_tb = 1;
        #5;
        signal_in_tb = 0;
        #5;
    end

    $finish;
end
endmodule