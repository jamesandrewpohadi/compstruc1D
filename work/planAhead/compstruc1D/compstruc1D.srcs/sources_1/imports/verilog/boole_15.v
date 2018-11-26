/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module boole_15 (
    input [5:0] alufn,
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] c
  );
  
  
  
  integer n;
  
  integer in;
  
  always @* begin
    c = 16'h0000;
    for (n = 1'h0; n < 5'h10; n = n + 1) begin
      in = {b[(n)*1+0-:1], a[(n)*1+0-:1]};
      
      case (in)
        2'h0: begin
          c[(n)*1+0-:1] = alufn[0+0-:1];
        end
        2'h1: begin
          c[(n)*1+0-:1] = alufn[1+0-:1];
        end
        2'h2: begin
          c[(n)*1+0-:1] = alufn[2+0-:1];
        end
        2'h3: begin
          c[(n)*1+0-:1] = alufn[3+0-:1];
        end
      endcase
    end
  end
endmodule
