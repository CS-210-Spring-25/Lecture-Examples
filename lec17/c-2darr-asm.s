	.file	"c-2darr-asm.c"
	.intel_syntax noprefix
	.text
	.globl	sumit2D
	.type	sumit2D, @function
sumit2D:
	movsx	rdi, edi
	movsx	rsi, esi
	imul	rdi, rdi, 7
	add	rdi, rsi
	mov	rax, QWORD PTR ARR[0+rdi*8]
	add	rax, 51
	ret
	.size	sumit2D, .-sumit2D
	.globl	ARR
	.data
	.align 32
	.type	ARR, @object
	.size	ARR, 168
ARR:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	2
	.quad	3
	.quad	3
	.quad	3
	.quad	3
	.quad	3
	.quad	3
	.quad	3
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
