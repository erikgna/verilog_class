module bord_detector (
  input wire clk,
  input wire reset,
  input wire signal_in,
  output reg Mealy_tick,
  output reg Moore_tick
);

// Mealy
localparam [2:0] S0 = 3'b000,
            S1 = 3'b001,
            S2 = 3'b010,
            S3 = 3'b011;

// Moore
localparam [1:0] Q0 = 2'b00,
            Q1 = 2'b01,
            Q2 = 2'b10,
            Q3 = 2'b11;

reg [2:0] stateMealy_reg, stateMealy_next;
reg [1:0] stateMoore_reg, stateMoore_next;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        stateMealy_reg <= S0;
        stateMoore_reg <= Q0;
        Mealy_tick <= 1'b0;
        Moore_tick <= 1'b0;
    end else begin
        stateMealy_reg <= stateMealy_next;
        stateMoore_reg <= stateMoore_next;
        Mealy_tick <= 1'b0;
        Moore_tick <= 1'b0;
    
        case (stateMealy_reg)
            S0: begin
                if (signal_in == 1'b0)
                    stateMealy_next = S0;
                else
                stateMealy_next = S1;
            end
            S1: begin
                if (signal_in == 1'b0)
                    stateMealy_next = S0;
                else
                    stateMealy_next = S2;
                Mealy_tick <= 1'b1;
            end
            S2: begin
                if (signal_in == 1'b0)
                    stateMealy_next = S0;
                else
                    stateMealy_next = S3;
            end
            S3: begin
                if (signal_in == 1'b0)
                    stateMealy_next = S0;
                else
                    stateMealy_next = S3;
            end
        endcase
    
        case (stateMoore_reg)
            Q0: begin
                if (signal_in == 1'b0)
                    stateMoore_next = Q0;
                else
                    stateMoore_next = Q1;
            end
            Q1: begin
                if (signal_in == 1'b0)
                    stateMoore_next = Q0;
                else
                    stateMoore_next = Q2;
                Moore_tick <= 1'b1;
            end
            Q2: begin
                if (signal_in == 1'b0)
                    stateMoore_next = Q0;
                else
                    stateMoore_next = Q3;
            end
            Q3: begin
                if (signal_in == 1'b0)
                    stateMoore_next = Q0;
                else
                    stateMoore_next = Q3;
            end
        endcase
    end
end
endmodule