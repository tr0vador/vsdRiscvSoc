.section .text
.global _start

_start:
    la sp, stack_top     # Set up stack pointer
    call main            # Call main()
    j .                  # Infinite loop

.section .bss
.space 4096
stack_top:
