module cordic

#(parameter width = 16)
(
    Xin,
    Yin
    angle,
    i,
    COSout,
    SINout,
);

#(parameter An = 32000/1.647)
(
    angleaux
)

output [width-1:0] Xin, Yin;
output [31:0] angle, angleaux;
output [63:0] i;

input wire [width-1:0] COSout, SINout;

initial begin
    x = x_start;
    y = y_start;
    Z = angle;
    i = 0;
end

always @(posedge clock) begin
    if (i < 6) begin
    if (y < 0) begin
        x <= x + (y >> i);
        y <= y + (x >> i);
        Z <= Z + $signed(-atan(2**(-i))216);
    end
    else begin
        x <= x - (y >> i);
        y <= y - (x >> i);
        Z <= Z + $signed(atan(2(-i))2**16);
    end
    i <= i + 1;
    end
    else begin
        cosine <= xAn/(2**width);
        sine <= yAn/(2**width);
        i <= 0;
    end
end

endmodule