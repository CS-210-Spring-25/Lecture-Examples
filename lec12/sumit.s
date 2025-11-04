	.file	"sumit.c"
	.text
	.p2align 4
	.globl	sumit
	.type	sumit, @function
sumit:
.LFB0:
	.cfi_startproc
	endbr64
	movdqa	XARRAY(%rip), %xmm0
	paddq	16+XARRAY(%rip), %xmm0
	paddq	32+XARRAY(%rip), %xmm0
	paddq	48+XARRAY(%rip), %xmm0
	paddq	64+XARRAY(%rip), %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$8, %xmm1
	paddq	%xmm1, %xmm0
	movq	%xmm0, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	sumit, .-sumit
	.globl	XARRAY
	.bss
	.align 32
	.type	XARRAY, @object
	.size	XARRAY, 8192
XARRAY:
	.zero	8192
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
