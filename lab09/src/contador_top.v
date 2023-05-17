module contador_top (
    input wire clk_i,
    input wire reset_i,
    input wire start_i,
    input wire [7:0] preset_value_i,
    output wire [6:0] display_segments_o
);

contador_fsm fsm (
    .clk(clk_i),
    .reset(reset_i),
    .start(start_i),
    .preset_value(preset_value_i),
    .display_segments(display_segments_o)
);

contador_dp dp (
    .clk(clk_i),
    .reset(reset_i),
    .count(fsm.count),
    .display_segments(display_segments_o)
);

endmodule
