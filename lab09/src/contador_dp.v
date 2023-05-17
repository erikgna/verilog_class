module contador_dp (
  input wire clk_i,
  input wire reset_i,
  input wire start_i,
  input wire [7:0] preset_value_i,
  output reg [6:0] display_segments_o
);

// Parâmetros
parameter COUNT_MAX = 99;

// Registros internos
reg [6:0] counter;

// Lógica do datapath
always @(posedge clk_i) begin
  if (reset_i) begin
      counter <= 0;
  end else if (start_i) begin
    if (counter >= COUNT_MAX) begin
      counter <= 0;
    end else begin
      counter <= counter + 1;
    end
    end else begin
      counter <= preset_value_i;
  end
end

// Lógica combinacional para os segmentos do display de sete segmentos
always @* begin
  case (counter)
    0: display_segments_o = 7'b1000000;
    1: display_segments_o = 7'b1111001;
    2: display_segments_o = 7'b0100100;
    3: display_segments_o = 7'b0110000;
    4: display_segments_o = 7'b0011001;
    5: display_segments_o = 7'b0010010;
    6: display_segments_o = 7'b0000010;
    7: display_segments_o = 7'b1111000;
    8: display_segments_o = 7'b0000000;
    9: display_segments_o = 7'b0011000;
    default: display_segments_o = 7'b0000000;
  endcase
end
endmodule