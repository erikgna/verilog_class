module ShiftRegister_PISO (
  input wire clk,         // Sinal de clock
  input wire reset,       // Sinal de reinicialização
  input wire enable,      // Sinal de habilitação
  input wire [3:0] data_in,     // Dados de entrada paralelos
  output wire data_out    // Dado de saída serial
);

  reg [3:0] reg_data;     // Registrador interno de 4 bits

  always @(posedge clk or posedge reset) begin
    if (reset)
      reg_data <= 4'b0000;  // Reinicializa o registrador
    else if (enable)
      reg_data <= data_in;  // Carrega os dados de entrada no registrador
  end

  assign data_out = reg_data[0];  // Saída do bit menos significativo

endmodule
