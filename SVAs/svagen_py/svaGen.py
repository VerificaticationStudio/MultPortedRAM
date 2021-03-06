def genLVTSva(m: int, n: int, addr: int, data: int):
    file = open("lvt_sva.sv", mode='w')
    file.writelines("// generated by svaGen.\n")
    file.writelines(["integer addr = " + str(addr) + ";\n",
                     "integer data = " + str(data) + ";\n",
                     "\n"])

    for i in range(m):
        for j in range(n):
            file.writelines(["sequence s" + str(i) + str(j) + "0;\n",
                             "\t(io_wrAddr_" + str(i) + " == addr) && ",
                             "(io_wrData_" + str(i) + " == data) && ",
                             "(io_wrEna_" + str(i) + " == 1) "])
            for k in range(m):
                if k != i:
                    file.writelines(["&& (io_Ena_" + str(k) + " == 0)"])
            file.writelines([";\n",
                             "endsequence\n\n"])

            file.writelines(["property p" + str(i) + str(j) + "0;\n",
                             "\t@(posedge clock) s" + str(i) + str(j),
                             "0 |=> (lvt.lvtReg_" + str(addr) + " == " + str(i) + ")"])
            for k in range(n):
                if k == 0 and i == 0:
                    file.writelines(" && (Memory.mem[" + str(addr) + "] == data)")
                    continue
                file.writelines(" && (Memory_" + str(i * n + k) + ".mem[" + str(addr) + "] == data)")
            file.writelines([";\n",
                             "endproperty\n\n"])

            file.writelines(["sequence s" + str(i) + str(j) + "1;\n",
                             "\t(reset == 0) && (lvt.lvtReg_" + str(addr) + " == " + str(i) + ")"])
            for k in range(n):
                if k == 0 and i == 0:
                    file.writelines(" && (Memory.mem[" + str(addr) + "] == data)")
                    continue
                file.writelines(" && (Memory_" + str(i * n + k) + ".mem[" + str(addr) + "] == data)")
            for k in range(m):
                file.writelines(["&& ((io_wrEna_" + str(k) + " == 0)",
                                 "|| (io_wrAddr_" + str(k) + " != " + str(addr) + "))"])
            file.writelines(" ##1 ((reset == 0)")
            for k in range(m):
                file.writelines([" && ((io_wrEna_" + str(k) + " == 0",
                                 "|| (io_wrAddr_" + str(k) + " != " + str(addr) + "))"])
            file.writelines([")[*3];\n",
                             "endsequence\n\n"])

            file.writelines(["property p" + str(i) + str(j) + "1;\n",
                             "\t(@posedge clock) s" + str(i) + str(j),
                             "1 |-> (lvt.lvtReg_" + str(addr) + " == " + str(i) + ")"])
            for k in range(n):
                if k == 0 and i == 0:
                    file.writelines(" && (Memory.mem[" + str(addr) + "] == data)")
                    continue
                file.writelines(" && (Memory_" + str(i * n + k) + ".mem[" + str(addr) + "] == data)")
            file.writelines([";\n",
                             "endproperty\n\n"])

            file.writelines(["sequence s" + str(i) + str(j) + "2;\n",
                             "\t((lvt.lvtReg_" + str(addr) + " == " + str(i) + ")"])
            if i == 0 and j == 0:
                file.writelines(" && (Memory.mem[" + str(addr) + "] == data)")
            else:
                file.writelines(" && (Memory_" + str(i * n + j) + ".mem[" + str(addr) + "] == data)")
            file.writelines([" && (io_rdAddr_" + str(j) + " == addr))[*2];\n",
                             "endsequence\n\n"])

            file.writelines(["property p" + str(i) + str(j) + "2;\n",
                             "\t(@posedge clock) s" + str(i) + str(j),
                             "2 |-> io_rdData_" + str(j) + " == data;\n",
                             "endsequence\n\n"])
    for i in range(m):
        for j in range(n):
            for k in range(3):
                file.writelines("assert property(p" + str(i) + str(j) + str(k) + ");\n")
    print("Ok!")
    file.close()


