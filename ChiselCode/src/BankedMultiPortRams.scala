package memory

import chisel3._

/**
 * @author YueChen
 */

/**
 * Banked Multi-Port RAMs
 * 存储器的数量取为 max(m, n) * 2 来尽量减少冲突, 地址取模的方式分布数据
 * based on https://tomverbeure.github.io/2019/08/03/Multiport-Memories.html
 */


class BankedMultiPortRams(m: Int, n: Int) extends Module{
  val io = IO(new Bundle{
    val wrAddr = Input(Vec(m, UInt(10.W)))
    val wrData = Input(Vec(m, UInt(8.W)))
    val wrEna = Input(Vec(m, Bool()))

    val rdAddr = Input(Vec(n, UInt(10.W)))
    val rdData = Output(Vec(n, UInt(8.W)))
  })
  val memNum = math.max(m, n) * 2
  val mems = VecInit(Seq.fill(memNum)(Module(new Memory(1024, 8)).io))

  for(i <- 0 until n) {
    io.rdData(i) := 0.U
  }
  for(i <- 0 until memNum) {
    mems(i).wrEna := false.B
    mems(i).wrAddr := 0.U
    mems(i).wrData := 0.U
    mems(i).rdAddr := 0.U
    for(j <- 0 until m) {
      val index = io.wrAddr(j) % memNum.U
      when(index === i.U) {
        mems(i).wrEna := io.wrEna(j)
        mems(i).wrAddr := io.wrAddr(j)
        mems(i).wrData := io.wrData(j)
      }
    }
    for(j <- 0 until n) {
      val index = io.rdAddr(j) % memNum.U
      when(index === i.U) {
        mems(i).rdAddr := io.rdAddr(j)
        io.rdData(j) := mems(i).rdData
      }
    }
  }
}
