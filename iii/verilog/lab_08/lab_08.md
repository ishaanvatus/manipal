# DESIGN OF SEQUENTIAL CIRCUITS
## Lab Exercises

1. Analyze the given state table of a synchronous sequential circuit and perform state
reduction. Using the reduced state table, design and simulate the sequential circuit using D flip-flops.

|Present State||Next State|| Output |
|--------------|-----|-----|---|----|   
|              |x=0  |x=1  |x=0|x=1 |
|a             |f    |b    |0  |0   |
|b             |d    |c    |0  |0   |
|c             |f    |e    |0  |0   |
|d             |g    |a    |1  |0   |
|e             |d    |c    |0  |0   |
|f             |f    |b    |1  |1   |
|g             |g    |h    |0  |1   |
|h             |g    |a    |1  |0   |


2. Design the synchronous sequential circuit for the following state diagram using T FF. Write the Verilog code for the derived circuit.


![State Diagram](./state2.png "State Diagram")
