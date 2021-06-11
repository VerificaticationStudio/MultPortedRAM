import sys, getopt

def bracket(line):
    if '[' in line:
        line = line.replace('[', '<')
    if ']' in line:
        line = line.replace(']', '>')
    return line

def slash(line):
    if '\\' in line:
        line = line.replace('\\', '_')
    return line

def clk(line):
    if 'clk' in line:
        line = line.replace('clk', 'CLK')
    if 'clock' in line:
        line = line.replace('clock', 'CLK')
    return line

def blif2Exlif(fin, fout):
    f1 = open(fin, 'r')
    f2 = open(fout, 'w')
    for line in f1:
        tmp = clk(line) # deal with clock signal
        tmp = slash(tmp) # deal with backslash
        tmp = bracket(tmp) # deal with square bracket
        f2.write(tmp)
    f1.close()
    f2.close()


if __name__ == '__main__':
    fin = ''
    fout = ''
    try:
        opts, args = getopt.getopt(sys.argv[1:], "hi:", ["help", "fin="])
    except getopt.GetoptError:
        print "Usage: python yosysBlif2Exlif.py -i <inputfile>"
        sys.exit(2)
    for opt,arg in opts:
        if opt == '-h':
            print "Usage: python yosysBlif2Exlif.py -i <inputfile>"
            sys.exit(2)
        elif opt in ("-i", "--fin"):
            fin = arg
    fout = ''.join(fin.split('.')[:-1]) + ".exlif"
    blif2Exlif(fin, fout)
