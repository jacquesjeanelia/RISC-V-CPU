
### Project Title

Pipelined RISC-V CPU Implementation in Verilog

### Student Names

Cherif Mikhail , 
 Jacques Jean
, Kirollos Mounir

### Project Overview

This project implements a fully pipelined CPU using the Verilog HDL. The core module is named CPU_pipelined. The design includes sequential logic for instruction flow through IF, ID, EX, MEM, and WB stages, managing hazards via forwarding, hazard detection unit and stalling mechanisms.

### Supported Instruction Set

The processor supports the **RV32I Base Integer Instruction Set**. This set includes all necessary arithmetic, logical, data transfer, and control flow instructions required for a foundational RISC-V core.

### How the Program Works (Execution Instructions)

1.  **Load Project:** Place all necessary Verilog files into the Vivado environment.
2.  **Run Simulation:** Execute the simulation for the testbench file named **CPU_tb.v**.
3.  **Initialize Memory:** Program instructions, provided in machine code format, must be placed into the unified memory ranging from 0-31. Data should be initialized separately, ranging from 32-63.
4.  **Observe Results:** Run the simulation and use the waveform viewer to observe key signals.
---

### Release Notes

#### What Works

All implemented functionalities are verified and work perfectly. This includes:

*   The implementation of the pipeline stages (IF/ID, ID/EX, EX/MEM, MEM/WB registers).
*   Correct Program Counter (PC) calculation and update, incrementing by four using RCA components.
*   The forwarding unit logic successfully calculates forward signals (forwardA and forwardB) to mitigate most data hazards by directing data from later pipeline stages  to the ALU inputs .
*   The stall logic correctly inserts bubbles by preventing the PC and IF/ID registers from loading when specific RAW hazards occur, particularly when the destination register (ID_EX_Rd) is not zero.
*   The control unit, immediate generator, and ALU operations function correctly based on decoded instruction fields.
*   The write-back stage correctly selects the final data (either memory output or ALU output via RB_mux) to write back to the register file, handling special cases like auipc, lui, jal, and jalr.
*   Branch control logic determines the next PC address based on instruction requirements and ALU flags.

#### Limitations

Typical issues often encountered in pipelined CPU implementations include:

1. Instruction Set Scope: The processor strictly implements the RV32I Base Integer Instruction Set. We do not support instructions from the compressed instructions, meaning we lack dedicated hardware or control logic for multiplication and division operations.
2. Branch Prediction: The design does not employ dynamic branch prediction mechanisms. We assume a default behavior for branches and continue fetching instructions sequentially . The actual branch outcome is resolved later in the EX/MEM stage when the PCSrc signal is determined based on the ALU flags and branch control logic. If the assumed path was incorrect, the subsequent instruction fetched in the IF/ID stage is replaced with a bubble.
3. Structural Hazard : Because the design utilizes a single unified memory or both instruction storage and data storage, a structural hazard occurs when the Instruction Fetch stage attempts to read an instruction and the Memory stage attempts a data read or write simultaneously. The signal conflict is activated when the MEM stage requires memory access. When this conflict occurs, the design prioritizes the data access required by the MEM stage. The IF stage is stalled by setting the PC register load signal to inhibit the update of the Program Counter, thus preventing the fetch of the next instruction and causing a delay
