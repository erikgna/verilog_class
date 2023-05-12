//CORDIC Testbench for sine and cosine for Final Project 

//Claire Barnes
`timescale 10ns/100ps

module CORDIC_TESTBENCH;
  localparam width = 16; //width of x and y
  // Inputs
  reg [width-1:0] Xin, Yin;
  reg [31:0] angle;
  reg clk;
  reg signed [63:0] i;
  wire [width-1:0] COSout, SINout;
  localparam An = 32000/1.647;
  
  reg [31:0] angleaux;  
  
initial begin
  //set clock
  clk = 'b0;
  forever
  begin
      #5 clk = !clk;
  end
end  
  

initial 
  begin
    //set initial values
    angle = 'b00100000000000000000000000000000;  
    Xin = An;     // Xout = 32000*cos(angle)
    Yin = 0;      // Yout = 32000*sin(angle)
  
    for (i=0; i < 'hffff_ffff ; i=i+1)
    begin
     #200 angle <= angle - 'h8000000;
    end

   #1000;
   
   $write("Simulation has finished");
   $stop;

  end
  
  CORDIC U00 (
    .clock  (clk), 
    .cosine (COSout), 
    .sine   (SINout), 
    .x_start(Xin), 
    .y_start(Yin), 
    .angle  (angle)
  );


  //CORDIC TEST_RUN(clk, COSout, SINout, Xin, Yin, angle);

  // Monitor the output
  initial
  $monitor($time, , COSout, , SINout, , angle);

endmodule


