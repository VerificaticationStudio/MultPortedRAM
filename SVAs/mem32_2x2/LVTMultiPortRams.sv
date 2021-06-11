module Memory(
  input        clock,
  input  [4:0] io_rdAddr,
  output [7:0] io_rdData,
  input        io_wrEna,
  input  [7:0] io_wrData,
  input  [4:0] io_wrAddr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:31]; // @[Memory.scala 16:16]
  wire [7:0] mem_io_rdData_MPORT_data; // @[Memory.scala 16:16]
  wire [4:0] mem_io_rdData_MPORT_addr; // @[Memory.scala 16:16]
  wire [7:0] mem_MPORT_data; // @[Memory.scala 16:16]
  wire [4:0] mem_MPORT_addr; // @[Memory.scala 16:16]
  wire  mem_MPORT_mask; // @[Memory.scala 16:16]
  wire  mem_MPORT_en; // @[Memory.scala 16:16]
  assign mem_io_rdData_MPORT_addr = io_rdAddr;
  assign mem_io_rdData_MPORT_data = mem[mem_io_rdData_MPORT_addr]; // @[Memory.scala 16:16]
  assign mem_MPORT_data = io_wrData;
  assign mem_MPORT_addr = io_wrAddr;
  assign mem_MPORT_mask = 1'h1;
  assign mem_MPORT_en = io_wrEna;
  assign io_rdData = mem_io_rdData_MPORT_data; // @[Memory.scala 25:13]
  always @(posedge clock) begin
    if(mem_MPORT_en & mem_MPORT_mask) begin
      mem[mem_MPORT_addr] <= mem_MPORT_data; // @[Memory.scala 16:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    mem[initvar] = _RAND_0[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LiveValueTable(
  input        clock,
  input        reset,
  input  [4:0] io_wrAddr_0,
  input  [4:0] io_wrAddr_1,
  input        io_wrEna_0,
  input        io_wrEna_1,
  input  [4:0] io_rdAddr_0,
  input  [4:0] io_rdAddr_1,
  output       io_rdIdx_0,
  output       io_rdIdx_1
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg  lvtReg_0; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_1; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_2; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_3; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_4; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_5; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_6; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_7; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_8; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_9; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_10; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_11; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_12; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_13; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_14; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_15; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_16; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_17; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_18; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_19; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_20; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_21; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_22; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_23; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_24; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_25; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_26; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_27; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_28; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_29; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_30; // @[LVTMultiPortRams.scala 28:23]
  reg  lvtReg_31; // @[LVTMultiPortRams.scala 28:23]
  wire  _GEN_0 = 5'h0 == io_wrAddr_0 ? 1'h0 : lvtReg_0; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_1 = 5'h1 == io_wrAddr_0 ? 1'h0 : lvtReg_1; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_2 = 5'h2 == io_wrAddr_0 ? 1'h0 : lvtReg_2; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_3 = 5'h3 == io_wrAddr_0 ? 1'h0 : lvtReg_3; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_4 = 5'h4 == io_wrAddr_0 ? 1'h0 : lvtReg_4; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_5 = 5'h5 == io_wrAddr_0 ? 1'h0 : lvtReg_5; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_6 = 5'h6 == io_wrAddr_0 ? 1'h0 : lvtReg_6; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_7 = 5'h7 == io_wrAddr_0 ? 1'h0 : lvtReg_7; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_8 = 5'h8 == io_wrAddr_0 ? 1'h0 : lvtReg_8; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_9 = 5'h9 == io_wrAddr_0 ? 1'h0 : lvtReg_9; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_10 = 5'ha == io_wrAddr_0 ? 1'h0 : lvtReg_10; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_11 = 5'hb == io_wrAddr_0 ? 1'h0 : lvtReg_11; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_12 = 5'hc == io_wrAddr_0 ? 1'h0 : lvtReg_12; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_13 = 5'hd == io_wrAddr_0 ? 1'h0 : lvtReg_13; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_14 = 5'he == io_wrAddr_0 ? 1'h0 : lvtReg_14; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_15 = 5'hf == io_wrAddr_0 ? 1'h0 : lvtReg_15; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_16 = 5'h10 == io_wrAddr_0 ? 1'h0 : lvtReg_16; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_17 = 5'h11 == io_wrAddr_0 ? 1'h0 : lvtReg_17; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_18 = 5'h12 == io_wrAddr_0 ? 1'h0 : lvtReg_18; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_19 = 5'h13 == io_wrAddr_0 ? 1'h0 : lvtReg_19; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_20 = 5'h14 == io_wrAddr_0 ? 1'h0 : lvtReg_20; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_21 = 5'h15 == io_wrAddr_0 ? 1'h0 : lvtReg_21; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_22 = 5'h16 == io_wrAddr_0 ? 1'h0 : lvtReg_22; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_23 = 5'h17 == io_wrAddr_0 ? 1'h0 : lvtReg_23; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_24 = 5'h18 == io_wrAddr_0 ? 1'h0 : lvtReg_24; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_25 = 5'h19 == io_wrAddr_0 ? 1'h0 : lvtReg_25; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_26 = 5'h1a == io_wrAddr_0 ? 1'h0 : lvtReg_26; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_27 = 5'h1b == io_wrAddr_0 ? 1'h0 : lvtReg_27; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_28 = 5'h1c == io_wrAddr_0 ? 1'h0 : lvtReg_28; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_29 = 5'h1d == io_wrAddr_0 ? 1'h0 : lvtReg_29; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_30 = 5'h1e == io_wrAddr_0 ? 1'h0 : lvtReg_30; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_31 = 5'h1f == io_wrAddr_0 ? 1'h0 : lvtReg_31; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire  _GEN_32 = io_wrEna_0 ? _GEN_0 : lvtReg_0; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_33 = io_wrEna_0 ? _GEN_1 : lvtReg_1; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_34 = io_wrEna_0 ? _GEN_2 : lvtReg_2; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_35 = io_wrEna_0 ? _GEN_3 : lvtReg_3; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_36 = io_wrEna_0 ? _GEN_4 : lvtReg_4; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_37 = io_wrEna_0 ? _GEN_5 : lvtReg_5; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_38 = io_wrEna_0 ? _GEN_6 : lvtReg_6; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_39 = io_wrEna_0 ? _GEN_7 : lvtReg_7; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_40 = io_wrEna_0 ? _GEN_8 : lvtReg_8; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_41 = io_wrEna_0 ? _GEN_9 : lvtReg_9; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_42 = io_wrEna_0 ? _GEN_10 : lvtReg_10; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_43 = io_wrEna_0 ? _GEN_11 : lvtReg_11; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_44 = io_wrEna_0 ? _GEN_12 : lvtReg_12; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_45 = io_wrEna_0 ? _GEN_13 : lvtReg_13; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_46 = io_wrEna_0 ? _GEN_14 : lvtReg_14; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_47 = io_wrEna_0 ? _GEN_15 : lvtReg_15; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_48 = io_wrEna_0 ? _GEN_16 : lvtReg_16; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_49 = io_wrEna_0 ? _GEN_17 : lvtReg_17; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_50 = io_wrEna_0 ? _GEN_18 : lvtReg_18; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_51 = io_wrEna_0 ? _GEN_19 : lvtReg_19; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_52 = io_wrEna_0 ? _GEN_20 : lvtReg_20; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_53 = io_wrEna_0 ? _GEN_21 : lvtReg_21; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_54 = io_wrEna_0 ? _GEN_22 : lvtReg_22; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_55 = io_wrEna_0 ? _GEN_23 : lvtReg_23; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_56 = io_wrEna_0 ? _GEN_24 : lvtReg_24; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_57 = io_wrEna_0 ? _GEN_25 : lvtReg_25; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_58 = io_wrEna_0 ? _GEN_26 : lvtReg_26; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_59 = io_wrEna_0 ? _GEN_27 : lvtReg_27; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_60 = io_wrEna_0 ? _GEN_28 : lvtReg_28; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_61 = io_wrEna_0 ? _GEN_29 : lvtReg_29; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_62 = io_wrEna_0 ? _GEN_30 : lvtReg_30; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_63 = io_wrEna_0 ? _GEN_31 : lvtReg_31; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire  _GEN_64 = 5'h0 == io_wrAddr_1 | _GEN_32; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_65 = 5'h1 == io_wrAddr_1 | _GEN_33; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_66 = 5'h2 == io_wrAddr_1 | _GEN_34; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_67 = 5'h3 == io_wrAddr_1 | _GEN_35; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_68 = 5'h4 == io_wrAddr_1 | _GEN_36; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_69 = 5'h5 == io_wrAddr_1 | _GEN_37; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_70 = 5'h6 == io_wrAddr_1 | _GEN_38; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_71 = 5'h7 == io_wrAddr_1 | _GEN_39; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_72 = 5'h8 == io_wrAddr_1 | _GEN_40; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_73 = 5'h9 == io_wrAddr_1 | _GEN_41; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_74 = 5'ha == io_wrAddr_1 | _GEN_42; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_75 = 5'hb == io_wrAddr_1 | _GEN_43; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_76 = 5'hc == io_wrAddr_1 | _GEN_44; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_77 = 5'hd == io_wrAddr_1 | _GEN_45; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_78 = 5'he == io_wrAddr_1 | _GEN_46; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_79 = 5'hf == io_wrAddr_1 | _GEN_47; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_80 = 5'h10 == io_wrAddr_1 | _GEN_48; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_81 = 5'h11 == io_wrAddr_1 | _GEN_49; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_82 = 5'h12 == io_wrAddr_1 | _GEN_50; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_83 = 5'h13 == io_wrAddr_1 | _GEN_51; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_84 = 5'h14 == io_wrAddr_1 | _GEN_52; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_85 = 5'h15 == io_wrAddr_1 | _GEN_53; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_86 = 5'h16 == io_wrAddr_1 | _GEN_54; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_87 = 5'h17 == io_wrAddr_1 | _GEN_55; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_88 = 5'h18 == io_wrAddr_1 | _GEN_56; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_89 = 5'h19 == io_wrAddr_1 | _GEN_57; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_90 = 5'h1a == io_wrAddr_1 | _GEN_58; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_91 = 5'h1b == io_wrAddr_1 | _GEN_59; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_92 = 5'h1c == io_wrAddr_1 | _GEN_60; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_93 = 5'h1d == io_wrAddr_1 | _GEN_61; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_94 = 5'h1e == io_wrAddr_1 | _GEN_62; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_95 = 5'h1f == io_wrAddr_1 | _GEN_63; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire  _GEN_129 = 5'h1 == io_rdAddr_0 ? lvtReg_1 : lvtReg_0; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_130 = 5'h2 == io_rdAddr_0 ? lvtReg_2 : _GEN_129; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_131 = 5'h3 == io_rdAddr_0 ? lvtReg_3 : _GEN_130; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_132 = 5'h4 == io_rdAddr_0 ? lvtReg_4 : _GEN_131; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_133 = 5'h5 == io_rdAddr_0 ? lvtReg_5 : _GEN_132; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_134 = 5'h6 == io_rdAddr_0 ? lvtReg_6 : _GEN_133; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_135 = 5'h7 == io_rdAddr_0 ? lvtReg_7 : _GEN_134; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_136 = 5'h8 == io_rdAddr_0 ? lvtReg_8 : _GEN_135; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_137 = 5'h9 == io_rdAddr_0 ? lvtReg_9 : _GEN_136; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_138 = 5'ha == io_rdAddr_0 ? lvtReg_10 : _GEN_137; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_139 = 5'hb == io_rdAddr_0 ? lvtReg_11 : _GEN_138; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_140 = 5'hc == io_rdAddr_0 ? lvtReg_12 : _GEN_139; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_141 = 5'hd == io_rdAddr_0 ? lvtReg_13 : _GEN_140; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_142 = 5'he == io_rdAddr_0 ? lvtReg_14 : _GEN_141; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_143 = 5'hf == io_rdAddr_0 ? lvtReg_15 : _GEN_142; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_144 = 5'h10 == io_rdAddr_0 ? lvtReg_16 : _GEN_143; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_145 = 5'h11 == io_rdAddr_0 ? lvtReg_17 : _GEN_144; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_146 = 5'h12 == io_rdAddr_0 ? lvtReg_18 : _GEN_145; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_147 = 5'h13 == io_rdAddr_0 ? lvtReg_19 : _GEN_146; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_148 = 5'h14 == io_rdAddr_0 ? lvtReg_20 : _GEN_147; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_149 = 5'h15 == io_rdAddr_0 ? lvtReg_21 : _GEN_148; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_150 = 5'h16 == io_rdAddr_0 ? lvtReg_22 : _GEN_149; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_151 = 5'h17 == io_rdAddr_0 ? lvtReg_23 : _GEN_150; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_152 = 5'h18 == io_rdAddr_0 ? lvtReg_24 : _GEN_151; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_153 = 5'h19 == io_rdAddr_0 ? lvtReg_25 : _GEN_152; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_154 = 5'h1a == io_rdAddr_0 ? lvtReg_26 : _GEN_153; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_155 = 5'h1b == io_rdAddr_0 ? lvtReg_27 : _GEN_154; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_156 = 5'h1c == io_rdAddr_0 ? lvtReg_28 : _GEN_155; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_157 = 5'h1d == io_rdAddr_0 ? lvtReg_29 : _GEN_156; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_158 = 5'h1e == io_rdAddr_0 ? lvtReg_30 : _GEN_157; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_161 = 5'h1 == io_rdAddr_1 ? lvtReg_1 : lvtReg_0; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_162 = 5'h2 == io_rdAddr_1 ? lvtReg_2 : _GEN_161; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_163 = 5'h3 == io_rdAddr_1 ? lvtReg_3 : _GEN_162; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_164 = 5'h4 == io_rdAddr_1 ? lvtReg_4 : _GEN_163; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_165 = 5'h5 == io_rdAddr_1 ? lvtReg_5 : _GEN_164; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_166 = 5'h6 == io_rdAddr_1 ? lvtReg_6 : _GEN_165; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_167 = 5'h7 == io_rdAddr_1 ? lvtReg_7 : _GEN_166; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_168 = 5'h8 == io_rdAddr_1 ? lvtReg_8 : _GEN_167; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_169 = 5'h9 == io_rdAddr_1 ? lvtReg_9 : _GEN_168; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_170 = 5'ha == io_rdAddr_1 ? lvtReg_10 : _GEN_169; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_171 = 5'hb == io_rdAddr_1 ? lvtReg_11 : _GEN_170; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_172 = 5'hc == io_rdAddr_1 ? lvtReg_12 : _GEN_171; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_173 = 5'hd == io_rdAddr_1 ? lvtReg_13 : _GEN_172; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_174 = 5'he == io_rdAddr_1 ? lvtReg_14 : _GEN_173; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_175 = 5'hf == io_rdAddr_1 ? lvtReg_15 : _GEN_174; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_176 = 5'h10 == io_rdAddr_1 ? lvtReg_16 : _GEN_175; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_177 = 5'h11 == io_rdAddr_1 ? lvtReg_17 : _GEN_176; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_178 = 5'h12 == io_rdAddr_1 ? lvtReg_18 : _GEN_177; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_179 = 5'h13 == io_rdAddr_1 ? lvtReg_19 : _GEN_178; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_180 = 5'h14 == io_rdAddr_1 ? lvtReg_20 : _GEN_179; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_181 = 5'h15 == io_rdAddr_1 ? lvtReg_21 : _GEN_180; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_182 = 5'h16 == io_rdAddr_1 ? lvtReg_22 : _GEN_181; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_183 = 5'h17 == io_rdAddr_1 ? lvtReg_23 : _GEN_182; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_184 = 5'h18 == io_rdAddr_1 ? lvtReg_24 : _GEN_183; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_185 = 5'h19 == io_rdAddr_1 ? lvtReg_25 : _GEN_184; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_186 = 5'h1a == io_rdAddr_1 ? lvtReg_26 : _GEN_185; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_187 = 5'h1b == io_rdAddr_1 ? lvtReg_27 : _GEN_186; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_188 = 5'h1c == io_rdAddr_1 ? lvtReg_28 : _GEN_187; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_189 = 5'h1d == io_rdAddr_1 ? lvtReg_29 : _GEN_188; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire  _GEN_190 = 5'h1e == io_rdAddr_1 ? lvtReg_30 : _GEN_189; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  assign io_rdIdx_0 = 5'h1f == io_rdAddr_0 ? lvtReg_31 : _GEN_158; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  assign io_rdIdx_1 = 5'h1f == io_rdAddr_1 ? lvtReg_31 : _GEN_190; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  always @(posedge clock) begin
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_0 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_0 <= _GEN_64;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h0 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_0 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_1 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_1 <= _GEN_65;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h1 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_1 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_2 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_2 <= _GEN_66;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h2 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_2 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_3 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_3 <= _GEN_67;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h3 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_3 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_4 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_4 <= _GEN_68;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h4 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_4 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_5 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_5 <= _GEN_69;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h5 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_5 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_6 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_6 <= _GEN_70;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h6 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_6 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_7 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_7 <= _GEN_71;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h7 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_7 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_8 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_8 <= _GEN_72;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h8 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_8 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_9 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_9 <= _GEN_73;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h9 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_9 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_10 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_10 <= _GEN_74;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'ha == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_10 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_11 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_11 <= _GEN_75;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'hb == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_11 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_12 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_12 <= _GEN_76;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'hc == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_12 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_13 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_13 <= _GEN_77;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'hd == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_13 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_14 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_14 <= _GEN_78;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'he == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_14 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_15 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_15 <= _GEN_79;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'hf == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_15 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_16 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_16 <= _GEN_80;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h10 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_16 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_17 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_17 <= _GEN_81;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h11 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_17 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_18 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_18 <= _GEN_82;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h12 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_18 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_19 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_19 <= _GEN_83;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h13 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_19 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_20 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_20 <= _GEN_84;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h14 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_20 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_21 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_21 <= _GEN_85;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h15 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_21 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_22 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_22 <= _GEN_86;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h16 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_22 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_23 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_23 <= _GEN_87;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h17 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_23 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_24 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_24 <= _GEN_88;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h18 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_24 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_25 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_25 <= _GEN_89;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h19 == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_25 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_26 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_26 <= _GEN_90;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h1a == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_26 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_27 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_27 <= _GEN_91;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h1b == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_27 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_28 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_28 <= _GEN_92;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h1c == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_28 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_29 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_29 <= _GEN_93;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h1d == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_29 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_30 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_30 <= _GEN_94;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h1e == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_30 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_31 <= 1'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_1) begin // @[LVTMultiPortRams.scala 31:34]
      lvtReg_31 <= _GEN_95;
    end else if (io_wrEna_0) begin // @[LVTMultiPortRams.scala 31:34]
      if (5'h1f == io_wrAddr_0) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_31 <= 1'h0; // @[LVTMultiPortRams.scala 32:28]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  lvtReg_0 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  lvtReg_1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  lvtReg_2 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  lvtReg_3 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  lvtReg_4 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  lvtReg_5 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  lvtReg_6 = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  lvtReg_7 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  lvtReg_8 = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  lvtReg_9 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  lvtReg_10 = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  lvtReg_11 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  lvtReg_12 = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  lvtReg_13 = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  lvtReg_14 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  lvtReg_15 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  lvtReg_16 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  lvtReg_17 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  lvtReg_18 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  lvtReg_19 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  lvtReg_20 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  lvtReg_21 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  lvtReg_22 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  lvtReg_23 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  lvtReg_24 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  lvtReg_25 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  lvtReg_26 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  lvtReg_27 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  lvtReg_28 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  lvtReg_29 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  lvtReg_30 = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  lvtReg_31 = _RAND_31[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LVTMultiPortRams(
  input        clock,
  input        reset,
  input  [4:0] io_wrAddr_0,
  input  [4:0] io_wrAddr_1,
  input  [7:0] io_wrData_0,
  input  [7:0] io_wrData_1,
  input        io_wrEna_0,
  input        io_wrEna_1,
  input  [4:0] io_rdAddr_0,
  input  [4:0] io_rdAddr_1,
  output [7:0] io_rdData_0,
  output [7:0] io_rdData_1
);
  wire  Memory_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [4:0] Memory_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [4:0] Memory_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_1_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [4:0] Memory_1_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_1_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_1_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_1_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [4:0] Memory_1_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_2_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [4:0] Memory_2_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_2_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_2_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_2_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [4:0] Memory_2_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_3_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [4:0] Memory_3_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_3_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_3_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_3_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [4:0] Memory_3_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  lvt_clock; // @[LVTMultiPortRams.scala 53:19]
  wire  lvt_reset; // @[LVTMultiPortRams.scala 53:19]
  wire [4:0] lvt_io_wrAddr_0; // @[LVTMultiPortRams.scala 53:19]
  wire [4:0] lvt_io_wrAddr_1; // @[LVTMultiPortRams.scala 53:19]
  wire  lvt_io_wrEna_0; // @[LVTMultiPortRams.scala 53:19]
  wire  lvt_io_wrEna_1; // @[LVTMultiPortRams.scala 53:19]
  wire [4:0] lvt_io_rdAddr_0; // @[LVTMultiPortRams.scala 53:19]
  wire [4:0] lvt_io_rdAddr_1; // @[LVTMultiPortRams.scala 53:19]
  wire  lvt_io_rdIdx_0; // @[LVTMultiPortRams.scala 53:19]
  wire  lvt_io_rdIdx_1; // @[LVTMultiPortRams.scala 53:19]
  wire [2:0] _io_rdData_0_T = lvt_io_rdIdx_0 * 2'h2; // @[LVTMultiPortRams.scala 72:30]
  wire [3:0] _io_rdData_0_T_1 = {{1'd0}, _io_rdData_0_T}; // @[LVTMultiPortRams.scala 72:36]
  wire [7:0] mems_0_rdData = Memory_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] mems_1_rdData = Memory_1_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] _GEN_6 = 2'h1 == _io_rdData_0_T_1[1:0] ? mems_1_rdData : mems_0_rdData; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] mems_2_rdData = Memory_2_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] _GEN_11 = 2'h2 == _io_rdData_0_T_1[1:0] ? mems_2_rdData : _GEN_6; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] mems_3_rdData = Memory_3_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [2:0] _io_rdData_1_T = lvt_io_rdIdx_1 * 2'h2; // @[LVTMultiPortRams.scala 72:30]
  wire [2:0] _io_rdData_1_T_2 = _io_rdData_1_T + 3'h1; // @[LVTMultiPortRams.scala 72:36]
  wire [7:0] _GEN_26 = 2'h1 == _io_rdData_1_T_2[1:0] ? mems_1_rdData : mems_0_rdData; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_31 = 2'h2 == _io_rdData_1_T_2[1:0] ? mems_2_rdData : _GEN_26; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  Memory Memory ( // @[LVTMultiPortRams.scala 52:44]
    .clock(Memory_clock),
    .io_rdAddr(Memory_io_rdAddr),
    .io_rdData(Memory_io_rdData),
    .io_wrEna(Memory_io_wrEna),
    .io_wrData(Memory_io_wrData),
    .io_wrAddr(Memory_io_wrAddr)
  );
  Memory Memory_1 ( // @[LVTMultiPortRams.scala 52:44]
    .clock(Memory_1_clock),
    .io_rdAddr(Memory_1_io_rdAddr),
    .io_rdData(Memory_1_io_rdData),
    .io_wrEna(Memory_1_io_wrEna),
    .io_wrData(Memory_1_io_wrData),
    .io_wrAddr(Memory_1_io_wrAddr)
  );
  Memory Memory_2 ( // @[LVTMultiPortRams.scala 52:44]
    .clock(Memory_2_clock),
    .io_rdAddr(Memory_2_io_rdAddr),
    .io_rdData(Memory_2_io_rdData),
    .io_wrEna(Memory_2_io_wrEna),
    .io_wrData(Memory_2_io_wrData),
    .io_wrAddr(Memory_2_io_wrAddr)
  );
  Memory Memory_3 ( // @[LVTMultiPortRams.scala 52:44]
    .clock(Memory_3_clock),
    .io_rdAddr(Memory_3_io_rdAddr),
    .io_rdData(Memory_3_io_rdData),
    .io_wrEna(Memory_3_io_wrEna),
    .io_wrData(Memory_3_io_wrData),
    .io_wrAddr(Memory_3_io_wrAddr)
  );
  LiveValueTable lvt ( // @[LVTMultiPortRams.scala 53:19]
    .clock(lvt_clock),
    .reset(lvt_reset),
    .io_wrAddr_0(lvt_io_wrAddr_0),
    .io_wrAddr_1(lvt_io_wrAddr_1),
    .io_wrEna_0(lvt_io_wrEna_0),
    .io_wrEna_1(lvt_io_wrEna_1),
    .io_rdAddr_0(lvt_io_rdAddr_0),
    .io_rdAddr_1(lvt_io_rdAddr_1),
    .io_rdIdx_0(lvt_io_rdIdx_0),
    .io_rdIdx_1(lvt_io_rdIdx_1)
  );
  assign io_rdData_0 = 2'h3 == _io_rdData_0_T_1[1:0] ? mems_3_rdData : _GEN_11; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  assign io_rdData_1 = 2'h3 == _io_rdData_1_T_2[1:0] ? mems_3_rdData : _GEN_31; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  assign Memory_clock = clock;
  assign Memory_io_rdAddr = io_rdAddr_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_io_wrEna = io_wrEna_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_io_wrData = io_wrData_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_io_wrAddr = io_wrAddr_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign Memory_1_clock = clock;
  assign Memory_1_io_rdAddr = io_rdAddr_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_1_io_wrEna = io_wrEna_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_1_io_wrData = io_wrData_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_1_io_wrAddr = io_wrAddr_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign Memory_2_clock = clock;
  assign Memory_2_io_rdAddr = io_rdAddr_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_2_io_wrEna = io_wrEna_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_2_io_wrData = io_wrData_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_2_io_wrAddr = io_wrAddr_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign Memory_3_clock = clock;
  assign Memory_3_io_rdAddr = io_rdAddr_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_3_io_wrEna = io_wrEna_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_3_io_wrData = io_wrData_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_3_io_wrAddr = io_wrAddr_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign lvt_clock = clock;
  assign lvt_reset = reset;
  assign lvt_io_wrAddr_0 = io_wrAddr_0; // @[LVTMultiPortRams.scala 65:22]
  assign lvt_io_wrAddr_1 = io_wrAddr_1; // @[LVTMultiPortRams.scala 65:22]
  assign lvt_io_wrEna_0 = io_wrEna_0; // @[LVTMultiPortRams.scala 64:21]
  assign lvt_io_wrEna_1 = io_wrEna_1; // @[LVTMultiPortRams.scala 64:21]
  assign lvt_io_rdAddr_0 = io_rdAddr_0; // @[LVTMultiPortRams.scala 68:22]
  assign lvt_io_rdAddr_1 = io_rdAddr_1; // @[LVTMultiPortRams.scala 68:22]

  integer addr_0 = 4'h5;
  integer data_0 = 8'h1f;
  integer addr_1 = 4'h6;
  integer data_1 = 8'h7;

  // multi-port
  sequence ant0;
    (reset == 0) && (io_wrAddr_0 == addr_0) && (io_wrData_0 == data_0) && (io_wrEna_0 == 1'b1) &&
    (io_wrAddr_1 == addr_1) && (io_wrData_1 == data_1) && (io_wrEna_1 == 1'b1);
  endsequence
  sequence u0;
    ##1 (lvt.lvtReg_5 == 0) && (Memory.mem[5] == data_0) && (Memory_1.mem[5] == data_0) && (lvt.lvtReg_6 == 1) && (Memory_2.mem[6] == data_1) && (Memory_3.mem[6] == data_1);
  endsequence
  assert property(@(posedge clock) ant0 |-> u0);

  sequence ant1;
    ((reset == 0) && (lvt.lvtReg_5 == 0) && (Memory.mem[5] == data_0) && (Memory_1.mem[5] == data_0) && (lvt.lvtReg_6 == 1) && (Memory_2.mem[6] == data_1) && (Memory_3.mem[6] == data_1) && (io_wrEna_0 == 1'b0 || (io_wrAddr_0 != addr_0 && io_wrAddr_0 != addr_1)) && (io_wrEna_1 == 1'b0 || (io_wrAddr_1 != addr_0 && io_wrAddr_1 != addr_1))) ##1 ((reset == 0) && (io_wrEna_0 == 1'b0 || (io_wrAddr_0 != addr_0 && io_wrAddr_0 != addr_1)) && (io_wrEna_1 == 1'b0 || (io_wrAddr_1 != addr_0 && io_wrAddr_1 != addr_1)))[*3];
  endsequence
  sequence u1;
    ##1 (lvt.lvtReg_5 == 0) && (Memory.mem[5] == data_0) && (Memory_1.mem[5] == data_0) && (lvt.lvtReg_6 == 1) && (Memory_2.mem[6] == data_1) && (Memory_3.mem[6] == data_1);
  endsequence
  assert property(@(posedge clock) ant1 |-> u1);

  sequence ant2;
    (lvt.lvtReg_5 == 0) && (Memory.mem[5] == data_0) && (Memory_1.mem[5] == data_0) && (lvt.lvtReg_6 == 1) && (Memory_2.mem[6] == data_1) && (Memory_3.mem[6] == data_1) && (io_rdAddr_0 == addr_0) && (io_rdAddr_1 == addr_1);
  endsequence
  sequence cons2;
    (io_rdData_0 == data_0) && (io_rdData_1 == data_1);
  endsequence
  assert property(@(posedge clock) ant2 |-> cons2);
endmodule
