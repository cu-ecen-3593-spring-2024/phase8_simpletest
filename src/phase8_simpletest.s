//This code is used to test RISC V Instruction set. The register x10 value is incremented with
//every instruction. If an instruction fails it jumps to FAIL sub routine and the value of x20
// is set to 1. The instruction number which failed can be seen in value of register x10. If all
// instructions worked correctly, it jumps to PASS sub routine and the value of x25 register is
// is set to 1 //

// Section .crt0 is always placed from address 0
	.section .crt0, "ax"

//Symbol start is used to obtain entry point information
_start:
    .global _start

    li x2, 0x123  # value to write
    li x3, -1     # value to write
    li x4, 0x100  # for address
    nop
    nop
    nop
    nop

    # Test 1
    sw x2, 0(x4)
    nop
    nop
    nop
    nop
    lw x5, 0(x4)  // x5 should be 0x123
    nop
    nop
    nop
    nop

    // Test 2 -- loading a half word 
    lh x6, 0(x4)  // x6 should be 0x123
    nop
    nop
    nop
    nop


    # Test 3 -- adding IMMEDIATE to address
    sw x3, 4(x4)
    nop
    nop
    nop
    nop
    lw x7, 4(x4) // x7 should be 0xFFFFFFFF 
    nop
    nop
    nop
    nop


    # Test 4 - Test load followed by addi test stall logic
    lw x8, 0(x4)  // x8 should be 0x123
    addi x9, x8, 1 // x9 should be 0x124
    nop
    nop
    nop
    nop
    nop
    halt
    nop
    nop
    nop
    nop
    nop


