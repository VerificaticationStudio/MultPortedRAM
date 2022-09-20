# Designing and Verifying multi-ported SRAM-based Memories


## Files and directories in this package

- README : Read this first!
- ChiselCode/ : Three kinds of multi-ported ram implemented by Chisel : LVT-based, XOR-based, I-LVT-based. 
- FLs/ : GSTE model checking on multiport memories using FORTE.
- SVAs/ : The SVA code described the properties of the multi-ported memory, and it can be check by SymbiYosys.

## Multi-ported memory modules

### XOR-based Approach

The design and implementation of multi-ported memory based on XOR is mainly based on an equation of XOR operation, that is, the result obtained by XORing the same number twice is the same as the original one, namely:

<div align=center><img src="https://raw.githubusercontent.com/mufanx/PictureHost/main/multi-ported_memory/abb.png" height="40" /></div>

Use this equation to get the design: allocate a group of memory blocks for each write port, and you need to update the data of the memory blocks in the same group at the same time when writing, but the updated value is the written data and the wucorresponding in all other memory groups. The result obtained by the exclusive OR of the address data; when reading, you only need to perform the exclusive OR operation on all the data corresponding to the read address in all memory groups to get the actual data that needs the address. The design of 2 write and 2 read ports is shown in this picture:

<div align=center><img src="https://raw.githubusercontent.com/mufanx/PictureHost/main/multi-ported_memory/xor.png" height="400" /></div>



The figure shows the design of 2 read ports and 2 write ports. And it can be summarized that for the multi-ported memory with  m  write ports and  n  read ports, the number of memory blocks required is 

<div align=center><img src="https://github.com/mufanx/PictureHost/blob/main/multi-ported_memory/mxn.png?raw=true" height="25" /></div>

There is no need to rely on registers. Multi-ported memory can be implemented only based on block memory. However, this solution increases the redundancy of block memory. On the write side, for each group need to be redundant to read other write groups and then perform XOR operations. When the write port increases, the increase in the amount of block memory is quadratic.

### I-LVT Approach

In the LVT-based multi-ported memory implementation scheme, an additional register set is needed to store the location information of the memory block group where the data is located, and the register set is required to have the same number of read and write ports as the multi-ported memory module. Therefore, the introduction of I-LVT-based multi-ported memory design has the advantage of not requiring additional registers to assist in storing information.

The I-LVT multi-ported memory design scheme is similar to the LVT scheme. All the memories in the same group are written every time it is written, so as to realize multi-ported reading. The multi-write port is also designed in a similar way, but it will appear in when reading data, it is impossible to determine which group of memory the latest data corresponding to the address is in, so this information needs to be recorded. In the I-LVT way, it is hoped to store this information in an implicit way, without the need to introduce the assistance of the register bank. The design idea is that when writing, it is necessary to combine the data at the corresponding position in the block memory of other groups. Through the input function, the written data and position information are combined, and the result is stored in the memory, so that when reading data, pass Read the memory of all groups, and then analyze and obtain the latest data stored in the corresponding address through the inverse process of the corresponding processing function at the time of writing.

The design of multi-ported memory based on I-LVT is shown here:

<div align=center><img src="https://github.com/mufanx/PictureHost/blob/main/multi-ported_memory/ilvt.png?raw=true" height="450" /></div>



Among them, BRAM\_WR represents a group of memory, corresponding to a group of memory blocks that each write port writes data each time. The connection between wr 1 write port and memory and the connection between rd 1 read port and memory are expanded in the figure. The input data of wr 1 port on the writing side and the data in the memory of the same address taken from other groups of memory are used as the input of the module f_fb​, and the output of this module is used as a group of memory blocks written to the subscript 1 The data content. On the read side, the data content corresponding to the read address in all groups needs to be taken out as the input of the module f_out​, and the output of the module is the read data output of the rd 1 port. The connection design of the other read-write ports and the memory is similar to that of the expanded two ports.

It can be seen that in the I-LVT multi-ported memory solution, there will be different specific implementation according to the different design of the modules f_fb and f_out. Note that the XOR-based multi-ported memory implementation is actually a special I-LVT multi-ported memory implementation. Here is the function definition of its f_fb and f_out modules:

<div align=center><img src="https://github.com/mufanx/PictureHost/blob/main/multi-ported_memory/fxor.png?raw=true" height="50" /></div>

In this research, a specific I-LVT multi-ported memory solution is also implemented. The definitions of  f_fb and  f_out  are given below:

<div align=center><img src="https://github.com/mufanx/PictureHost/blob/main/multi-ported_memory/filvt.png?raw=true" height="140" /></div>

It can be obtained by the function definition. In this multi-ported memory implementation based on one-hot encoding, the data written into the memory needs to be added with an additional m-1​ flag to store location information; when reading data, each read port needs For  k belong [0, m) , calculate the results of  f_(out, k)  respectively. If the flag information in the result is all 1, the latest update data corresponding to the address in the memory is obtained.

