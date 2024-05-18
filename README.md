# RISC-V Single-Cycle CPU Implementation on Artix-7 FPGA

## Team Members
- Ramy Shehata
- Omar Ganna 
- Mohamed Khaled 

## Project Overview
This project involves designing and implementing a single-cycle RV32i CPU on an Artix-7 FPGA using the Basys3 board. The CPU is capable of executing machine-level code for a RISC-V CPU, implemented in Verilog. Our primary goal was to create a CPU where each instruction is executed in exactly one clock cycle. The CPU supports a subset of the RV32i instruction set, excluding system instructions such as ECALL, EBREAK, and FENCE.


## Key Components
### CPU Datapath Design
The CPU Datapath determines the flow of data and the execution of instructions. It includes:
- Program Unit
- RegFile
- ALU (Arithmetic Logic Unit)
- Control Units (Main Control and Branch Control)
- Specific control signals for branching, jumping, loading, and storing

### Control Unit
The Control Unit generates control signals based on the opcode of the processed instruction. Different control signals are triggered for R, I, S, SB, LUI, AUIPC, and Jump instructions.

### Clock Management
We used a clock divider to create two clocks:
- 1Hz clock for displaying instructions on the 7-segment display
- 200Hz clock for multiplexing the display
The 1Hz clock allows us to visually confirm that each instruction is executed correctly.

### Memory Design
Two BRAMs were used:
- Program ROM: Holds assembly code instructions in a byte-addressable format.
- Data RAM: Stores values for load and store instructions.
Assembly code is read from an external file using the `$readmemb` function.

### I/O Interface Design
The I/O interface primarily uses the 7-segment display to show each instruction's output. The FPGA's resources are minimally used, focusing on the display for output.

### Instruction Implementation
Test cases were created to validate the functionality of each instruction format. Instructions were manually converted to 32-bit machine code and then to 8-bit format for the ROM.

## Running the code
- To run the code you will need to import the verilog files in the Source Files folder onto Vivado and run the implementation on an Xlinix Artix-7 FPGA board.
## Test Cases and Validation
### Test Case 1
Validates basic arithmetic and logical operations (ADD, SUB, OR). 
- Sequence: Load a value with ADDI, add registers, subtract registers, perform OR operation.
- Represented in 8-bit instruction format.

### Test Case 2
Tests bitwise functions (XOR, ORI, ANDI) using I format instructions.

### Test Case 3
Includes branching and shifting instructions to ensure correct functionality.

## Repository Contents
- **Verilog Code**: Source files for CPU Datapath, Control Unit, and testbenches.
- **Block Diagrams**: Visual representations of the CPU Datapath and Control Unit.
- **Test Cases**: Detailed test cases and simulations for validating CPU functionality.
- **Documentation**: Comprehensive report detailing design, implementation, and issues.

For detailed design diagrams and Verilog code, please refer to the respective directories in this repository.


---

Feel free to reach out to us if you have any questions or need further information about our project!