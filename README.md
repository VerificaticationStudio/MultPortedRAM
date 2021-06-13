# Designing and Verifying multi-ported SRAM-based Memories



## Files and directories in this package

- README : Read this first!
- ChiselCode/ : Three kinds of multi-ported ram implemented by Chisel ---- LVT-based, XOR-based, I-LVT-based. 
- FLs/ : GSTE model checking on multiport memories using FORTE.
- SVAs/ :

## Multi-ported memory modules

### XOR-based Approach

The design and implementation of multi-port memory based on XOR is mainly based on an equation of XOR operation, that is, the result obtained by XORing the same number twice is the same as the original one, namely:
$$
\begin{equation}
    A \oplus B \oplus B = A \label{opplusequ}
\end{equation}
$$
