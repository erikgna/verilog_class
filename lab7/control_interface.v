module control_interface (
  input clk,
  input reset,
  input data_valid,
  input [7:0] data
);

localparam integer WAITING = 0,
        STATE1 = 1,
        STATE2 = 2,
        STATE3 = 3;            
        reg [7:0] local_buffer;
        reg [1:0] read_state;
        reg data_read;

always @(posedge clk or posedge reset) begin
    if (reset == 1) begin
      read_state <= WAITING;
      local_buffer <= 8'h0;            
    end 
    else
      case (read_state)
        WAITING:
          if (data_valid)
            read_state <= STATE1;        

        STATE1 : begin
          read_state <= STATE2;
          local_buffer <= data;
        end

        STATE2 : read_state <= STATE3;

        STATE3 :
          if (!escritor_DATA_VALID)
            read_state <= WAITING;        
      endcase    
end

  always @(read_state) begin
    case (read_state)
      STATE1, STATE2 : data_read = 1'b1;
      default : data_read = 1'b0;
    endcase
  end

endmodule
