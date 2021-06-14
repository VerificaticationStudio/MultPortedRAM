LVTMultiPortRams: LVTMultiPortRams.smt2
	yosys-smtbmc -s z3 --dump-vcd LVTMultiPortRams.vcd LVTMultiPortRams.smt2
	yosys-smtbmc -s z3 -i --dump-vcd LVTMultiPortRams.vcd LVTMultiPortRams.smt2

LVTMultiPortRams.smt2: LVTMultiPortRams.sv
	yosys -ql LVTMultiPortRams.yslog \
     	-p 'read -sv LVTMultiPortRams.sv' \
	 	-p 'prep -top LVTMultiPortRams -nordff' \
	 	-p 'write_smt2 LVTMultiPortRams.smt2'


XORMultiPortMemory: XORMultiPortMemory.smt2
	yosys-smtbmc -s z3 --dump-vcd XORMultiPortMemory.vcd XORMultiPortMemory.smt2
	yosys-smtbmc -s z3 -i --dump-vcd XORMultiPortMemory.vcd XORMultiPortMemory.smt2

XORMultiPortMemory.smt2: XORMultiPortMemory.sv
	yosys -ql XORMultiPortMemory.yslog \
     	-p 'read -sv XORMultiPortMemory.sv' \
	 	-p 'prep -top XORMultiPortMemory -nordff' \
	 	-p 'write_smt2 XORMultiPortMemory.smt2'


OneHotCodeILvtMultiPortMemory: OneHotCodeILvtMultiPortMemory.smt2
	yosys-smtbmc -s z3 --dump-vcd OneHotCodeILvtMultiPortMemory.vcd OneHotCodeILvtMultiPortMemory.smt2
	yosys-smtbmc -s z3 -i --dump-vcd OneHotCodeILvtMultiPortMemory.vcd OneHotCodeILvtMultiPortMemory.smt2

OneHotCodeILvtMultiPortMemory.smt2: OneHotCodeILvtMultiPortMemory.sv
	yosys -ql OneHotCodeILvtMultiPortMemory.yslog \
     	-p 'read -sv OneHotCodeILvtMultiPortMemory.sv' \
	 	-p 'prep -top OneHotCodeILvtMultiPortMemory -nordff' \
	 	-p 'write_smt2 OneHotCodeILvtMultiPortMemory.smt2'