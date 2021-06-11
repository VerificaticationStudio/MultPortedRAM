### VerifyMultiPortMem
GSTE model checking on multiport memories using FORTE

#### Three kinds of multiport memories
- LVT
- XOR
- I-LVT

#### multiport write and read (synchronously) verification
sited in corresponding directories `lvt/, xor/, ilvt/`

#### Files Descriptions
Theory and Tools:
- trajEval.fl: trajectory evaluation logic definition
- tools.fl: mathematical/bexpression-related tools
- yosysBlif2Exlif.py: python2 script for translating blif format into exlif format
Netlist,Models and Verification scripts:
- *.blif: netlist model of memory in Berkeley Logic Interchange Format
- *.exlif: netlist model of memory in Extended Logic Interchange Format
- *.exe.gz: input model for FORTE system
- lvt.fl/xor.fl/ilvt.fl : verification FL scripts


