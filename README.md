# universal-shift-register
Universal Shift Register – Verilog

Description

A Universal Shift Register is a versatile sequential circuit that can store data, shift data left or right, and load data in parallel.

Operations

Select| Operation
"00"| Hold
"01"| Shift Right
"10"| Shift Left
"11"| Parallel Load

Features

- 4-bit universal shift register
- Hold operation
- Left shift
- Right shift
- Parallel data loading
- Synchronous operation using a clock
- Active-high reset

Files

- "universal_shift_register.v" – Main Verilog design
- "universal_shift_register_tb.v" – Testbench for simulation

Simulation

The design can be simulated using Icarus Verilog, ModelSim, QuestaSim, or Vivado.

Icarus Verilog

iverilog -o usr_sim universal_shift_register.v universal_shift_register_tb.v
vvp usr_sim

For waveform viewing:

gtkwave waveform.vcd

Expected Operations

The testbench verifies:

- Reset
- Hold
- Shift right
- Shift left
- Parallel load

Applications

Universal shift registers are commonly used in:

- Data storage
- Serial-to-parallel conversion
- Parallel-to-serial conversion
- Digital communication
- Data transfer systems

Author: Harshitha 

