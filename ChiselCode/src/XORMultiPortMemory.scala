package memory

import chisel3._

/**
 * @author YueChen
 */

class XORMultiPortMemory(m: Int, n: Int, size: Int, w: Int) extends Module{
  val addrW: Int = math.ceil(math.log(size) / math.log(2)).toInt
  val io = IO(new Bundle{
    val wrAddr = Input(Vec(m, UInt(addrW.W)))
    val wrData = Input(Vec(m, UInt(w.W)))
    val wrEna = Input(Vec(m, Bool()))

    val rdAddr = Input(Vec(n, UInt(addrW.W)))
    val rdData = Output(Vec(n, UInt(w.W)))
  })
  val memW = Array.fill(m * (m - 1)) {
    Module(new Memory(size, w))
  }
  val memR = Array.fill(m * n) {
    Module(new Memory(size, w))
  }

  // 异或结果存放
  val wrIn = Wire(Vec(m, UInt(w.W)))

  // 计算异或结果
  for(i <- 0 until m) {
    val xors = Wire(Vec(m, UInt(w.W)))
    xors(0) := io.wrData(i)
    var cnt = 1
    for(j <- 0 until m) {
      if(j < i) {
        memW(j * (m - 1) + i - 1).io.rdAddr := io.wrAddr(i)
        xors(cnt) := xors(cnt - 1) ^ memW(j * (m - 1) + i - 1).io.rdData
        cnt += 1
      }
      if(i < j) {
        memW(j * (m - 1) + i).io.rdAddr := io.wrAddr(i)
        xors(cnt) := xors(cnt - 1) ^ memW(j * (m - 1) + i).io.rdData
        cnt += 1
      }
    }
    wrIn(i) := xors(m - 1)
  }

  // 接线
  for(i <- 0 until m) {
    for(j <- 0 until m - 1) {
      memW(i * (m - 1) + j).io.wrEna := io.wrEna(i)
      memW(i * (m - 1) + j).io.wrAddr := io.wrAddr(i)
      memW(i * (m - 1) + j).io.wrData := wrIn(i)
    }
  }

  for(i <- 0 until m) {
    for(j <- 0 until n) {
      memR(i * n + j).io.wrEna := io.wrEna(i)
      memR(i * n + j).io.wrAddr := io.wrAddr(i)
      memR(i * n + j).io.wrData := wrIn(i)
      memR(i * n + j).io.rdAddr := io.rdAddr(j)
    }
  }

  // 输出
  for(i <- 0 until n) {
    val xors = Wire(Vec(m, UInt(w.W)))
    xors(0) := memR(i).io.rdData
    for(j <- 1 until m) {
      xors(j) := xors(j - 1) ^ memR(j * n + i).io.rdData
    }
    io.rdData(i) := xors(m - 1)
  }
}
