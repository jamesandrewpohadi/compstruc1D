/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module board_33 (
    input [15:0] b,
    output reg x0,
    output reg x1,
    output reg x2,
    output reg x3,
    output reg x4,
    output reg x5,
    output reg x6,
    output reg x7,
    output reg y0,
    output reg y1,
    output reg y2,
    output reg y3,
    output reg y4,
    output reg y5,
    output reg y6,
    output reg y7
  );
  
  
  
  always @* begin
    x0 = 1'h1;
    x1 = 1'h1;
    x2 = 1'h1;
    x3 = 1'h1;
    x4 = 1'h1;
    x5 = 1'h1;
    x6 = 1'h1;
    x7 = 1'h1;
    y0 = 1'h0;
    y1 = 1'h0;
    y2 = 1'h0;
    y3 = 1'h0;
    y4 = 1'h0;
    y5 = 1'h0;
    y6 = 1'h0;
    y7 = 1'h0;
    if (b[15+0-:1]) begin
      x0 = 1'h0;
      x1 = 1'h0;
      y6 = 1'h1;
      y7 = 1'h1;
    end
    if (b[14+0-:1]) begin
      x2 = 1'h0;
      x3 = 1'h0;
      y6 = 1'h1;
      y7 = 1'h1;
    end
    if (b[13+0-:1]) begin
      x4 = 1'h0;
      x5 = 1'h0;
      y6 = 1'h1;
      y7 = 1'h1;
    end
    if (b[12+0-:1]) begin
      x6 = 1'h0;
      x7 = 1'h0;
      y6 = 1'h1;
      y7 = 1'h1;
    end
    if (b[11+0-:1]) begin
      x0 = 1'h0;
      x1 = 1'h0;
      y4 = 1'h1;
      y5 = 1'h1;
    end
    if (b[10+0-:1]) begin
      x2 = 1'h0;
      x3 = 1'h0;
      y4 = 1'h1;
      y5 = 1'h1;
    end
    if (b[9+0-:1]) begin
      x4 = 1'h0;
      x5 = 1'h0;
      y4 = 1'h1;
      y5 = 1'h1;
    end
    if (b[8+0-:1]) begin
      x6 = 1'h0;
      x7 = 1'h0;
      y4 = 1'h1;
      y5 = 1'h1;
    end
    if (b[7+0-:1]) begin
      x0 = 1'h0;
      x1 = 1'h0;
      y2 = 1'h1;
      y3 = 1'h1;
    end
    if (b[6+0-:1]) begin
      x2 = 1'h0;
      x3 = 1'h0;
      y2 = 1'h1;
      y3 = 1'h1;
    end
    if (b[5+0-:1]) begin
      x4 = 1'h0;
      x5 = 1'h0;
      y2 = 1'h1;
      y3 = 1'h1;
    end
    if (b[4+0-:1]) begin
      x6 = 1'h0;
      x7 = 1'h0;
      y2 = 1'h1;
      y3 = 1'h1;
    end
    if (b[3+0-:1]) begin
      x0 = 1'h0;
      x1 = 1'h0;
      y0 = 1'h1;
      y1 = 1'h1;
    end
    if (b[2+0-:1]) begin
      x2 = 1'h0;
      x3 = 1'h0;
      y0 = 1'h1;
      y1 = 1'h1;
    end
    if (b[1+0-:1]) begin
      x4 = 1'h0;
      x5 = 1'h0;
      y0 = 1'h1;
      y1 = 1'h1;
    end
    if (b[0+0-:1]) begin
      x6 = 1'h0;
      x7 = 1'h0;
      y0 = 1'h1;
      y1 = 1'h1;
    end
  end
endmodule
