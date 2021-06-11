package memory
import chisel3._
/**
 * @author YueChen
 */
// 可处理同时读写的存储器
class Memory(c: Int, w: Int) extends Module {
  val nw = (math.log(c) / math.log(2)).toInt;
  val io = IO(new Bundle{
    val rdAddr = Input(UInt(nw.W))
    val rdData = Output(UInt(w.W))
    val wrEna = Input(Bool())
    val wrData = Input(UInt(w.W))
    val wrAddr = Input(UInt(nw.W))
  })
  val mem = Mem(c, UInt(w.W))

//  val doForward = RegNext(io.wrAddr === io.rdAddr && io.wrEna)
//  val memData = mem.read(io.rdAddr)

  when(io.wrEna) {
    mem.write(io.wrAddr, io.wrData)
  }
//  io.rdData := Mux(doForward, io.wrData, memData)
  io.rdData := mem.read(io.rdAddr)
}