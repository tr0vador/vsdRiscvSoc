.section .text
.globl _start
_start:
    # Set up stack pointer
    la sp, _stack_top

    # Clear .bss section
    la a0, __bss_start
    la a1, __bss_end
clear_bss:
    beq a0, a1, bss_cleared
    sw zero, 0(a0)
    addi a0, a0, 4
    j clear_bss
bss_cleared:

    # Call main()
    call main

    # Infinite loop if main returns
hang:
    wfi
    j hang

.section .bss
.space 1024
_stack_top:

.extern main
