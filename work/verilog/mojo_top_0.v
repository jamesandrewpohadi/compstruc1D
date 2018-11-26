/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  localparam IDLE_state = 5'd0;
  localparam CHECK_state = 5'd1;
  localparam INCR_state = 5'd2;
  localparam PRE_L_state = 5'd3;
  localparam PRE_R_state = 5'd4;
  localparam PRE_U_state = 5'd5;
  localparam PRE_D_state = 5'd6;
  localparam PRE_O_state = 5'd7;
  localparam L_state = 5'd8;
  localparam R_state = 5'd9;
  localparam U_state = 5'd10;
  localparam D_state = 5'd11;
  localparam O_state = 5'd12;
  localparam PRE_L1_state = 5'd13;
  localparam L1_state = 5'd14;
  localparam PRE_L2_state = 5'd15;
  localparam L2_state = 5'd16;
  localparam PRE_L3_state = 5'd17;
  localparam L3_state = 5'd18;
  localparam L1_DS1_state = 5'd19;
  localparam L1_DS2_state = 5'd20;
  localparam L1_DS3_state = 5'd21;
  localparam L1_DS4_state = 5'd22;
  localparam L1_DSW_state = 5'd23;
  localparam L1_P1_state = 5'd24;
  localparam L1_P2_state = 5'd25;
  localparam L1_P3_state = 5'd26;
  localparam L1_P4_state = 5'd27;
  localparam L1_PW_state = 5'd28;
  localparam DF_state = 5'd29;
  
  reg [4:0] M_state_d, M_state_q = IDLE_state;
  
  reg [27:0] M_counter_d, M_counter_q = 1'h0;
  
  wire [16-1:0] M_myGame_display;
  wire [4-1:0] M_myGame_sqc;
  wire [2-1:0] M_myGame_lvl;
  wire [16-1:0] M_myGame_eq;
  reg [6-1:0] M_myGame_alufn;
  reg [1-1:0] M_myGame_wb;
  reg [1-1:0] M_myGame_wl;
  reg [1-1:0] M_myGame_ws;
  reg [1-1:0] M_myGame_rstb;
  reg [1-1:0] M_myGame_rstl;
  reg [1-1:0] M_myGame_rsts;
  reg [1-1:0] M_myGame_bsel;
  reg [3-1:0] M_myGame_asel;
  emulator_2 myGame (
    .clk(clk),
    .rst(rst),
    .alufn(M_myGame_alufn),
    .wb(M_myGame_wb),
    .wl(M_myGame_wl),
    .ws(M_myGame_ws),
    .rstb(M_myGame_rstb),
    .rstl(M_myGame_rstl),
    .rsts(M_myGame_rsts),
    .bsel(M_myGame_bsel),
    .asel(M_myGame_asel),
    .display(M_myGame_display),
    .sqc(M_myGame_sqc),
    .lvl(M_myGame_lvl),
    .eq(M_myGame_eq)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_counter_d = M_counter_q + 1'h1;
    M_myGame_wb = 1'h0;
    M_myGame_wl = 1'h0;
    M_myGame_ws = 1'h0;
    M_myGame_rstb = 1'h0;
    M_myGame_rstl = 1'h0;
    M_myGame_rsts = 1'h0;
    M_myGame_bsel = 1'h0;
    M_myGame_asel = 3'h0;
    M_myGame_alufn = 6'h00;
    io_led[8+7-:8] = M_myGame_display[8+7-:8];
    io_led[0+7-:8] = M_myGame_display[0+7-:8];
    
    case (M_state_q)
      IDLE_state: begin
        if (io_dip[16+7+0-:1]) begin
          M_myGame_rstl = 3'h1;
          M_myGame_wl = 1'h1;
          M_state_d = PRE_L1_state;
        end
        if (io_dip[16+6+0-:1]) begin
          M_myGame_rstl = 3'h2;
          M_myGame_wl = 1'h1;
          M_state_d = PRE_L2_state;
        end
        if (io_dip[16+5+0-:1]) begin
          M_myGame_rstl = 3'h3;
          M_myGame_wl = 1'h1;
          M_state_d = PRE_L3_state;
        end
      end
      PRE_U_state: begin
        if (!io_button[0+0-:1]) begin
          M_state_d = U_state;
        end
      end
      U_state: begin
        M_myGame_wb = 1'h1;
        M_myGame_rstb = 1'h0;
        M_myGame_asel = 3'h2;
        M_myGame_bsel = 1'h0;
        M_myGame_alufn = 6'h20;
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h11) begin
          M_state_d = L1_P1_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h12) begin
          M_state_d = L1_P2_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h13) begin
          M_state_d = L1_P3_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h14) begin
          M_state_d = L1_P4_state;
        end
      end
      PRE_D_state: begin
        if (!io_button[2+0-:1]) begin
          M_state_d = U_state;
        end
      end
      D_state: begin
        M_myGame_wb = 1'h1;
        M_myGame_rstb = 1'h0;
        M_myGame_asel = 3'h2;
        M_myGame_bsel = 1'h0;
        M_myGame_alufn = 6'h21;
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h11) begin
          M_state_d = L1_P1_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h12) begin
          M_state_d = L1_P2_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h13) begin
          M_state_d = L1_P3_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h14) begin
          M_state_d = L1_P4_state;
        end
      end
      PRE_L_state: begin
        if (!io_button[3+0-:1]) begin
          M_state_d = U_state;
        end
      end
      L_state: begin
        M_myGame_wb = 1'h1;
        M_myGame_rstb = 1'h0;
        M_myGame_asel = 3'h1;
        M_myGame_bsel = 1'h0;
        M_myGame_alufn = 6'h20;
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h11) begin
          M_state_d = L1_P1_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h12) begin
          M_state_d = L1_P2_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h13) begin
          M_state_d = L1_P3_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h14) begin
          M_state_d = L1_P4_state;
        end
      end
      PRE_R_state: begin
        if (!io_button[4+0-:1]) begin
          M_state_d = U_state;
        end
      end
      R_state: begin
        M_myGame_wb = 1'h1;
        M_myGame_rstb = 1'h0;
        M_myGame_asel = 3'h1;
        M_myGame_bsel = 1'h0;
        M_myGame_alufn = 6'h20;
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h11) begin
          M_state_d = L1_P1_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h12) begin
          M_state_d = L1_P2_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h13) begin
          M_state_d = L1_P3_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h14) begin
          M_state_d = L1_P4_state;
        end
      end
      CHECK_state: begin
        if (!io_button[1+0-:1]) begin
          M_myGame_asel = 3'h0;
          M_myGame_bsel = 1'h0;
          M_myGame_alufn = 6'h33;
          if (M_myGame_eq[0+0-:1]) begin
            M_state_d = INCR_state;
          end else begin
            M_state_d = DF_state;
          end
        end
      end
      INCR_state: begin
        M_myGame_alufn = 6'h00;
        M_myGame_asel = 3'h1;
        M_myGame_bsel = 1'h1;
        M_myGame_ws = 1'h1;
        M_myGame_rsts = 1'h0;
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h12) begin
          M_state_d = L1_P2_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h13) begin
          M_state_d = L1_P3_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h14) begin
          M_state_d = L1_P4_state;
        end
        if ({M_myGame_lvl, M_myGame_sqc} == 6'h15) begin
          M_state_d = L1_PW_state;
        end
      end
      DF_state: begin
        if (io_button[0+0-:1]) begin
          M_state_d = IDLE_state;
        end
      end
      PRE_L1_state: begin
        io_led[16+7-:8] = 8'h03;
        if (!io_dip[16+7+0-:1]) begin
          M_counter_d = 1'h0;
          M_state_d = L1_state;
        end
      end
      L1_state: begin
        io_led[16+7-:8] = {M_myGame_lvl, M_myGame_sqc};
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_myGame_alufn = 6'h00;
          M_myGame_asel = 3'h1;
          M_myGame_bsel = 1'h1;
          M_myGame_ws = 1'h1;
          M_myGame_rsts = 1'h0;
          M_counter_d = 1'h0;
          M_state_d = L1_DS1_state;
        end
      end
      L1_DS1_state: begin
        io_led[16+7-:8] = {M_myGame_lvl, M_myGame_sqc};
        M_myGame_asel = 3'h0;
        M_myGame_alufn = 6'h1a;
        M_myGame_rstb = 1'h0;
        M_myGame_wb = 1'h1;
        io_led[8+7-:8] = M_myGame_display[8+7-:8];
        io_led[0+7-:8] = M_myGame_display[0+7-:8];
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_myGame_alufn = 6'h00;
          M_myGame_asel = 3'h1;
          M_myGame_bsel = 1'h1;
          M_myGame_ws = 1'h1;
          M_myGame_rsts = 1'h0;
          M_counter_d = 1'h0;
          M_state_d = L1_DS2_state;
        end
      end
      L1_DS2_state: begin
        io_led[16+7-:8] = {M_myGame_lvl, M_myGame_sqc};
        M_myGame_asel = 3'h0;
        M_myGame_alufn = 6'h1a;
        M_myGame_rstb = 1'h0;
        M_myGame_wb = 1'h1;
        io_led[8+7-:8] = M_myGame_display[8+7-:8];
        io_led[0+7-:8] = M_myGame_display[0+7-:8];
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_myGame_alufn = 6'h00;
          M_myGame_asel = 3'h1;
          M_myGame_bsel = 1'h1;
          M_myGame_ws = 1'h1;
          M_myGame_rsts = 1'h0;
          M_counter_d = 1'h0;
          M_state_d = L1_DS3_state;
        end
      end
      L1_DS3_state: begin
        io_led[16+7-:8] = {M_myGame_lvl, M_myGame_sqc};
        M_myGame_asel = 3'h0;
        M_myGame_alufn = 6'h1a;
        M_myGame_rstb = 1'h0;
        M_myGame_wb = 1'h1;
        io_led[8+7-:8] = M_myGame_display[8+7-:8];
        io_led[0+7-:8] = M_myGame_display[0+7-:8];
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_myGame_alufn = 6'h00;
          M_myGame_asel = 3'h1;
          M_myGame_bsel = 1'h1;
          M_myGame_ws = 1'h1;
          M_myGame_rsts = 1'h0;
          M_counter_d = 1'h0;
          M_state_d = L1_DS4_state;
        end
      end
      L1_DS4_state: begin
        io_led[16+7-:8] = {M_myGame_lvl, M_myGame_sqc};
        M_myGame_asel = 3'h0;
        M_myGame_alufn = 6'h1a;
        M_myGame_rstb = 1'h0;
        M_myGame_wb = 1'h1;
        io_led[8+7-:8] = M_myGame_display[8+7-:8];
        io_led[0+7-:8] = M_myGame_display[0+7-:8];
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_myGame_alufn = 6'h00;
          M_myGame_asel = 3'h1;
          M_myGame_bsel = 1'h1;
          M_myGame_ws = 1'h1;
          M_myGame_rsts = 1'h0;
          M_counter_d = 1'h0;
          M_state_d = L1_DSW_state;
        end
      end
      L1_DSW_state: begin
        io_led[16+7-:8] = {M_myGame_lvl, M_myGame_sqc};
        M_myGame_asel = 3'h0;
        M_myGame_alufn = 6'h1a;
        M_myGame_rstb = 1'h0;
        M_myGame_wb = 1'h1;
        io_led[8+7-:8] = M_myGame_display[8+7-:8];
        io_led[0+7-:8] = M_myGame_display[0+7-:8];
        if (M_counter_q[27+0-:1] == 1'h1) begin
          M_myGame_rsts = 1'h1;
          M_myGame_ws = 1'h1;
          M_state_d = L1_P1_state;
        end
      end
      L1_P1_state: begin
        if (io_button[1+0-:1]) begin
          M_state_d = CHECK_state;
        end
        if (io_button[0+0-:1]) begin
          M_state_d = PRE_U_state;
        end
        if (io_button[2+0-:1]) begin
          M_state_d = PRE_D_state;
        end
        if (io_button[3+0-:1]) begin
          M_state_d = PRE_L_state;
        end
        if (io_button[4+0-:1]) begin
          M_state_d = PRE_R_state;
        end
      end
      L1_P2_state: begin
        if (io_button[1+0-:1]) begin
          M_state_d = CHECK_state;
        end
        if (io_button[0+0-:1]) begin
          M_state_d = PRE_U_state;
        end
        if (io_button[2+0-:1]) begin
          M_state_d = PRE_D_state;
        end
        if (io_button[3+0-:1]) begin
          M_state_d = PRE_L_state;
        end
        if (io_button[4+0-:1]) begin
          M_state_d = PRE_R_state;
        end
      end
      L1_P3_state: begin
        if (io_button[1+0-:1]) begin
          M_state_d = CHECK_state;
        end
        if (io_button[0+0-:1]) begin
          M_state_d = PRE_U_state;
        end
        if (io_button[2+0-:1]) begin
          M_state_d = PRE_D_state;
        end
        if (io_button[3+0-:1]) begin
          M_state_d = PRE_L_state;
        end
        if (io_button[4+0-:1]) begin
          M_state_d = PRE_R_state;
        end
      end
      L1_P4_state: begin
        if (io_button[1+0-:1]) begin
          M_state_d = CHECK_state;
        end
        if (io_button[0+0-:1]) begin
          M_state_d = PRE_U_state;
        end
        if (io_button[2+0-:1]) begin
          M_state_d = PRE_D_state;
        end
        if (io_button[3+0-:1]) begin
          M_state_d = PRE_L_state;
        end
        if (io_button[4+0-:1]) begin
          M_state_d = PRE_R_state;
        end
      end
      L1_PW_state: begin
        if (io_button[1+0-:1]) begin
          M_state_d = IDLE_state;
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
endmodule
