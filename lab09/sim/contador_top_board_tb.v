module contador_top_board_tb;

reg clk;
reg reset;
reg start;
reg [7:0] preset_value;
wire [6:0] display_segments;

contador_top dut (
    .clk_i(clk),
    .reset_i(reset),
    .start_i(start),
    .preset_value_i(preset_value),
    .display_segments_o(display_segments)
);

// Clock
always #5 clk = ~clk;

// Estímulos de teste
initial begin
    clk = 0;
    reset = 1;
    start = 0;
    preset_value = 8'b00000000;

    // Inicializa a placa DE0-Board
    // Configuração dos pinos, botões, chaves, displays, etc.

    // Reset
    #10 reset = 0;

    // Load preset value
    #10 preset_value = 8'b01011001;
    #10 preset_value = 8'b00000011;
    #10 preset_value = 8'b11111111;

    // Start counting
    #10 start = 1;
    #100 start = 0;

    $finish;
end
endmodule
