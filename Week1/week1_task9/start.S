.section .text
.globl _start

_start:
    la sp, _stack_top
    call main
1:
    wfi
    j 1b

.section .bss
.space 4096
_stack_top:
