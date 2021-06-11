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
module XORMultiPortMemory(
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
  wire  Memory_clock; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_io_rdAddr; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_io_rdData; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_io_wrEna; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_io_wrData; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_io_wrAddr; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_1_clock; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_1_io_rdAddr; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_1_io_rdData; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_1_io_wrEna; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_1_io_wrData; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_1_io_wrAddr; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_2_clock; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_2_io_rdAddr; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_2_io_rdData; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_2_io_wrEna; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_2_io_wrData; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_2_io_wrAddr; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_3_clock; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_3_io_rdAddr; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_3_io_rdData; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_3_io_wrEna; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_3_io_wrData; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_3_io_wrAddr; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_4_clock; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_4_io_rdAddr; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_4_io_rdData; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_4_io_wrEna; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_4_io_wrData; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_4_io_wrAddr; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_5_clock; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_5_io_rdAddr; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_5_io_rdData; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_5_io_wrEna; // @[XORMultiPortMemory.scala 20:11]
  wire [7:0] Memory_5_io_wrData; // @[XORMultiPortMemory.scala 20:11]
  wire [3:0] Memory_5_io_wrAddr; // @[XORMultiPortMemory.scala 20:11]
  wire  Memory_6_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_6_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_6_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_6_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_6_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_6_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_7_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_7_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_7_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_7_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_7_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_7_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_8_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_8_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_8_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_8_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_8_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_8_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_9_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_9_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_9_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_9_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_9_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_9_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_10_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_10_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_10_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_10_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_10_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_10_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_11_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_11_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_11_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_11_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_11_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_11_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_12_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_12_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_12_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_12_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_12_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_12_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_13_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_13_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_13_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_13_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_13_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_13_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_14_clock; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_14_io_rdAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_14_io_rdData; // @[XORMultiPortMemory.scala 23:11]
  wire  Memory_14_io_wrEna; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] Memory_14_io_wrData; // @[XORMultiPortMemory.scala 23:11]
  wire [3:0] Memory_14_io_wrAddr; // @[XORMultiPortMemory.scala 23:11]
  wire [7:0] xors__1 = io_wrData_0 ^ Memory_2_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  wire [7:0] xors_1_1 = io_wrData_1 ^ Memory_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  wire [7:0] xors_2_1 = io_wrData_2 ^ Memory_1_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  wire [7:0] xors_3_0 = Memory_6_io_rdData; // @[XORMultiPortMemory.scala 69:20 XORMultiPortMemory.scala 70:13]
  wire [7:0] xors_3_1 = xors_3_0 ^ Memory_9_io_rdData; // @[XORMultiPortMemory.scala 72:30]
  wire [7:0] xors_4_0 = Memory_7_io_rdData; // @[XORMultiPortMemory.scala 69:20 XORMultiPortMemory.scala 70:13]
  wire [7:0] xors_4_1 = xors_4_0 ^ Memory_10_io_rdData; // @[XORMultiPortMemory.scala 72:30]
  wire [7:0] xors_5_0 = Memory_8_io_rdData; // @[XORMultiPortMemory.scala 69:20 XORMultiPortMemory.scala 70:13]
  wire [7:0] xors_5_1 = xors_5_0 ^ Memory_11_io_rdData; // @[XORMultiPortMemory.scala 72:30]
  Memory Memory ( // @[XORMultiPortMemory.scala 20:11]
    .clock(Memory_clock),
    .io_rdAddr(Memory_io_rdAddr),
    .io_rdData(Memory_io_rdData),
    .io_wrEna(Memory_io_wrEna),
    .io_wrData(Memory_io_wrData),
    .io_wrAddr(Memory_io_wrAddr)
  );
  Memory Memory_1 ( // @[XORMultiPortMemory.scala 20:11]
    .clock(Memory_1_clock),
    .io_rdAddr(Memory_1_io_rdAddr),
    .io_rdData(Memory_1_io_rdData),
    .io_wrEna(Memory_1_io_wrEna),
    .io_wrData(Memory_1_io_wrData),
    .io_wrAddr(Memory_1_io_wrAddr)
  );
  Memory Memory_2 ( // @[XORMultiPortMemory.scala 20:11]
    .clock(Memory_2_clock),
    .io_rdAddr(Memory_2_io_rdAddr),
    .io_rdData(Memory_2_io_rdData),
    .io_wrEna(Memory_2_io_wrEna),
    .io_wrData(Memory_2_io_wrData),
    .io_wrAddr(Memory_2_io_wrAddr)
  );
  Memory Memory_3 ( // @[XORMultiPortMemory.scala 20:11]
    .clock(Memory_3_clock),
    .io_rdAddr(Memory_3_io_rdAddr),
    .io_rdData(Memory_3_io_rdData),
    .io_wrEna(Memory_3_io_wrEna),
    .io_wrData(Memory_3_io_wrData),
    .io_wrAddr(Memory_3_io_wrAddr)
  );
  Memory Memory_4 ( // @[XORMultiPortMemory.scala 20:11]
    .clock(Memory_4_clock),
    .io_rdAddr(Memory_4_io_rdAddr),
    .io_rdData(Memory_4_io_rdData),
    .io_wrEna(Memory_4_io_wrEna),
    .io_wrData(Memory_4_io_wrData),
    .io_wrAddr(Memory_4_io_wrAddr)
  );
  Memory Memory_5 ( // @[XORMultiPortMemory.scala 20:11]
    .clock(Memory_5_clock),
    .io_rdAddr(Memory_5_io_rdAddr),
    .io_rdData(Memory_5_io_rdData),
    .io_wrEna(Memory_5_io_wrEna),
    .io_wrData(Memory_5_io_wrData),
    .io_wrAddr(Memory_5_io_wrAddr)
  );
  Memory Memory_6 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_6_clock),
    .io_rdAddr(Memory_6_io_rdAddr),
    .io_rdData(Memory_6_io_rdData),
    .io_wrEna(Memory_6_io_wrEna),
    .io_wrData(Memory_6_io_wrData),
    .io_wrAddr(Memory_6_io_wrAddr)
  );
  Memory Memory_7 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_7_clock),
    .io_rdAddr(Memory_7_io_rdAddr),
    .io_rdData(Memory_7_io_rdData),
    .io_wrEna(Memory_7_io_wrEna),
    .io_wrData(Memory_7_io_wrData),
    .io_wrAddr(Memory_7_io_wrAddr)
  );
  Memory Memory_8 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_8_clock),
    .io_rdAddr(Memory_8_io_rdAddr),
    .io_rdData(Memory_8_io_rdData),
    .io_wrEna(Memory_8_io_wrEna),
    .io_wrData(Memory_8_io_wrData),
    .io_wrAddr(Memory_8_io_wrAddr)
  );
  Memory Memory_9 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_9_clock),
    .io_rdAddr(Memory_9_io_rdAddr),
    .io_rdData(Memory_9_io_rdData),
    .io_wrEna(Memory_9_io_wrEna),
    .io_wrData(Memory_9_io_wrData),
    .io_wrAddr(Memory_9_io_wrAddr)
  );
  Memory Memory_10 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_10_clock),
    .io_rdAddr(Memory_10_io_rdAddr),
    .io_rdData(Memory_10_io_rdData),
    .io_wrEna(Memory_10_io_wrEna),
    .io_wrData(Memory_10_io_wrData),
    .io_wrAddr(Memory_10_io_wrAddr)
  );
  Memory Memory_11 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_11_clock),
    .io_rdAddr(Memory_11_io_rdAddr),
    .io_rdData(Memory_11_io_rdData),
    .io_wrEna(Memory_11_io_wrEna),
    .io_wrData(Memory_11_io_wrData),
    .io_wrAddr(Memory_11_io_wrAddr)
  );
  Memory Memory_12 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_12_clock),
    .io_rdAddr(Memory_12_io_rdAddr),
    .io_rdData(Memory_12_io_rdData),
    .io_wrEna(Memory_12_io_wrEna),
    .io_wrData(Memory_12_io_wrData),
    .io_wrAddr(Memory_12_io_wrAddr)
  );
  Memory Memory_13 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_13_clock),
    .io_rdAddr(Memory_13_io_rdAddr),
    .io_rdData(Memory_13_io_rdData),
    .io_wrEna(Memory_13_io_wrEna),
    .io_wrData(Memory_13_io_wrData),
    .io_wrAddr(Memory_13_io_wrAddr)
  );
  Memory Memory_14 ( // @[XORMultiPortMemory.scala 23:11]
    .clock(Memory_14_clock),
    .io_rdAddr(Memory_14_io_rdAddr),
    .io_rdData(Memory_14_io_rdData),
    .io_wrEna(Memory_14_io_wrEna),
    .io_wrData(Memory_14_io_wrData),
    .io_wrAddr(Memory_14_io_wrAddr)
  );
  assign io_rdData_0 = xors_3_1 ^ Memory_12_io_rdData; // @[XORMultiPortMemory.scala 72:30]
  assign io_rdData_1 = xors_4_1 ^ Memory_13_io_rdData; // @[XORMultiPortMemory.scala 72:30]
  assign io_rdData_2 = xors_5_1 ^ Memory_14_io_rdData; // @[XORMultiPortMemory.scala 72:30]
  assign Memory_clock = clock;
  assign Memory_io_rdAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 36:45]
  assign Memory_io_wrEna = io_wrEna_0; // @[XORMultiPortMemory.scala 52:38]
  assign Memory_io_wrData = xors__1 ^ Memory_4_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_io_wrAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 53:39]
  assign Memory_1_clock = clock;
  assign Memory_1_io_rdAddr = io_wrAddr_2; // @[XORMultiPortMemory.scala 36:45]
  assign Memory_1_io_wrEna = io_wrEna_0; // @[XORMultiPortMemory.scala 52:38]
  assign Memory_1_io_wrData = xors__1 ^ Memory_4_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_1_io_wrAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 53:39]
  assign Memory_2_clock = clock;
  assign Memory_2_io_rdAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 41:41]
  assign Memory_2_io_wrEna = io_wrEna_1; // @[XORMultiPortMemory.scala 52:38]
  assign Memory_2_io_wrData = xors_1_1 ^ Memory_5_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_2_io_wrAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 53:39]
  assign Memory_3_clock = clock;
  assign Memory_3_io_rdAddr = io_wrAddr_2; // @[XORMultiPortMemory.scala 36:45]
  assign Memory_3_io_wrEna = io_wrEna_1; // @[XORMultiPortMemory.scala 52:38]
  assign Memory_3_io_wrData = xors_1_1 ^ Memory_5_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_3_io_wrAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 53:39]
  assign Memory_4_clock = clock;
  assign Memory_4_io_rdAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 41:41]
  assign Memory_4_io_wrEna = io_wrEna_2; // @[XORMultiPortMemory.scala 52:38]
  assign Memory_4_io_wrData = xors_2_1 ^ Memory_3_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  assign Memory_4_io_wrAddr = io_wrAddr_2; // @[XORMultiPortMemory.scala 53:39]
  assign Memory_5_clock = clock;
  assign Memory_5_io_rdAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 41:41]
  assign Memory_5_io_wrEna = io_wrEna_2; // @[XORMultiPortMemory.scala 52:38]
  assign Memory_5_io_wrData = xors_2_1 ^ Memory_3_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  assign Memory_5_io_wrAddr = io_wrAddr_2; // @[XORMultiPortMemory.scala 53:39]
  assign Memory_6_clock = clock;
  assign Memory_6_io_rdAddr = io_rdAddr_0; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_6_io_wrEna = io_wrEna_0; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_6_io_wrData = xors__1 ^ Memory_4_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_6_io_wrAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_7_clock = clock;
  assign Memory_7_io_rdAddr = io_rdAddr_1; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_7_io_wrEna = io_wrEna_0; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_7_io_wrData = xors__1 ^ Memory_4_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_7_io_wrAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_8_clock = clock;
  assign Memory_8_io_rdAddr = io_rdAddr_2; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_8_io_wrEna = io_wrEna_0; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_8_io_wrData = xors__1 ^ Memory_4_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_8_io_wrAddr = io_wrAddr_0; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_9_clock = clock;
  assign Memory_9_io_rdAddr = io_rdAddr_0; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_9_io_wrEna = io_wrEna_1; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_9_io_wrData = xors_1_1 ^ Memory_5_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_9_io_wrAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_10_clock = clock;
  assign Memory_10_io_rdAddr = io_rdAddr_1; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_10_io_wrEna = io_wrEna_1; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_10_io_wrData = xors_1_1 ^ Memory_5_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_10_io_wrAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_11_clock = clock;
  assign Memory_11_io_rdAddr = io_rdAddr_2; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_11_io_wrEna = io_wrEna_1; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_11_io_wrData = xors_1_1 ^ Memory_5_io_rdData; // @[XORMultiPortMemory.scala 42:36]
  assign Memory_11_io_wrAddr = io_wrAddr_1; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_12_clock = clock;
  assign Memory_12_io_rdAddr = io_rdAddr_0; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_12_io_wrEna = io_wrEna_2; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_12_io_wrData = xors_2_1 ^ Memory_3_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  assign Memory_12_io_wrAddr = io_wrAddr_2; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_13_clock = clock;
  assign Memory_13_io_rdAddr = io_rdAddr_1; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_13_io_wrEna = io_wrEna_2; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_13_io_wrData = xors_2_1 ^ Memory_3_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  assign Memory_13_io_wrAddr = io_wrAddr_2; // @[XORMultiPortMemory.scala 61:33]
  assign Memory_14_clock = clock;
  assign Memory_14_io_rdAddr = io_rdAddr_2; // @[XORMultiPortMemory.scala 63:33]
  assign Memory_14_io_wrEna = io_wrEna_2; // @[XORMultiPortMemory.scala 60:32]
  assign Memory_14_io_wrData = xors_2_1 ^ Memory_3_io_rdData; // @[XORMultiPortMemory.scala 37:36]
  assign Memory_14_io_wrAddr = io_wrAddr_2; // @[XORMultiPortMemory.scala 61:33]


  integer addr_0 = 4'h5;
  integer data_0 = 8'h1f;
  integer addr_1 = 4'h6;
  integer data_1 = 8'h7;
  integer addr_2 = 4'h7;
  integer data_2 = 8'h9;

  sequence ant0;
    (reset == 0) && (io_wrAddr_0 == addr_0) && (io_wrData_0 == data_0) && (io_wrEna_0 == 1'b1) &&
    (io_wrAddr_1 == addr_1) && (io_wrData_1 == data_1) && (io_wrEna_1 == 1'b1) &&
    (io_wrAddr_2 == addr_2) && (io_wrData_2 == data_2) && (io_wrEna_2 == 1'b1);
  endsequence
  sequence u0;
    ##1 ((Memory.mem[5] ^ Memory_2.mem[5] ^ Memory_4.mem[5]) == data_0)
    && ((Memory.mem[6] ^ Memory_2.mem[6] ^ Memory_5.mem[6]) == data_1)
    && ((Memory_1.mem[7] ^ Memory_3.mem[7] ^ Memory_4.mem[7]) == data_2);
  endsequence
  assert property(@(posedge clock) ant0 |-> u0);


  sequence ant1;
    ((reset == 0) &&  ((Memory.mem[5] ^ Memory_2.mem[5] ^ Memory_4.mem[5]) == data_0)
    && ((Memory.mem[6] ^ Memory_2.mem[6] ^ Memory_5.mem[6]) == data_1)
    && ((Memory_1.mem[7] ^ Memory_3.mem[7] ^ Memory_4.mem[7]) == data_2)
     && (io_wrEna_0 == 1'b0 || (io_wrAddr_0 != addr_0 && io_wrAddr_0 != addr_1 && io_wrAddr_0 != addr_2)) 
    && (io_wrEna_1 == 1'b0 || (io_wrAddr_1 != addr_0 && io_wrAddr_1 != addr_1 &&io_wrAddr_1 != addr_2))
    && (io_wrEna_2 == 1'b0 || (io_wrAddr_2 != addr_0 && io_wrAddr_2 != addr_1 &&io_wrAddr_2 != addr_2))) 
    ##1 ((reset == 0) && (io_wrEna_0 == 1'b0 || (io_wrAddr_0 != addr_0 && io_wrAddr_0 != addr_1 && io_wrAddr_0 != addr_2)) 
    && (io_wrEna_1 == 1'b0 || (io_wrAddr_1 != addr_0 && io_wrAddr_1 != addr_1 &&io_wrAddr_1 != addr_2))
    && (io_wrEna_2 == 1'b0 || (io_wrAddr_2 != addr_0 && io_wrAddr_2 != addr_1 &&io_wrAddr_2 != addr_2)))[*1];
  endsequence
  sequence u1;
    ##1  ((Memory.mem[5] ^ Memory_2.mem[5] ^ Memory_4.mem[5]) == data_0)
    && ((Memory.mem[6] ^ Memory_2.mem[6] ^ Memory_5.mem[6]) == data_1)
    && ((Memory_1.mem[7] ^ Memory_3.mem[7] ^ Memory_4.mem[7]) == data_2);
  endsequence
  assert property(@(posedge clock) ant1 |-> u1);

  sequence ant2;
   ((Memory_6.mem[5] ^ Memory_9.mem[5] ^ Memory_12.mem[5]) == data_0)
    && ((Memory_7.mem[6] ^ Memory_10.mem[6] ^ Memory_13.mem[6]) == data_1)
    && ((Memory_8.mem[7] ^ Memory_11.mem[7] ^ Memory_14.mem[7]) == data_2) &&
     (io_rdAddr_0 == addr_0) && (io_rdAddr_1 == addr_1) && (io_rdAddr_2 == addr_2);
  endsequence
  sequence cons2;
    (io_rdData_0 == data_0) && (io_rdData_1 == data_1) && (io_rdAddr_2 == addr_2);
  endsequence
  assert property(@(posedge clock) ant2 |-> cons2);  
endmodule
