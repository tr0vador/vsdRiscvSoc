.section .text
.globl _start
_start:
    la sp, _stack_top
    call main
1:  wfi
    j 1b

.section .trap, "ax"
.globl trap_handler
trap_handler:
    addi sp, sp, -16
    sw ra, 12(sp)
    sw t0, 8(sp)
    sw t1, 4(sp)
    sw t2, 0(sp)

    call timer_isr

    lw ra, 12(sp)
    lw t0, 8(sp)
    lw t1, 4(sp)
    lw t2, 0(sp)
    addi sp, sp, 16
    mret
