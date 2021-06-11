package memory

import chisel3._

/**
 * @author YueChen
 */
class OneHotCodeILvtMultiPortMemory(m: Int, n: Int, size: Int, w: Int) extends Module {
  val addrW: Int = math.ceil(math.log(size) / math.log(2)).toInt
  val io = IO(new Bundle{
    val wrAddr = Input(Vec(m, UInt(addrW.W)))
    val wrData = Input(Vec(m, UInt(w.W)))
    val wrEna = Input(Vec(m, Bool()))

    val rdAddr = Input(Vec(n, UInt(addrW.W)))
    val rdData = Output(Vec(n, UInt(w.W)))
  })

  val memW = Array.fill(m * (m - 1)) {
    Module(new Memory(size, w + m - 1))
  }
  val memR = Array.fill(m * n) {
    Module(new Memory(size, w + m - 1))
  }

  val wrIn = Wire(Vec(m, UInt((w + m - 1).W)))

  // in
  for(i <- 0 until m) {
    val tmp = Wire(Vec(m - 1, UInt(1.W)))
    for(j <- 0 until m) {
      if(j < i) {
        memW(j * (m - 1) + i - 1).io.rdAddr := io.wrAddr(i)
        tmp(j) := ~memW(j * (m - 1) + i - 1).io.rdData(i - 1)
      }
      if(j > i) {
        memW(j * (m - 1) + i).io.rdAddr := io.wrAddr(i)
        tmp(j - 1) := memW(j * (m - 1) + i).io.rdData(i)
      }
    }
    wrIn(i) := (io.wrData(i) << (m - 1)).asUInt() + tmp.asUInt()
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

  // out
  for(i <- 0 until n) {
    io.rdData(i) := 0.U
    for(j <- 0 until m) {
      val tmp = Wire(Vec(m - 1, UInt(1.W)))
      for(k <- 0 until m) {
        if(k < j) {
          tmp(k) := (memR(j * n + i).io.rdData(k) ^ !memR(k * n + i).io.rdData(j - 1)).asUInt()
        }
        if(k > j) {
          tmp(k - 1) := (memR(j * n + i).io.rdData(k - 1) ^ memR((k - 1) * n + i).io.rdData(j)).asUInt()
        }
      }
      when(tmp.asUInt() === 0.U) {
        io.rdData(i) := memR(j * n + i).io.rdData >> (m - 1)
      }
    }
  }
}
