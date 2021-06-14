### Chisel Project

Three kinds of multi-ported ram implemented by Chisel : LVT-based, XOR-based, I-LVT-based (OneHotCodeILvtMultiPortMemory).

#### Requirement

- SBT from : [sbt - The interactive build tool (scala-sbt.org)](https://www.scala-sbt.org/)

#### RUN

sbt configuration is in build.sbt

You can change the instantiated module and the configuration of the number of read and write ports of the module in ./src/Main.scala, line 13.

```scala
val systemVerilog = chisel3.stage.ChiselStage.emitSystemVerilog(new LVTMultiPortRams(2, 2, 16, 8))
```

