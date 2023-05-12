`timescale 10ns/100ps // ESCALA DE TEMPO

module block_nblock2_tb;

// BLOQUEANTE
reg [7:0] byte0;
initial begin
  byte0 = 8'b0000_1111;
  #10;
  // swap nibbles
  byte0 [3:0] = byte0 [7:4]; // atualiza imediatamente byte0 [3:0]
  byte0 [7:4] = byte0 [3:0]; // de forma sequencial atribui em byte0 [7:4]  
  #10;                       // o valor de byte0 [3:0] atualizado anteriormente
end

// NÃO BLOQUEANTE
reg [7:0] byte1;
initial begin
  byte1 <= 8'b0000_1111;
  #10;
  // swap nibbles
  byte1 [3:0] <= byte1 [7:4]; // reserva os valores no mesmo timestamp
 	byte1 [7:4] <= byte1 [3:0]; // atribui os valores a variável a esquerda
  #10;
end

endmodule
