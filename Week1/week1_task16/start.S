.section .text
.global _start
_start:
    la sp, _stack_top
    call main
1:  j 1b  // infinite loop

.section .bss
.space 4096
_stack_top:
