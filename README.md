Pipelined RISC-V CPU Implementation in Verilog
Student Names

Cherif Mikhail
# Pipelined RISC-V CPU Implementation in Verilog

## Student Names
- **Cherif Mikhail**
- **Jacques Jean**
- **Kirollos Mounir**

---

## Overview of Project
This project is the implementation of a fully pipelined CPU using Verilog HDL. The name of the core module is **CPU_pipelined**.  
The design includes sequential logic for the flow of instructions through the **IF, ID, EX, MEM, and WB** stages while handling hazards via forwarding, the hazard detection unit, and stalling mechanisms.

---

## Supported Instruction Set
The processor supports the **RV32I Base Integer Instruction Set**, which defines all the arithmetic, logical, data transfer, and control flow instructions necessary to provide a basis for a RISC-V core.

---

## How the Program Works (Execution Instructions)

1. **Load Project**  
   Place all necessary Verilog files into the Vivado environment.

2. **Run Simulation**  
   Perform simulation on the testbench file **CPU_tb.v**.

3. **Memory Initialization**  
   - Program instructions (machine code) should be placed in unified memory addresses **0–31**.  
   - Data initialization should be done in addresses **32–63**.

4. **Observe Results**  
   Run the simulation and use the waveform viewer to observe key signals.

---

## What Works

All the implemented functionalities are verified and work perfectly. This includes:

- Implementation of the pipeline stages: **IF/ID**, **ID/EX**, **EX/MEM**, **MEM/WB**.
- Correct computation and updating of the PC, incrementing by 4 using the RCA components.
- The forwarding unit correctly calculates forwarding signals so that data from later stages can be sent to ALU inputs, preventing most data hazards.
- The stall logic correctly inserts bubbles by preventing PC and IF/ID from loading during RAW hazards when the destination register is not zero (**ID_EX_Rd**).
- The control unit, immediate generator, and ALU operations function correctly according to decoded instruction fields.
- The write-back stage correctly selects the final data (memory output or ALU output) via **RB_mux**, including special cases such as **auipc, lui, jal, jalr**.
- Branch control logic correctly determines the next PC address based on ALU flags and instruction requirements.

---

## Limitations

Typical problems associated with pipelined CPU implementations include:

### 1. Scope of the Instruction Set
The processor is a strict implementation of the RV32I Base Integer Instruction Set.  
It does **not** support compressed instructions, multiplication, or division.

### 2. Branch Prediction
The design does **not** include dynamic branch prediction.  
Instructions are fetched sequentially by default.  
The actual branch outcome is resolved in the EX/MEM stage when **PCSrc** is determined based on ALU flags and branch control logic.  
If the assumed path was incorrect, the instruction in IF/ID is replaced with a bubble.

### 3. Structural Hazard
The design uses a **single unified memory** for both instruction and data storage.  
This creates a structural hazard when the IF stage fetches an instruction while the MEM stage performs a data access.

- The **conflict** signal is asserted whenever the MEM stage needs memory access.  
- MEM access is prioritized.  
- The IF stage is stalled by preventing the PC register from updating, delaying the next instruction fetch.

---

Jacques Jean

Kirollos Mounir

Overview of Project

This project is the implementation of a fully pipelined CPU using Verilog HDL. The name of the core module is CPU_pipelined.
The design includes sequential logic for the flow of instructions through the IF, ID, EX, MEM, and WB stages while handling hazards via the forwarding unit, hazard detection unit, and stalling mechanisms.

Supported Instruction Set

The processor supports the RV32I Base Integer Instruction Set, which defines all the arithmetic, logical, data transfer, and control flow instructions necessary for a RISC-V core.

How the Program Works (Execution Instructions)

Load Project
Place all necessary Verilog files into the Vivado environment.

Run Simulation
Run the simulation on the testbench file CPU_tb.v.

Memory Initialization

Program instructions (machine code) must be placed in unified memory addresses 0–31.

Data must be initialized separately in addresses 32–63.

Observe Results
Use the waveform viewer to observe key signals during simulation.

What Works

All the implemented functionalities are verified and work correctly:

Full implementation of pipeline stages: IF/ID, ID/EX, EX/MEM, MEM/WB.

Correct computation and update of the PC (increments by 4 using RCA components).

Forwarding unit correctly generates forward signals to prevent most RAW data hazards by forwarding data from later pipeline stages to ALU inputs.

Stall logic correctly inserts pipeline bubbles when a load-use RAW hazard occurs and the destination register is not zero (ID_EX_Rd).

Control unit, immediate generator, and ALU operations behave according to instruction decoding.

Write-back stage correctly selects memory output or ALU output via RB_mux, including special handling for auipc, lui, jal, jalr.

Branch control logic correctly determines the next PC based on ALU flags and instruction specifications.

Limitations

Typical problems associated with pipelined CPU designs include:

1. Scope of the Instruction Set

The processor strictly implements the RV32I Base Integer Instruction Set only.
Compressed instructions, multiplication, and division instructions are not supported.

2. Branch Prediction

The design does not include dynamic branch prediction.
Instructions are fetched sequentially by default.
The actual branch outcome is resolved in the EX/MEM stage using the PCSrc signal.
If the prediction was incorrect, the IF/ID instruction is replaced with a bubble.

3. Structural Hazard

A unified memory is used for both instruction and data storage.
This causes a structural hazard when:

IF needs to fetch an instruction and

MEM performs a data read/write in the same cycle.

When this conflict occurs:

The conflict signal is asserted.

MEM access is prioritized.

The IF stage is stalled by preventing the PC from updating.

The next instruction fetch is delayed until memory is free.
