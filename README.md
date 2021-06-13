# Designing and Verifying multi-ported SRAM-based Memories



## Files and directories in this package

- README : Read this first!
- ChiselCode/ : Three kinds of multi-ported ram implemented by Chisel : LVT-based, XOR-based, I-LVT-based. 
- FLs/ : GSTE model checking on multiport memories using FORTE.
- SVAs/ :

## Multi-ported memory modules

### XOR-based Approach

The design and implementation of multi-ported memory based on XOR is mainly based on an equation of XOR operation, that is, the result obtained by XORing the same number twice is the same as the original one, namely:

<div align=center><img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/e94267c3-e416-4884-afb3-d8033441a50b/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210613T154752Z&X-Amz-Expires=86400&X-Amz-Signature=aea17fd216ee6f27adce0bb8b2f26f1ff71ab2b37d813c35a67837d313e05f1f&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22" height="30" /></div>

Use this equation to get the design: allocate a group of memory blocks for each write port, and you need to update the data of the memory blocks in the same group at the same time when writing, but the updated value is the written data and the corresponding in all other memory groups. The result obtained by the exclusive OR of the address data; when reading, you only need to perform the exclusive OR operation on all the data corresponding to the read address in all memory groups to get the actual data that needs the address. The design of 2 write and 2 read ports is shown in this picture:

<div align=center><img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/76059e9a-f2b9-49c8-9553-79068a6ed7d4/pic3.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210613T084950Z&X-Amz-Expires=86400&X-Amz-Signature=7bd9b80262f34dac178f9e89fe127b33f0d480b05318fd8e8b8582b6a5cf7744&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22pic3.png%22" height="400" /></div>



The figure shows the design of 2 read ports and 2 write ports. And it can be summarized that for the multi-ported memory with  m  write ports and  n  read ports, the number of memory blocks required is 

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/c3d40975-004c-4631-8130-eaf92ce2152b/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210613T085208Z&X-Amz-Expires=86400&X-Amz-Signature=c8e8c5bd5cf5717defbc67d0535773114d4cfc1c50cbd9aa912aec30465a160a&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22" style="zoom: 67%;" />

There is no need to rely on registers. Multi-ported memory can be implemented only based on block memory. However, this solution increases the redundancy of block memory. On the write side, for each group need to be redundant to read other write groups and then perform XOR operations. When the write port increases, the increase in the amount of block memory is quadratic.

### I-LVT Approach

In the LVT-based multi-ported memory implementation scheme, an additional register set is needed to store the location information of the memory block group where the data is located, and the register set is required to have the same number of read and write ports as the multi-ported memory module. Therefore, the introduction of I-LVT-based multi-ported memory design has the advantage of not requiring additional registers to assist in storing information.

The I-LVT multi-ported memory design scheme is similar to the LVT scheme. All the memories in the same group are written every time it is written, so as to realize multi-ported reading. The multi-write port is also designed in a similar way, but it will appear in when reading data, it is impossible to determine which group of memory the latest data corresponding to the address is in, so this information needs to be recorded. In the I-LVT way, it is hoped to store this information in an implicit way, without the need to introduce the assistance of the register bank. The design idea is that when writing, it is necessary to combine the data at the corresponding position in the block memory of other groups. Through the input function, the written data and position information are combined, and the result is stored in the memory, so that when reading data, pass Read the memory of all groups, and then analyze and obtain the latest data stored in the corresponding address through the inverse process of the corresponding processing function at the time of writing.

The design of multi-ported memory based on I-LVT is shown here:

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/c0cd3a51-93fa-4905-94c0-4f4c4517fc4d/pic4.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210613T085733Z&X-Amz-Expires=86400&X-Amz-Signature=c319db5bfcfc1db653d93ff7cd535c0107d1c85ff2965be6b13333c0f32dc2ff&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22pic4.png%22" style="zoom:80%;" />

Among them, BRAM\_WR represents a group of memory, corresponding to a group of memory blocks that each write port writes data each time. The connection between wr 1 write port and memory and the connection between rd 1 read port and memory are expanded in the figure. The input data of wr 1 port on the writing side and the data in the memory of the same address taken from other groups of memory are used as the input of the module f_fb​, and the output of this module is used as a group of memory blocks written to the subscript 1 The data content. On the read side, the data content corresponding to the read address in all groups needs to be taken out as the input of the module f_out​, and the output of the module is the read data output of the rd 1 port. The connection design of the other read-write ports and the memory is similar to that of the expanded two ports.

It can be seen that in the I-LVT multi-ported memory solution, there will be different specific implementation according to the different design of the modules f_fb and f_out. Note that the XOR-based multi-ported memory implementation is actually a special I-LVT multi-ported memory implementation. Here is the function definition of its f_fb and f_out modules:

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/6a564ca3-4b87-433c-877a-8b101127fcd2/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210613T090412Z&X-Amz-Expires=86400&X-Amz-Signature=e85ff7e7a7d9822ffd06c4cf0bd09338566c0b60accf79665a3a2a5608c079f7&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22" style="zoom: 50%;" />

In this research, a specific I-LVT multi-ported memory solution is also implemented. The definitions of  f_fb and  f_out  are given below:

<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f381f264-27ed-4111-b4ff-d25033b31fb7/Untitled.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210613%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210613T090756Z&X-Amz-Expires=86400&X-Amz-Signature=8bbc1e4cf21d2c978fe4920b13ba815cb3ebebc7a43bf964c166112c810d9fa2&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22Untitled.png%22" style="zoom: 50%;" />

It can be obtained by the function definition. In this multi-ported memory implementation based on one-hot encoding, the data written into the memory needs to be added with an additional m-1​ flag to store location information; when reading data, each read port needs For  k belong [0, m) , calculate the results of  f_(out, k)  respectively. If the flag information in the result is all 1, the latest update data corresponding to the address in the memory is obtained.

