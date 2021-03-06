/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_34 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] c,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [8-1:0] M_myAdd_led;
  wire [16-1:0] M_myAdd_c;
  wire [1-1:0] M_myAdd_z;
  wire [1-1:0] M_myAdd_v;
  wire [1-1:0] M_myAdd_n;
  reg [6-1:0] M_myAdd_alufn;
  reg [16-1:0] M_myAdd_a;
  reg [16-1:0] M_myAdd_b;
  add_38 myAdd (
    .alufn(M_myAdd_alufn),
    .a(M_myAdd_a),
    .b(M_myAdd_b),
    .led(M_myAdd_led),
    .c(M_myAdd_c),
    .z(M_myAdd_z),
    .v(M_myAdd_v),
    .n(M_myAdd_n)
  );
  
  wire [16-1:0] M_myCmp_c;
  reg [6-1:0] M_myCmp_alufn;
  reg [1-1:0] M_myCmp_z;
  reg [1-1:0] M_myCmp_v;
  reg [1-1:0] M_myCmp_n;
  cmp_39 myCmp (
    .alufn(M_myCmp_alufn),
    .z(M_myCmp_z),
    .v(M_myCmp_v),
    .n(M_myCmp_n),
    .c(M_myCmp_c)
  );
  
  wire [16-1:0] M_myBoole_c;
  reg [6-1:0] M_myBoole_alufn;
  reg [16-1:0] M_myBoole_a;
  reg [16-1:0] M_myBoole_b;
  boole_40 myBoole (
    .alufn(M_myBoole_alufn),
    .a(M_myBoole_a),
    .b(M_myBoole_b),
    .c(M_myBoole_c)
  );
  
  wire [16-1:0] M_myShift_c;
  reg [6-1:0] M_myShift_alufn;
  reg [16-1:0] M_myShift_a;
  reg [16-1:0] M_myShift_b;
  shift_41 myShift (
    .alufn(M_myShift_alufn),
    .a(M_myShift_a),
    .b(M_myShift_b),
    .c(M_myShift_c)
  );
  
  always @* begin
    z = 1'h0;
    v = 1'h0;
    n = 1'h0;
    M_myAdd_alufn = alufn;
    M_myAdd_a = a;
    M_myAdd_b = b;
    c = 16'h0000;
    M_myCmp_alufn = alufn;
    M_myCmp_z = M_myAdd_z;
    M_myCmp_v = M_myAdd_v;
    M_myCmp_n = M_myAdd_n;
    M_myBoole_alufn = alufn;
    M_myBoole_a = a;
    M_myBoole_b = b;
    M_myShift_alufn = alufn;
    M_myShift_a = a;
    M_myShift_b = b;
    
    case (alufn[4+1-:2])
      2'h0: begin
        c = M_myAdd_c;
        z = M_myAdd_z;
        v = M_myAdd_v;
        n = M_myAdd_n;
      end
      2'h1: begin
        c = M_myBoole_c;
      end
      2'h2: begin
        c = M_myShift_c;
      end
      2'h3: begin
        c = M_myCmp_c;
      end
      default: begin
        c = 16'h0000;
      end
    endcase
  end
endmodule
