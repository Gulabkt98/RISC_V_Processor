# RISC-V ALU Implementation

This repository contains a Verilog implementation of an Arithmetic Logic Unit (ALU) designed for a RISC-V processor.

## Overview

The ALU (Arithmetic Logic Unit) is a fundamental component of the RISC-V processor that performs arithmetic and logical operations. This implementation supports basic RISC-V integer operations.

## Module Interface

### Inputs
- `A[31:0]`: First operand (32-bit)
- `B[31:0]`: Second operand (32-bit)
- `ALUcontrol[2:0]`: Operation selection signal

### Outputs
- `Result[31:0]`: ALU operation result (32-bit)

## Supported Operations

The ALU supports the following operations based on the ALUcontrol signal:

| Operation | Description |
|-----------|-------------|
| AND | Bitwise AND |
| OR  | Bitwise OR |
| NOT | Bitwise NOT (on B input) |

## Implementation Details

The ALU is implemented in `ALU.v` with the following features:
- Combinational logic design
- Basic logic operations
- Wire-based intermediate signals for clarity
- Support for RISC-V integer operations

## Usage

To use this ALU in your RISC-V processor:

1. Include the `ALU.v` file in your project
2. Instantiate the ALU module in your processor design
3. Connect the appropriate control and data signals

## Example Instance

```verilog
ALU alu_instance (
    .A(operand_a),
    .B(operand_b),
    .ALUcontrol(alu_control),
    .Result(alu_result)
);
```

## Testing

To verify the ALU functionality:
1. Use a testbench to simulate different input combinations
2. Verify all supported operations
3. Check edge cases and boundary conditions

## Future Enhancements

Planned improvements include:
- Adding support for additional arithmetic operations
- Implementing comparison operations
- Adding overflow and carry flags
- Expanding ALU control to 4 bits for more operations

## License

This project is open source and available under standard open-source terms.

## Contributing

Contributions are welcome! Please feel free to submit pull requests with improvements or bug fixes.