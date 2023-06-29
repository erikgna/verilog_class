module CircularCounter (
  input wire clk,               // Sinal de clock da PLL
  output wire [31:0] out,       // Saída do contador
  output wire led,              // Saída do LED
  output wire output_port       // Porta de saída
);

  reg [31:0] counter;
  reg [2:0] bit_count;
  wire msb;

  always @(posedge clk) begin
    counter <= counter + 1;    // Incrementa o contador

    if (counter[31] && bit_count == 2'b11) begin
      led <= 1;                // Liga o LED quando o MSB for 1
      output_port <= msb;      // Define a porta de saída com o valor do MSB
    end
    else begin
      led <= 0;                // Desliga o LED
      output_port <= 0;        // Define a porta de saída como 0
    end

    if (bit_count == 2'b11)
      bit_count <= 0;          // Reinicializa o contador de bits
    else
      bit_count <= bit_count + 1;  // Incrementa o contador de bits
  end

  assign out = counter;         // Atribui a saída ao valor do contador
  assign msb = counter[31];     // Obtém o bit mais significativo

endmodule
