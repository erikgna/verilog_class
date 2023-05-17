module contador_fsm (
  input wire clk,
  input wire reset,
  input wire start,
  input wire [7:0] preset_value,
  output wire [6:0] display_segments
);

reg [6:0] display_segments_reg;
reg [3:0] state_reg;
reg [3:0] state_next;
reg [3:0] count_reg;
wire [7:0] count_next;

// Lógica combinacional
always @(*) begin
    count_next = count_reg + 1;

    case (state_reg)
        4'b0000: begin  // Reset
            display_segments_reg = 7'b1111110;  // Mostra "r" nos displays
            if (start)
                state_next = 4'b0001;  // Muda para o estado Start
            else
                state_next = 4'b0000;  // Mantém no estado Reset
        end

        4'b0001: begin  // Start
            display_segments_reg = count_reg;
            if (count_reg == 99)
                state_next = 4'b0000;  // Muda para o estado Reset quando chega a 99
            else
                state_next = 4'b0001;  // Mantém no estado Start
        end

        4'b0010: begin  // Load
            display_segments_reg = preset_value;
            if (start)
                state_next = 4'b0001;  // Muda para o estado Start
            else
                state_next = 4'b0010;  // Mantém no estado Load
        end

        default: state_next = 4'b0000;
    endcase
end

// Controle
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state_reg <= 4'b0000;
    end else begin
        state_reg <= state_next;
    end
end

assign display_segments = display_segments_reg;

endmodule
