Pipelined RISC-V CPU Implementation in Verilog
Names of Students

Cherif Mikhail

Jacques Jean

Kirollos Mounir

Overview of Project

This project is the implementation of a fully pipelined CPU using Verilog HDL. The name of the core module is CPU_pipelined.
The design includes sequential logic for the flow of instructions through IF, ID, EX, MEM, and WB stages while handling hazards via forwarding, hazard detection unit, and stalling mechanisms.

Supported Instruction Set

The processor supports the RV32I Base Integer Instruction Set, which defines all the arithmetic, logical, data transfer, and control flow instructions necessary to provide a basis for a RISC-V core.

How the Program Works (Execution Instructions)

Load Project:
Place all necessary Verilog files into the Vivado environment.

Run Simulation:
Perform simulation on the testbench file named CPU_tb.v.

Memory Initialization:
The program instructions, in machine code form, need to be set in the unified memory from 0–31.
The data initialization should be done separately, from 32–63.

Observe Results:
Run the simulation and use the waveform viewer to observe key signals.

What Works

All the implemented functionalities are verified and work perfectly. This includes:

The implementation of the pipeline stages: IF/ID, ID/EX, EX/MEM, MEM/WB registers.

Correct computation and updating of the PC, incrementing by four using the components of the RCA.

The forwarding unit logic correctly calculates forwarding signals such that, by forwarding data from later pipeline stages to the ALU inputs, most data hazards are prevented.

The stall logic correctly inserts bubbles by preventing the PC and IF/ID from loading on the particular RAW hazard that appears when the destination register is not zero (ID_EX_Rd).

The control unit, immediate generator, and ALU operations are implemented correctly according to the fields in decoded instructions.

The write-back stage correctly selects the final data — either the memory output or the ALU output via RB_mux — to be written back to the register file, including special cases like auipc, lui, jal, and jalr.

Branch control logic determines the next PC address based on instruction requirements and ALU flags.

Limitations

Typical problems that are usually associated with pipelined CPU implementations include:

Scope of the Instruction Set:
The processor is a strict implementation of the RV32I Base Integer Instruction Set.
We do not support compressed instructions, nor do we have hardware or control logic for multiplication and division.

Branch Prediction:
The design does not use dynamic branch prediction mechanisms.
We instead assume a default behavior of branches and continue to fetch instructions sequentially.
The actual outcome is resolved later in the EX/MEM stage using PCSrc and ALU flags.
If the assumption was wrong, the next instruction in IF/ID is replaced with a bubble.

Structural Hazard:
Since the design uses one unified memory for both instructions and data, a structural hazard occurs when IF needs to fetch an instruction while MEM needs to perform a data read/write.
The conflict signal is asserted when MEM requires memory access.
In this case, MEM is prioritized, and IF is stalled by inhibiting the PC register load signal, delaying the next instruction fetch.
