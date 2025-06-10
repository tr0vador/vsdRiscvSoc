	.file	"hello.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Hello, RISC-V!\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	li	a4,72
	lui	a2,%hi(uart)
.L2:
	lw	a3,%lo(uart)(a2)
	addi	a5,a5,1
	sb	a4,0(a3)
	lbu	a4,0(a5)
	bne	a4,zero,.L2
.L3:
	j	.L3
	.size	main, .-main
	.globl	uart
	.section	.sdata,"aw"
	.align	2
	.type	uart, @object
	.size	uart, 4
uart:
	.word	268435456
	.ident	"GCC: (g04696df096) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