def genXORSva(m: int, n: int, addr: int, data: int):
    file = open("xor_sva.sv", mode='w')
    file.writelines("// generated by svaGen.\n")
    file.writelines(["integer addr = " + str(addr) + ";\n",
                     "integer data = " + str(data) + ";\n",
                     "\n"])

    for i in range(m):
        file.writelines(["sequence s" + str(i) + "x0;\n",
                         "\t((io_wrAddr_" + str(i) + " == addr)",
                         " && (io_wrData_" + str(i) + " == data)",
                         " && (io_wrEna_" + str(i) + " == 1)"])
        for k in range(m):
            if k != i:
                file.writelines(" && (io_wrEna_" + str(k) + " == 0)")
        file.writelines([")[*2]\n",
                         "endsequence\n\n"])

        file.writelines(["property p" + str(i) + "x0;\n",
                         "\t@(posedge clock) s" + str(i) + "x",
                         "0 |=> ((Memory.mem[" + str(addr) + "]"])
        for j in range(1, m):
            file.writelines(" ^ Memory_" + str(j * (m - 1)) + ".mem[" + str(addr) + "]")
        file.writelines([") == data);\n",
                         "endproperty\n\n"])

        file.writelines(["sequence s" + str(i) + "x1;\n",
                         "\t((reset == 0) && ((Memory.mem[" + str(addr) + "]"])
        for j in range(1, m):
            file.writelines(" ^ Memory_" + str(j * (m - 1)) + ".mem[" + str(addr) + "]")
        file.writelines([") == data)"])
        for k in range(m):
            file.writelines([" && ((io_wrEna_" + str(k) + " == 0",
                             "|| (io_wrAddr_" + str(k) + " != " + str(addr) + "))"])
        file.writelines([")[*3];\n",
                         "endsequence\n\n"])

        file.writelines(["property p" + str(i) + "x1;\n",
                         "\t@(posedge clock) s" + str(i) + "x",
                         "1 |-> ((Memory.mem[" + str(addr) + "]"])
        for j in range(1, m):
            file.writelines(" ^ Memory_" + str(j * (m - 1)) + ".mem[" + str(addr) + "]")
        file.writelines([") == data);\n",
                         "endproperty\n\n"])

        for j in range(n):
            file.writelines(["sequence s" + str(i) + str(j) + "2;\n",
                             "\t(((Memory_" + str(m * (m - 1) + j) + ".mem[" + str(addr) + "]"])
            for k in range(1, m):
                file.writelines(" ^ Memory_" + str(m * (m - 1) + k * n + j) + ".mem[" + str(addr) + "]")
            file.writelines([") == data) && (io_rdAddr_" + str(j) + " == addr))[*2];\n",
                             "endsequence\n\n"])

            file.writelines(["property p" + str(i) + str(j) + "2;\n",
                             "\t@(posedge clock) s" + str(i) + str(j),
                             "2 |-> io_rdData_" + str(j) + " == data;\n",
                             "endproperty\n\n"])

    for i in range(m):
        file.writelines("assert property(p" + str(i) + "x0);\n")
        file.writelines("assert property(p" + str(i) + "x1);\n")
        for j in range(n):
            file.writelines("assert property(p" + str(i) + str(j) + "2);\n")

    print("Ok!")
    file.close()


def genILVTSva(m: int, n: int, addr: int, data: int):
    file = open("iLvt_sva.sv", mode='w')
    file.writelines("// generated by svaGen.\n")
    file.writelines(["integer addr = " + str(addr) + ";\n",
                     "integer data = " + str(data) + ";\n",
                     "\n"])

    for i in range(m):
        file.writelines(["sequence s" + str(i) + "x0;\n",
                         "\t((io_wrAddr_" + str(i) + " == addr)",
                         " && (io_wrData_" + str(i) + " == data)",
                         " && (io_wrEna_" + str(i) + " == 1)"])
        for k in range(m):
            if k != i:
                file.writelines(" && (io_wrEna_" + str(k) + " == 0)")
        file.writelines([")[*2]\n",
                         "endsequence\n\n"])

        file.writelines(["property p" + str(i) + "x0;\n",
                         "\t@(posedge clock) s" + str(i) + "x",
                         "0 |=> ((Memory.mem[" + str(addr) + "]"])
        for j in range(1, m):
            file.writelines(" ^ Memory_" + str(j * (m - 1)) + ".mem[" + str(addr) + "]")
        file.writelines([") == data);\n",
                         "endproperty\n\n"])

        file.writelines(["sequence s" + str(i) + "x1;\n",
                         "\t((reset == 0) && ((Memory.mem[" + str(addr) + "]"])
        for j in range(1, m):
            file.writelines(" ^ Memory_" + str(j * (m - 1)) + ".mem[" + str(addr) + "]")
        file.writelines([") == data)"])
        for k in range(m):
            file.writelines([" && ((io_wrEna_" + str(k) + " == 0",
                             "|| (io_wrAddr_" + str(k) + " != " + str(addr) + "))"])
        file.writelines([")[*3];\n",
                         "endsequence\n\n"])

        file.writelines(["property p" + str(i) + "x1;\n",
                         "\t@(posedge clock) s" + str(i) + "x",
                         "1 |-> ((Memory.mem[" + str(addr) + "]"])
        for j in range(1, m):
            file.writelines(" ^ Memory_" + str(j * (m - 1)) + ".mem[" + str(addr) + "]")
        file.writelines([") == data);\n",
                         "endproperty\n\n"])

        for j in range(n):
            file.writelines(["sequence s" + str(i) + str(j) + "2;\n",
                             "\t(((Memory_" + str(m * (m - 1) + j) + ".mem[" + str(addr) + "]"])
            for k in range(1, m):
                file.writelines(" ^ Memory_" + str(m * (m - 1) + k * n + j) + ".mem[" + str(addr) + "]")
            file.writelines([") == data) && (io_rdAddr_" + str(j) + " == addr))[*2];\n",
                             "endsequence\n\n"])

            file.writelines(["property p" + str(i) + str(j) + "2;\n",
                             "\t@(posedge clock) s" + str(i) + str(j),
                             "2 |-> io_rdData_" + str(j) + " == data;\n",
                             "endproperty\n\n"])

    for i in range(m):
        file.writelines("assert property(p" + str(i) + "x0);\n")
        file.writelines("assert property(p" + str(i) + "x1);\n")
        for j in range(n):
            file.writelines("assert property(p" + str(i) + str(j) + "2);\n")

    print("Ok!")
    file.close()


if __name__ == '__main__':
    genLVTSva(2, 2, 5, 31)
    genXORSva(2, 2, 5, 31)
