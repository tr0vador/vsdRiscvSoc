	.file	"task10_no_volatile.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0_a2p1_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	toggle_gpio_no_volatile
	.type	toggle_gpio_no_volatile, @function
toggle_gpio_no_volatile:
	li	a5,268509184
	li	a4,1
	sw	a4,0(a5)
	ret
	.size	toggle_gpio_no_volatile, .-toggle_gpio_no_volatile
	.section	.text.startup,"ax",@progbits
	.align	1
	.globl	main
	.type	main, @function
main:
	li	a5,268509184
	li	a4,1
	sw	a4,0(a5)
	li	a0,0
	ret
	.size	main, .-main
	.ident	"GCC: (g04696df096) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
