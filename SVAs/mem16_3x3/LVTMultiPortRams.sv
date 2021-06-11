module Memory(
  input        clock,
  input  [3:0] io_rdAddr,
  output [7:0] io_rdData,
  input        io_wrEna,
  input  [7:0] io_wrData,
  input  [3:0] io_wrAddr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] mem [0:15]; // @[Memory.scala 16:16]
  wire [7:0] mem_io_rdData_MPORT_data; // @[Memory.scala 16:16]
  wire [3:0] mem_io_rdData_MPORT_addr; // @[Memory.scala 16:16]
  wire [7:0] mem_MPORT_data; // @[Memory.scala 16:16]
  wire [3:0] mem_MPORT_addr; // @[Memory.scala 16:16]
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
  for (initvar = 0; initvar < 16; initvar = initvar+1)
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
  input  [3:0] io_wrAddr_0,
  input  [3:0] io_wrAddr_1,
  input  [3:0] io_wrAddr_2,
  input        io_wrEna_0,
  input        io_wrEna_1,
  input        io_wrEna_2,
  input  [3:0] io_rdAddr_0,
  input  [3:0] io_rdAddr_1,
  input  [3:0] io_rdAddr_2,
  output [1:0] io_rdIdx_0,
  output [1:0] io_rdIdx_1,
  output [1:0] io_rdIdx_2
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
`endif // RANDOMIZE_REG_INIT
  reg [1:0] lvtReg_0; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_1; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_2; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_3; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_4; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_5; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_6; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_7; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_8; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_9; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_10; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_11; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_12; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_13; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_14; // @[LVTMultiPortRams.scala 28:23]
  reg [1:0] lvtReg_15; // @[LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_0 = 4'h0 == io_wrAddr_0 ? 2'h0 : lvtReg_0; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_1 = 4'h1 == io_wrAddr_0 ? 2'h0 : lvtReg_1; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_2 = 4'h2 == io_wrAddr_0 ? 2'h0 : lvtReg_2; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_3 = 4'h3 == io_wrAddr_0 ? 2'h0 : lvtReg_3; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_4 = 4'h4 == io_wrAddr_0 ? 2'h0 : lvtReg_4; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_5 = 4'h5 == io_wrAddr_0 ? 2'h0 : lvtReg_5; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_6 = 4'h6 == io_wrAddr_0 ? 2'h0 : lvtReg_6; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_7 = 4'h7 == io_wrAddr_0 ? 2'h0 : lvtReg_7; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_8 = 4'h8 == io_wrAddr_0 ? 2'h0 : lvtReg_8; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_9 = 4'h9 == io_wrAddr_0 ? 2'h0 : lvtReg_9; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_10 = 4'ha == io_wrAddr_0 ? 2'h0 : lvtReg_10; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_11 = 4'hb == io_wrAddr_0 ? 2'h0 : lvtReg_11; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_12 = 4'hc == io_wrAddr_0 ? 2'h0 : lvtReg_12; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_13 = 4'hd == io_wrAddr_0 ? 2'h0 : lvtReg_13; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_14 = 4'he == io_wrAddr_0 ? 2'h0 : lvtReg_14; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_15 = 4'hf == io_wrAddr_0 ? 2'h0 : lvtReg_15; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_16 = io_wrEna_0 ? _GEN_0 : lvtReg_0; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_17 = io_wrEna_0 ? _GEN_1 : lvtReg_1; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_18 = io_wrEna_0 ? _GEN_2 : lvtReg_2; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_19 = io_wrEna_0 ? _GEN_3 : lvtReg_3; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_20 = io_wrEna_0 ? _GEN_4 : lvtReg_4; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_21 = io_wrEna_0 ? _GEN_5 : lvtReg_5; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_22 = io_wrEna_0 ? _GEN_6 : lvtReg_6; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_23 = io_wrEna_0 ? _GEN_7 : lvtReg_7; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_24 = io_wrEna_0 ? _GEN_8 : lvtReg_8; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_25 = io_wrEna_0 ? _GEN_9 : lvtReg_9; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_26 = io_wrEna_0 ? _GEN_10 : lvtReg_10; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_27 = io_wrEna_0 ? _GEN_11 : lvtReg_11; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_28 = io_wrEna_0 ? _GEN_12 : lvtReg_12; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_29 = io_wrEna_0 ? _GEN_13 : lvtReg_13; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_30 = io_wrEna_0 ? _GEN_14 : lvtReg_14; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_31 = io_wrEna_0 ? _GEN_15 : lvtReg_15; // @[LVTMultiPortRams.scala 31:34 LVTMultiPortRams.scala 28:23]
  wire [1:0] _GEN_32 = 4'h0 == io_wrAddr_1 ? 2'h1 : _GEN_16; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_33 = 4'h1 == io_wrAddr_1 ? 2'h1 : _GEN_17; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_34 = 4'h2 == io_wrAddr_1 ? 2'h1 : _GEN_18; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_35 = 4'h3 == io_wrAddr_1 ? 2'h1 : _GEN_19; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_36 = 4'h4 == io_wrAddr_1 ? 2'h1 : _GEN_20; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_37 = 4'h5 == io_wrAddr_1 ? 2'h1 : _GEN_21; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_38 = 4'h6 == io_wrAddr_1 ? 2'h1 : _GEN_22; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_39 = 4'h7 == io_wrAddr_1 ? 2'h1 : _GEN_23; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_40 = 4'h8 == io_wrAddr_1 ? 2'h1 : _GEN_24; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_41 = 4'h9 == io_wrAddr_1 ? 2'h1 : _GEN_25; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_42 = 4'ha == io_wrAddr_1 ? 2'h1 : _GEN_26; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_43 = 4'hb == io_wrAddr_1 ? 2'h1 : _GEN_27; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_44 = 4'hc == io_wrAddr_1 ? 2'h1 : _GEN_28; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_45 = 4'hd == io_wrAddr_1 ? 2'h1 : _GEN_29; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_46 = 4'he == io_wrAddr_1 ? 2'h1 : _GEN_30; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_47 = 4'hf == io_wrAddr_1 ? 2'h1 : _GEN_31; // @[LVTMultiPortRams.scala 32:28 LVTMultiPortRams.scala 32:28]
  wire [1:0] _GEN_48 = io_wrEna_1 ? _GEN_32 : _GEN_16; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_49 = io_wrEna_1 ? _GEN_33 : _GEN_17; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_50 = io_wrEna_1 ? _GEN_34 : _GEN_18; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_51 = io_wrEna_1 ? _GEN_35 : _GEN_19; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_52 = io_wrEna_1 ? _GEN_36 : _GEN_20; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_53 = io_wrEna_1 ? _GEN_37 : _GEN_21; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_54 = io_wrEna_1 ? _GEN_38 : _GEN_22; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_55 = io_wrEna_1 ? _GEN_39 : _GEN_23; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_56 = io_wrEna_1 ? _GEN_40 : _GEN_24; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_57 = io_wrEna_1 ? _GEN_41 : _GEN_25; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_58 = io_wrEna_1 ? _GEN_42 : _GEN_26; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_59 = io_wrEna_1 ? _GEN_43 : _GEN_27; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_60 = io_wrEna_1 ? _GEN_44 : _GEN_28; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_61 = io_wrEna_1 ? _GEN_45 : _GEN_29; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_62 = io_wrEna_1 ? _GEN_46 : _GEN_30; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_63 = io_wrEna_1 ? _GEN_47 : _GEN_31; // @[LVTMultiPortRams.scala 31:34]
  wire [1:0] _GEN_97 = 4'h1 == io_rdAddr_0 ? lvtReg_1 : lvtReg_0; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_98 = 4'h2 == io_rdAddr_0 ? lvtReg_2 : _GEN_97; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_99 = 4'h3 == io_rdAddr_0 ? lvtReg_3 : _GEN_98; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_100 = 4'h4 == io_rdAddr_0 ? lvtReg_4 : _GEN_99; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_101 = 4'h5 == io_rdAddr_0 ? lvtReg_5 : _GEN_100; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_102 = 4'h6 == io_rdAddr_0 ? lvtReg_6 : _GEN_101; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_103 = 4'h7 == io_rdAddr_0 ? lvtReg_7 : _GEN_102; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_104 = 4'h8 == io_rdAddr_0 ? lvtReg_8 : _GEN_103; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_105 = 4'h9 == io_rdAddr_0 ? lvtReg_9 : _GEN_104; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_106 = 4'ha == io_rdAddr_0 ? lvtReg_10 : _GEN_105; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_107 = 4'hb == io_rdAddr_0 ? lvtReg_11 : _GEN_106; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_108 = 4'hc == io_rdAddr_0 ? lvtReg_12 : _GEN_107; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_109 = 4'hd == io_rdAddr_0 ? lvtReg_13 : _GEN_108; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_110 = 4'he == io_rdAddr_0 ? lvtReg_14 : _GEN_109; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_113 = 4'h1 == io_rdAddr_1 ? lvtReg_1 : lvtReg_0; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_114 = 4'h2 == io_rdAddr_1 ? lvtReg_2 : _GEN_113; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_115 = 4'h3 == io_rdAddr_1 ? lvtReg_3 : _GEN_114; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_116 = 4'h4 == io_rdAddr_1 ? lvtReg_4 : _GEN_115; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_117 = 4'h5 == io_rdAddr_1 ? lvtReg_5 : _GEN_116; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_118 = 4'h6 == io_rdAddr_1 ? lvtReg_6 : _GEN_117; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_119 = 4'h7 == io_rdAddr_1 ? lvtReg_7 : _GEN_118; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_120 = 4'h8 == io_rdAddr_1 ? lvtReg_8 : _GEN_119; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_121 = 4'h9 == io_rdAddr_1 ? lvtReg_9 : _GEN_120; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_122 = 4'ha == io_rdAddr_1 ? lvtReg_10 : _GEN_121; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_123 = 4'hb == io_rdAddr_1 ? lvtReg_11 : _GEN_122; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_124 = 4'hc == io_rdAddr_1 ? lvtReg_12 : _GEN_123; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_125 = 4'hd == io_rdAddr_1 ? lvtReg_13 : _GEN_124; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_126 = 4'he == io_rdAddr_1 ? lvtReg_14 : _GEN_125; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_129 = 4'h1 == io_rdAddr_2 ? lvtReg_1 : lvtReg_0; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_130 = 4'h2 == io_rdAddr_2 ? lvtReg_2 : _GEN_129; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_131 = 4'h3 == io_rdAddr_2 ? lvtReg_3 : _GEN_130; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_132 = 4'h4 == io_rdAddr_2 ? lvtReg_4 : _GEN_131; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_133 = 4'h5 == io_rdAddr_2 ? lvtReg_5 : _GEN_132; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_134 = 4'h6 == io_rdAddr_2 ? lvtReg_6 : _GEN_133; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_135 = 4'h7 == io_rdAddr_2 ? lvtReg_7 : _GEN_134; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_136 = 4'h8 == io_rdAddr_2 ? lvtReg_8 : _GEN_135; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_137 = 4'h9 == io_rdAddr_2 ? lvtReg_9 : _GEN_136; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_138 = 4'ha == io_rdAddr_2 ? lvtReg_10 : _GEN_137; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_139 = 4'hb == io_rdAddr_2 ? lvtReg_11 : _GEN_138; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_140 = 4'hc == io_rdAddr_2 ? lvtReg_12 : _GEN_139; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_141 = 4'hd == io_rdAddr_2 ? lvtReg_13 : _GEN_140; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  wire [1:0] _GEN_142 = 4'he == io_rdAddr_2 ? lvtReg_14 : _GEN_141; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  assign io_rdIdx_0 = 4'hf == io_rdAddr_0 ? lvtReg_15 : _GEN_110; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  assign io_rdIdx_1 = 4'hf == io_rdAddr_1 ? lvtReg_15 : _GEN_126; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  assign io_rdIdx_2 = 4'hf == io_rdAddr_2 ? lvtReg_15 : _GEN_142; // @[LVTMultiPortRams.scala 37:17 LVTMultiPortRams.scala 37:17]
  always @(posedge clock) begin
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_0 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h0 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_0 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_0 <= _GEN_48;
      end
    end else begin
      lvtReg_0 <= _GEN_48;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_1 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h1 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_1 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_1 <= _GEN_49;
      end
    end else begin
      lvtReg_1 <= _GEN_49;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_2 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h2 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_2 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_2 <= _GEN_50;
      end
    end else begin
      lvtReg_2 <= _GEN_50;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_3 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h3 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_3 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_3 <= _GEN_51;
      end
    end else begin
      lvtReg_3 <= _GEN_51;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_4 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h4 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_4 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_4 <= _GEN_52;
      end
    end else begin
      lvtReg_4 <= _GEN_52;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_5 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h5 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_5 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_5 <= _GEN_53;
      end
    end else begin
      lvtReg_5 <= _GEN_53;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_6 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h6 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_6 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_6 <= _GEN_54;
      end
    end else begin
      lvtReg_6 <= _GEN_54;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_7 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h7 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_7 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_7 <= _GEN_55;
      end
    end else begin
      lvtReg_7 <= _GEN_55;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_8 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h8 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_8 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_8 <= _GEN_56;
      end
    end else begin
      lvtReg_8 <= _GEN_56;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_9 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'h9 == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_9 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_9 <= _GEN_57;
      end
    end else begin
      lvtReg_9 <= _GEN_57;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_10 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'ha == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_10 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_10 <= _GEN_58;
      end
    end else begin
      lvtReg_10 <= _GEN_58;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_11 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'hb == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_11 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_11 <= _GEN_59;
      end
    end else begin
      lvtReg_11 <= _GEN_59;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_12 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'hc == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_12 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_12 <= _GEN_60;
      end
    end else begin
      lvtReg_12 <= _GEN_60;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_13 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'hd == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_13 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_13 <= _GEN_61;
      end
    end else begin
      lvtReg_13 <= _GEN_61;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_14 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'he == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_14 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_14 <= _GEN_62;
      end
    end else begin
      lvtReg_14 <= _GEN_62;
    end
    if (reset) begin // @[LVTMultiPortRams.scala 28:23]
      lvtReg_15 <= 2'h0; // @[LVTMultiPortRams.scala 28:23]
    end else if (io_wrEna_2) begin // @[LVTMultiPortRams.scala 31:34]
      if (4'hf == io_wrAddr_2) begin // @[LVTMultiPortRams.scala 32:28]
        lvtReg_15 <= 2'h2; // @[LVTMultiPortRams.scala 32:28]
      end else begin
        lvtReg_15 <= _GEN_63;
      end
    end else begin
      lvtReg_15 <= _GEN_63;
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
  lvtReg_0 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  lvtReg_1 = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  lvtReg_2 = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  lvtReg_3 = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  lvtReg_4 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  lvtReg_5 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  lvtReg_6 = _RAND_6[1:0];
  _RAND_7 = {1{`RANDOM}};
  lvtReg_7 = _RAND_7[1:0];
  _RAND_8 = {1{`RANDOM}};
  lvtReg_8 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  lvtReg_9 = _RAND_9[1:0];
  _RAND_10 = {1{`RANDOM}};
  lvtReg_10 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  lvtReg_11 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  lvtReg_12 = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  lvtReg_13 = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  lvtReg_14 = _RAND_14[1:0];
  _RAND_15 = {1{`RANDOM}};
  lvtReg_15 = _RAND_15[1:0];
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
  input  [3:0] io_wrAddr_0,
  input  [3:0] io_wrAddr_1,
  input  [3:0] io_wrAddr_2,
  input  [7:0] io_wrData_0,
  input  [7:0] io_wrData_1,
  input  [7:0] io_wrData_2,
  input        io_wrEna_0,
  input        io_wrEna_1,
  input        io_wrEna_2,
  input  [3:0] io_rdAddr_0,
  input  [3:0] io_rdAddr_1,
  input  [3:0] io_rdAddr_2,
  output [7:0] io_rdData_0,
  output [7:0] io_rdData_1,
  output [7:0] io_rdData_2
);
  wire  Memory_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_1_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_1_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_1_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_1_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_1_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_1_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_2_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_2_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_2_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_2_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_2_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_2_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_3_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_3_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_3_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_3_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_3_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_3_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_4_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_4_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_4_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_4_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_4_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_4_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_5_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_5_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_5_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_5_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_5_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_5_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_6_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_6_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_6_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_6_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_6_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_6_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_7_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_7_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_7_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_7_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_7_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_7_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_8_clock; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_8_io_rdAddr; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_8_io_rdData; // @[LVTMultiPortRams.scala 52:44]
  wire  Memory_8_io_wrEna; // @[LVTMultiPortRams.scala 52:44]
  wire [7:0] Memory_8_io_wrData; // @[LVTMultiPortRams.scala 52:44]
  wire [3:0] Memory_8_io_wrAddr; // @[LVTMultiPortRams.scala 52:44]
  wire  lvt_clock; // @[LVTMultiPortRams.scala 53:19]
  wire  lvt_reset; // @[LVTMultiPortRams.scala 53:19]
  wire [3:0] lvt_io_wrAddr_0; // @[LVTMultiPortRams.scala 53:19]
  wire [3:0] lvt_io_wrAddr_1; // @[LVTMultiPortRams.scala 53:19]
  wire [3:0] lvt_io_wrAddr_2; // @[LVTMultiPortRams.scala 53:19]
  wire  lvt_io_wrEna_0; // @[LVTMultiPortRams.scala 53:19]
  wire  lvt_io_wrEna_1; // @[LVTMultiPortRams.scala 53:19]
  wire  lvt_io_wrEna_2; // @[LVTMultiPortRams.scala 53:19]
  wire [3:0] lvt_io_rdAddr_0; // @[LVTMultiPortRams.scala 53:19]
  wire [3:0] lvt_io_rdAddr_1; // @[LVTMultiPortRams.scala 53:19]
  wire [3:0] lvt_io_rdAddr_2; // @[LVTMultiPortRams.scala 53:19]
  wire [1:0] lvt_io_rdIdx_0; // @[LVTMultiPortRams.scala 53:19]
  wire [1:0] lvt_io_rdIdx_1; // @[LVTMultiPortRams.scala 53:19]
  wire [1:0] lvt_io_rdIdx_2; // @[LVTMultiPortRams.scala 53:19]
  wire [3:0] _io_rdData_0_T = lvt_io_rdIdx_0 * 2'h3; // @[LVTMultiPortRams.scala 72:30]
  wire [4:0] _io_rdData_0_T_1 = {{1'd0}, _io_rdData_0_T}; // @[LVTMultiPortRams.scala 72:36]
  wire [7:0] mems_0_rdData = Memory_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] mems_1_rdData = Memory_1_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] _GEN_6 = 4'h1 == _io_rdData_0_T_1[3:0] ? mems_1_rdData : mems_0_rdData; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] mems_2_rdData = Memory_2_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] _GEN_11 = 4'h2 == _io_rdData_0_T_1[3:0] ? mems_2_rdData : _GEN_6; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] mems_3_rdData = Memory_3_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] _GEN_16 = 4'h3 == _io_rdData_0_T_1[3:0] ? mems_3_rdData : _GEN_11; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] mems_4_rdData = Memory_4_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] _GEN_21 = 4'h4 == _io_rdData_0_T_1[3:0] ? mems_4_rdData : _GEN_16; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] mems_5_rdData = Memory_5_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] _GEN_26 = 4'h5 == _io_rdData_0_T_1[3:0] ? mems_5_rdData : _GEN_21; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] mems_6_rdData = Memory_6_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] _GEN_31 = 4'h6 == _io_rdData_0_T_1[3:0] ? mems_6_rdData : _GEN_26; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] mems_7_rdData = Memory_7_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [7:0] _GEN_36 = 4'h7 == _io_rdData_0_T_1[3:0] ? mems_7_rdData : _GEN_31; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] mems_8_rdData = Memory_8_io_rdData; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 52:21]
  wire [3:0] _io_rdData_1_T = lvt_io_rdIdx_1 * 2'h3; // @[LVTMultiPortRams.scala 72:30]
  wire [3:0] _io_rdData_1_T_2 = _io_rdData_1_T + 4'h1; // @[LVTMultiPortRams.scala 72:36]
  wire [7:0] _GEN_51 = 4'h1 == _io_rdData_1_T_2 ? mems_1_rdData : mems_0_rdData; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_56 = 4'h2 == _io_rdData_1_T_2 ? mems_2_rdData : _GEN_51; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_61 = 4'h3 == _io_rdData_1_T_2 ? mems_3_rdData : _GEN_56; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_66 = 4'h4 == _io_rdData_1_T_2 ? mems_4_rdData : _GEN_61; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_71 = 4'h5 == _io_rdData_1_T_2 ? mems_5_rdData : _GEN_66; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_76 = 4'h6 == _io_rdData_1_T_2 ? mems_6_rdData : _GEN_71; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_81 = 4'h7 == _io_rdData_1_T_2 ? mems_7_rdData : _GEN_76; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [3:0] _io_rdData_2_T = lvt_io_rdIdx_2 * 2'h3; // @[LVTMultiPortRams.scala 72:30]
  wire [3:0] _io_rdData_2_T_2 = _io_rdData_2_T + 4'h2; // @[LVTMultiPortRams.scala 72:36]
  wire [7:0] _GEN_96 = 4'h1 == _io_rdData_2_T_2 ? mems_1_rdData : mems_0_rdData; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_101 = 4'h2 == _io_rdData_2_T_2 ? mems_2_rdData : _GEN_96; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_106 = 4'h3 == _io_rdData_2_T_2 ? mems_3_rdData : _GEN_101; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_111 = 4'h4 == _io_rdData_2_T_2 ? mems_4_rdData : _GEN_106; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_116 = 4'h5 == _io_rdData_2_T_2 ? mems_5_rdData : _GEN_111; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_121 = 4'h6 == _io_rdData_2_T_2 ? mems_6_rdData : _GEN_116; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  wire [7:0] _GEN_126 = 4'h7 == _io_rdData_2_T_2 ? mems_7_rdData : _GEN_121; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
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
  Memory Memory_4 ( // @[LVTMultiPortRams.scala 52:44]
    .clock(Memory_4_clock),
    .io_rdAddr(Memory_4_io_rdAddr),
    .io_rdData(Memory_4_io_rdData),
    .io_wrEna(Memory_4_io_wrEna),
    .io_wrData(Memory_4_io_wrData),
    .io_wrAddr(Memory_4_io_wrAddr)
  );
  Memory Memory_5 ( // @[LVTMultiPortRams.scala 52:44]
    .clock(Memory_5_clock),
    .io_rdAddr(Memory_5_io_rdAddr),
    .io_rdData(Memory_5_io_rdData),
    .io_wrEna(Memory_5_io_wrEna),
    .io_wrData(Memory_5_io_wrData),
    .io_wrAddr(Memory_5_io_wrAddr)
  );
  Memory Memory_6 ( // @[LVTMultiPortRams.scala 52:44]
    .clock(Memory_6_clock),
    .io_rdAddr(Memory_6_io_rdAddr),
    .io_rdData(Memory_6_io_rdData),
    .io_wrEna(Memory_6_io_wrEna),
    .io_wrData(Memory_6_io_wrData),
    .io_wrAddr(Memory_6_io_wrAddr)
  );
  Memory Memory_7 ( // @[LVTMultiPortRams.scala 52:44]
    .clock(Memory_7_clock),
    .io_rdAddr(Memory_7_io_rdAddr),
    .io_rdData(Memory_7_io_rdData),
    .io_wrEna(Memory_7_io_wrEna),
    .io_wrData(Memory_7_io_wrData),
    .io_wrAddr(Memory_7_io_wrAddr)
  );
  Memory Memory_8 ( // @[LVTMultiPortRams.scala 52:44]
    .clock(Memory_8_clock),
    .io_rdAddr(Memory_8_io_rdAddr),
    .io_rdData(Memory_8_io_rdData),
    .io_wrEna(Memory_8_io_wrEna),
    .io_wrData(Memory_8_io_wrData),
    .io_wrAddr(Memory_8_io_wrAddr)
  );
  LiveValueTable lvt ( // @[LVTMultiPortRams.scala 53:19]
    .clock(lvt_clock),
    .reset(lvt_reset),
    .io_wrAddr_0(lvt_io_wrAddr_0),
    .io_wrAddr_1(lvt_io_wrAddr_1),
    .io_wrAddr_2(lvt_io_wrAddr_2),
    .io_wrEna_0(lvt_io_wrEna_0),
    .io_wrEna_1(lvt_io_wrEna_1),
    .io_wrEna_2(lvt_io_wrEna_2),
    .io_rdAddr_0(lvt_io_rdAddr_0),
    .io_rdAddr_1(lvt_io_rdAddr_1),
    .io_rdAddr_2(lvt_io_rdAddr_2),
    .io_rdIdx_0(lvt_io_rdIdx_0),
    .io_rdIdx_1(lvt_io_rdIdx_1),
    .io_rdIdx_2(lvt_io_rdIdx_2)
  );
  assign io_rdData_0 = 4'h8 == _io_rdData_0_T_1[3:0] ? mems_8_rdData : _GEN_36; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  assign io_rdData_1 = 4'h8 == _io_rdData_1_T_2 ? mems_8_rdData : _GEN_81; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
  assign io_rdData_2 = 4'h8 == _io_rdData_2_T_2 ? mems_8_rdData : _GEN_126; // @[LVTMultiPortRams.scala 72:18 LVTMultiPortRams.scala 72:18]
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
  assign Memory_2_io_rdAddr = io_rdAddr_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_2_io_wrEna = io_wrEna_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_2_io_wrData = io_wrData_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_2_io_wrAddr = io_wrAddr_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign Memory_3_clock = clock;
  assign Memory_3_io_rdAddr = io_rdAddr_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_3_io_wrEna = io_wrEna_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_3_io_wrData = io_wrData_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_3_io_wrAddr = io_wrAddr_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign Memory_4_clock = clock;
  assign Memory_4_io_rdAddr = io_rdAddr_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_4_io_wrEna = io_wrEna_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_4_io_wrData = io_wrData_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_4_io_wrAddr = io_wrAddr_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign Memory_5_clock = clock;
  assign Memory_5_io_rdAddr = io_rdAddr_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_5_io_wrEna = io_wrEna_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_5_io_wrData = io_wrData_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_5_io_wrAddr = io_wrAddr_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign Memory_6_clock = clock;
  assign Memory_6_io_rdAddr = io_rdAddr_0; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_6_io_wrEna = io_wrEna_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_6_io_wrData = io_wrData_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_6_io_wrAddr = io_wrAddr_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign Memory_7_clock = clock;
  assign Memory_7_io_rdAddr = io_rdAddr_1; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_7_io_wrEna = io_wrEna_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_7_io_wrData = io_wrData_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_7_io_wrAddr = io_wrAddr_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign Memory_8_clock = clock;
  assign Memory_8_io_rdAddr = io_rdAddr_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 60:30]
  assign Memory_8_io_wrEna = io_wrEna_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 57:29]
  assign Memory_8_io_wrData = io_wrData_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 59:30]
  assign Memory_8_io_wrAddr = io_wrAddr_2; // @[LVTMultiPortRams.scala 52:21 LVTMultiPortRams.scala 58:30]
  assign lvt_clock = clock;
  assign lvt_reset = reset;
  assign lvt_io_wrAddr_0 = io_wrAddr_0; // @[LVTMultiPortRams.scala 65:22]
  assign lvt_io_wrAddr_1 = io_wrAddr_1; // @[LVTMultiPortRams.scala 65:22]
  assign lvt_io_wrAddr_2 = io_wrAddr_2; // @[LVTMultiPortRams.scala 65:22]
  assign lvt_io_wrEna_0 = io_wrEna_0; // @[LVTMultiPortRams.scala 64:21]
  assign lvt_io_wrEna_1 = io_wrEna_1; // @[LVTMultiPortRams.scala 64:21]
  assign lvt_io_wrEna_2 = io_wrEna_2; // @[LVTMultiPortRams.scala 64:21]
  assign lvt_io_rdAddr_0 = io_rdAddr_0; // @[LVTMultiPortRams.scala 68:22]
  assign lvt_io_rdAddr_1 = io_rdAddr_1; // @[LVTMultiPortRams.scala 68:22]
  assign lvt_io_rdAddr_2 = io_rdAddr_2; // @[LVTMultiPortRams.scala 68:22]

  integer addr_0 = 4'h5;
  integer data_0 = 8'h1f;
  integer addr_1 = 4'h6;
  integer data_1 = 8'h7;
  integer addr_2 = 4'h7;
  integer data_2 = 8'h9;
  // multi-port
  sequence ant0;
    (reset == 0) && (io_wrAddr_0 == addr_0) && (io_wrData_0 == data_0) && (io_wrEna_0 == 1'b1) &&
    (io_wrAddr_1 == addr_1) && (io_wrData_1 == data_1) && (io_wrEna_1 == 1'b1) &&
    (io_wrAddr_2 == addr_2) && (io_wrData_2 == data_2) && (io_wrEna_2 == 1'b1);
  endsequence
  sequence u0;
    ##1 (lvt.lvtReg_5 == 0) && (Memory.mem[5] == data_0) && (Memory_1.mem[5] == data_0) && (Memory_2.mem[5] == data_0) 
    && (lvt.lvtReg_6 == 1) && (Memory_3.mem[6] == data_1) && (Memory_4.mem[6] == data_1)&& (Memory_5.mem[6] == data_1)
    && (lvt.lvtReg_7 == 2) && (Memory_6.mem[7] == data_2) && (Memory_7.mem[7] == data_2)&& (Memory_8.mem[7] == data_2);
  endsequence
  assert property(@(posedge clock) ant0 |-> u0);

  sequence ant1;
    ((reset == 0) &&  (lvt.lvtReg_5 == 0) && (Memory.mem[5] == data_0) && (Memory_1.mem[5] == data_0) && (Memory_2.mem[5] == data_0) 
    && (lvt.lvtReg_6 == 1) && (Memory_3.mem[6] == data_1) && (Memory_4.mem[6] == data_1)&& (Memory_5.mem[6] == data_1)
    && (lvt.lvtReg_7 == 2) && (Memory_6.mem[7] == data_2) && (Memory_7.mem[7] == data_2)&& (Memory_8.mem[7] == data_2)
    && (io_wrEna_0 == 1'b0 || (io_wrAddr_0 != addr_0 && io_wrAddr_0 != addr_1 && io_wrAddr_0 != addr_2)) 
    && (io_wrEna_1 == 1'b0 || (io_wrAddr_1 != addr_0 && io_wrAddr_1 != addr_1 &&io_wrAddr_1 != addr_2))
    && (io_wrEna_2 == 1'b0 || (io_wrAddr_2 != addr_0 && io_wrAddr_2 != addr_1 &&io_wrAddr_2 != addr_2))) 
    ##1 ((reset == 0) && (io_wrEna_0 == 1'b0 || (io_wrAddr_0 != addr_0 && io_wrAddr_0 != addr_1 && io_wrAddr_0 != addr_2)) 
    && (io_wrEna_1 == 1'b0 || (io_wrAddr_1 != addr_0 && io_wrAddr_1 != addr_1 &&io_wrAddr_1 != addr_2))
    && (io_wrEna_2 == 1'b0 || (io_wrAddr_2 != addr_0 && io_wrAddr_2 != addr_1 &&io_wrAddr_2 != addr_2)))[*3];
  endsequence
  sequence u1;
    ##1 (lvt.lvtReg_5 == 0) && (Memory.mem[5] == data_0) && (Memory_1.mem[5] == data_0) && (Memory_2.mem[5] == data_0) 
    && (lvt.lvtReg_6 == 1) && (Memory_3.mem[6] == data_1) && (Memory_4.mem[6] == data_1)&& (Memory_5.mem[6] == data_1)
    && (lvt.lvtReg_7 == 2) && (Memory_6.mem[7] == data_2) && (Memory_7.mem[7] == data_2)&& (Memory_8.mem[7] == data_2);
  endsequence
  assert property(@(posedge clock) ant1 |-> u1);

  sequence ant2;
    (lvt.lvtReg_5 == 0) && (Memory.mem[5] == data_0) && (Memory_1.mem[5] == data_0) && (Memory_2.mem[5] == data_0) 
    && (lvt.lvtReg_6 == 1) && (Memory_3.mem[6] == data_1) && (Memory_4.mem[6] == data_1)&& (Memory_5.mem[6] == data_1)
    && (lvt.lvtReg_7 == 2) && (Memory_6.mem[7] == data_2) && (Memory_7.mem[7] == data_2)&& (Memory_8.mem[7] == data_2) &&
    (io_rdAddr_0 == addr_0) && (io_rdAddr_1 == addr_1) && (io_rdAddr_2 == addr_2) ;
  endsequence
  sequence cons2;
    (io_rdData_0 == data_0) && (io_rdData_1 == data_1) && (io_rdAddr_2 == addr_2);
  endsequence
  assert property(@(posedge clock) ant2 |-> cons2);
endmodule
