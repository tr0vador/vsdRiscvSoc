	.file	"hello.c"
	.option nopic
	.attribute arch, "rv32i2p1_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	uart
	.section	.sdata,"aw"
	.align	2
	.type	uart, @object
	.size	uart, 4
uart:
	.word	268435456
	.section	.rodata
	.align	2
.LC0:
	.string	"Hello, RISC-V!\n"
	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	sw	a5,-20(s0)
	j	.L2
.L3:
	lw	a5,-20(s0)
	addi	a4,a5,1
	sw	a4,-20(s0)
	lui	a4,%hi(uart)
	lw	a4,%lo(uart)(a4)
	lbu	a5,0(a5)
	sb	a5,0(a4)
.L2:
	lw	a5,-20(s0)
	lbu	a5,0(a5)
	bne	a5,zero,.L3
.L4:
	j	.L4
	.size	main, .-main
	.ident	"GCC: (g04696df096) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
