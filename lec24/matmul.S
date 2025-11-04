	.file	"matmul.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"rb"
.LC1:
	.string	"Error opening file"
	.align 8
.LC2:
	.string	"Error reading matrix from file: %s\n"
	.text
	.globl	read_matrix
	.type	read_matrix, @function
read_matrix:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -36[rbp], edx
	mov	DWORD PTR -40[rbp], ecx
	mov	rax, QWORD PTR -24[rbp]
	lea	rdx, .LC0[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L2
	lea	rax, .LC1[rip]
	mov	rdi, rax
	call	perror@PLT
	mov	edi, 1
	call	exit@PLT
.L2:
	mov	eax, DWORD PTR -36[rbp]
	imul	eax, DWORD PTR -40[rbp]
	movsx	rdx, eax
	mov	rcx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	esi, 4
	mov	rdi, rax
	call	fread@PLT
	mov	rdx, rax
	mov	eax, DWORD PTR -36[rbp]
	imul	eax, DWORD PTR -40[rbp]
	cdqe
	cmp	rdx, rax
	je	.L3
	mov	rax, QWORD PTR stderr[rip]
	mov	rdx, QWORD PTR -24[rbp]
	lea	rcx, .LC2[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	edi, 1
	call	exit@PLT
.L3:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	read_matrix, .-read_matrix
	.section	.rodata
	.align 8
.LC3:
	.string	"Matrix dimensions do not allow multiplication.\n"
	.text
	.globl	matrix_multiply
	.type	matrix_multiply, @function
matrix_multiply:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	QWORD PTR -40[rbp], rdx
	mov	DWORD PTR -44[rbp], ecx
	mov	DWORD PTR -48[rbp], r8d
	mov	DWORD PTR -52[rbp], r9d
	mov	eax, DWORD PTR -48[rbp]
	cmp	eax, DWORD PTR -52[rbp]
	je	.L5
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 47
	mov	esi, 1
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	edi, 1
	call	exit@PLT
.L5:
	mov	DWORD PTR -12[rbp], 0
	jmp	.L6
.L11:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L7
.L10:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -8[rbp]
	imul	eax, DWORD PTR 16[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -4[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	mov	ecx, DWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	imul	eax, DWORD PTR -48[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -12[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR [rax]
	mov	eax, DWORD PTR -12[rbp]
	imul	eax, DWORD PTR 16[rbp]
	mov	esi, eax
	mov	eax, DWORD PTR -4[rbp]
	add	eax, esi
	cdqe
	lea	rsi, 0[0+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rsi
	mov	eax, DWORD PTR [rax]
	imul	edx, eax
	mov	eax, DWORD PTR -8[rbp]
	imul	eax, DWORD PTR 16[rbp]
	mov	esi, eax
	mov	eax, DWORD PTR -4[rbp]
	add	eax, esi
	cdqe
	lea	rsi, 0[0+rax*4]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rsi
	add	edx, ecx
	mov	DWORD PTR [rax], edx
	add	DWORD PTR -4[rbp], 1
.L8:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -48[rbp]
	jl	.L9
	add	DWORD PTR -8[rbp], 1
.L7:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -44[rbp]
	jl	.L10
	add	DWORD PTR -12[rbp], 1
.L6:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR 16[rbp]
	jl	.L11
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	matrix_multiply, .-matrix_multiply
	.section	.rodata
.LC4:
	.string	"%d "
	.text
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	DWORD PTR -32[rbp], edx
	mov	DWORD PTR -8[rbp], 0
	jmp	.L13
.L16:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -8[rbp]
	imul	eax, DWORD PTR -32[rbp]
	mov	edx, eax
	mov	eax, DWORD PTR -4[rbp]
	add	eax, edx
	cdqe
	lea	rdx, 0[0+rax*4]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	eax, DWORD PTR [rax]
	mov	esi, eax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L14:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -32[rbp]
	jl	.L15
	mov	edi, 10
	call	putchar@PLT
	add	DWORD PTR -8[rbp], 1
.L13:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -28[rbp]
	jl	.L16
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	print_matrix, .-print_matrix
	.section	.rodata
	.align 8
.LC5:
	.string	"Usage: %s <matrix1.bin> <rows1> <cols1> <matrix2.bin> <rows2> <cols2>\n"
	.align 8
.LC6:
	.string	"Matrix dimensions must be positive integers.\n"
.LC7:
	.string	"Memory allocation failed.\n"
.LC8:
	.string	"Resultant Matrix:"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	cmp	DWORD PTR -68[rbp], 7
	je	.L18
	mov	rax, QWORD PTR -80[rbp]
	mov	rdx, QWORD PTR [rax]
	mov	rax, QWORD PTR stderr[rip]
	lea	rcx, .LC5[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	mov	eax, 1
	jmp	.L19
.L18:
	mov	rax, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR 8[rax]
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -56[rbp], eax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -52[rbp], eax
	mov	rax, QWORD PTR -80[rbp]
	mov	rax, QWORD PTR 32[rax]
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 40
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -48[rbp], eax
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 48
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -44[rbp], eax
	cmp	DWORD PTR -56[rbp], 0
	jle	.L20
	cmp	DWORD PTR -52[rbp], 0
	jle	.L20
	cmp	DWORD PTR -48[rbp], 0
	jle	.L20
	cmp	DWORD PTR -44[rbp], 0
	jg	.L21
.L20:
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 45
	mov	esi, 1
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	eax, 1
	jmp	.L19
.L21:
	mov	eax, DWORD PTR -56[rbp]
	imul	eax, DWORD PTR -52[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	eax, DWORD PTR -48[rbp]
	imul	eax, DWORD PTR -44[rbp]
	cdqe
	sal	rax, 2
	mov	rdi, rax
	call	malloc@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	eax, DWORD PTR -56[rbp]
	imul	eax, DWORD PTR -44[rbp]
	cdqe
	mov	esi, 4
	mov	rdi, rax
	call	calloc@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	je	.L22
	cmp	QWORD PTR -16[rbp], 0
	je	.L22
	cmp	QWORD PTR -8[rbp], 0
	jne	.L23
.L22:
	mov	rax, QWORD PTR stderr[rip]
	mov	rcx, rax
	mov	edx, 26
	mov	esi, 1
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 1
	jmp	.L19
.L23:
	mov	ecx, DWORD PTR -52[rbp]
	mov	edx, DWORD PTR -56[rbp]
	mov	rsi, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -40[rbp]
	mov	rdi, rax
	call	read_matrix
	mov	ecx, DWORD PTR -44[rbp]
	mov	edx, DWORD PTR -48[rbp]
	mov	rsi, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	rdi, rax
	call	read_matrix
	mov	r9d, DWORD PTR -48[rbp]
	mov	r8d, DWORD PTR -52[rbp]
	mov	ecx, DWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	mov	rsi, QWORD PTR -16[rbp]
	mov	rax, QWORD PTR -24[rbp]
	sub	rsp, 8
	mov	edi, DWORD PTR -44[rbp]
	push	rdi
	mov	rdi, rax
	call	matrix_multiply
	add	rsp, 16
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	free@PLT
	mov	eax, 0
.L19:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
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
