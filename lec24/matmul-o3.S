	.file	"matmul.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"rb"
.LC1:
	.string	"Error opening file"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Error reading matrix from file: %s\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4
	.globl	read_matrix
	.type	read_matrix, @function
read_matrix:
.LFB39:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	mov	r14d, ecx
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	mov	r12, rsi
	lea	rsi, .LC0[rip]
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	mov	rbp, rdi
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	ebx, edx
	call	fopen@PLT
	test	rax, rax
	je	.L4
	imul	ebx, r14d
	mov	rcx, rax
	mov	esi, 4
	mov	rdi, r12
	mov	r13, rax
	movsx	rbx, ebx
	mov	rdx, rbx
	call	fread@PLT
	cmp	rbx, rax
	jne	.L7
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	mov	rdi, r13
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	jmp	fclose@PLT
.L7:
	.cfi_restore_state
	mov	rdi, QWORD PTR stderr[rip]
	mov	rcx, rbp
	mov	esi, 2
	xor	eax, eax
	lea	rdx, .LC2[rip]
	call	__fprintf_chk@PLT
	mov	rdi, r13
	call	fclose@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	read_matrix.cold, @function
read_matrix.cold:
.LFSB39:
.L4:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	lea	rdi, .LC1[rip]
	call	perror@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE39:
	.text
	.size	read_matrix, .-read_matrix
	.section	.text.unlikely
	.size	read_matrix.cold, .-read_matrix.cold
.LCOLDE3:
	.text
.LHOTE3:
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Matrix dimensions do not allow multiplication.\n"
	.text
	.p2align 4
	.globl	matrix_multiply
	.type	matrix_multiply, @function
matrix_multiply:
.LFB40:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 120
	.cfi_def_cfa_offset 176
	mov	QWORD PTR 96[rsp], rsi
	mov	ebp, DWORD PTR 176[rsp]
	mov	DWORD PTR 12[rsp], ecx
	cmp	r8d, r9d
	jne	.L9
	test	ebp, ebp
	jle	.L8
	test	ecx, ecx
	jle	.L8
	mov	r14d, r8d
	test	r8d, r8d
	jle	.L8
	movsx	rax, ebp
	mov	r12, rdx
	mov	r13d, r8d
	mov	ebx, r8d
	mov	QWORD PTR 88[rsp], rax
	and	r13d, -4
	shr	ebx, 2
	xor	esi, esi
	lea	r15, 0[0+rax*4]
	movsx	rax, r8d
	mov	QWORD PTR 64[rsp], rdi
	sal	rbx, 4
	lea	rdx, 0[0+rax*4]
	mov	DWORD PTR 24[rsp], r13d
	lea	rax, [rdx+r12]
	mov	QWORD PTR 104[rsp], rdx
	mov	QWORD PTR 80[rsp], rax
	lea	eax, -1[r8]
	mov	DWORD PTR 8[rsp], eax
	lea	eax, 1[r13]
	mov	DWORD PTR 28[rsp], eax
	lea	eax, 2[r13]
	mov	DWORD PTR 72[rsp], eax
	mov	QWORD PTR 56[rsp], 0
	.p2align 4,,10
	.p2align 3
.L11:
	mov	rcx, QWORD PTR 96[rsp]
	movsx	rdx, esi
	mov	DWORD PTR 76[rsp], esi
	xor	r11d, r11d
	lea	rax, 4[0+rdx*4]
	mov	r9, QWORD PTR 80[rsp]
	mov	r8, QWORD PTR 64[rsp]
	xor	r10d, r10d
	lea	rdi, [rcx+rax]
	lea	r13, -4[rcx+rax]
	mov	eax, DWORD PTR 24[rsp]
	mov	QWORD PTR 16[rsp], rdi
	mov	rdi, r12
	add	eax, esi
	cdqe
	lea	rax, [rcx+rax*4]
	mov	QWORD PTR 32[rsp], rax
	mov	eax, DWORD PTR 28[rsp]
	add	eax, esi
	cdqe
	lea	rax, [rcx+rax*4]
	mov	QWORD PTR 40[rsp], rax
	mov	eax, DWORD PTR 72[rsp]
	add	eax, esi
	mov	rsi, QWORD PTR 104[rsp]
	cdqe
	lea	rax, [rcx+rax*4]
	lea	rcx, [rcx+rdx*4]
	mov	QWORD PTR 48[rsp], rax
	mov	QWORD PTR [rsp], rcx
	.p2align 4,,10
	.p2align 3
.L20:
	cmp	DWORD PTR 8[rsp], 2
	jbe	.L21
	lea	rax, [rdi+rsi]
	cmp	r8, rax
	lea	rax, 4[r8]
	setnb	dl
	cmp	rdi, rax
	setnb	al
	or	al, dl
	je	.L21
	mov	rcx, QWORD PTR 16[rsp]
	mov	rax, rdi
	sub	rax, rcx
	cmp	rax, 8
	jbe	.L21
	movd	xmm4, DWORD PTR [r8]
	xor	eax, eax
	pshufd	xmm2, xmm4, 0
	movdqa	xmm3, xmm2
	psrlq	xmm3, 32
	.p2align 4,,10
	.p2align 3
.L12:
	movdqu	xmm0, XMMWORD PTR 0[r13+rax]
	movdqu	xmm1, XMMWORD PTR 0[r13+rax]
	psrlq	xmm0, 32
	pmuludq	xmm1, xmm2
	pmuludq	xmm0, xmm3
	pshufd	xmm1, xmm1, 8
	pshufd	xmm0, xmm0, 8
	punpckldq	xmm1, xmm0
	movdqu	xmm0, XMMWORD PTR [rdi+rax]
	paddd	xmm0, xmm1
	movups	XMMWORD PTR [rdi+rax], xmm0
	add	rax, 16
	cmp	rbx, rax
	jne	.L12
	mov	eax, DWORD PTR 24[rsp]
	cmp	r14d, eax
	je	.L15
	mov	rcx, QWORD PTR 32[rsp]
	add	eax, r11d
	mov	edx, DWORD PTR [r8]
	cdqe
	imul	edx, DWORD PTR [rcx]
	add	DWORD PTR [r12+rax*4], edx
	mov	eax, DWORD PTR 28[rsp]
	cmp	r14d, eax
	jle	.L15
	mov	rcx, QWORD PTR 40[rsp]
	add	eax, r11d
	mov	edx, DWORD PTR [r8]
	cdqe
	imul	edx, DWORD PTR [rcx]
	add	DWORD PTR [r12+rax*4], edx
	mov	eax, DWORD PTR 72[rsp]
	cmp	r14d, eax
	jle	.L15
	mov	rcx, QWORD PTR 48[rsp]
	add	eax, r11d
	mov	edx, DWORD PTR [r8]
	cdqe
	imul	edx, DWORD PTR [rcx]
	add	DWORD PTR [r12+rax*4], edx
.L15:
	add	r10d, 1
	add	rdi, r15
	add	r11d, ebp
	add	r8, rsi
	add	r9, r15
	cmp	DWORD PTR 12[rsp], r10d
	jne	.L20
	add	QWORD PTR 56[rsp], 1
	mov	esi, DWORD PTR 76[rsp]
	mov	rax, QWORD PTR 56[rsp]
	mov	rdi, QWORD PTR 88[rsp]
	add	QWORD PTR 64[rsp], 4
	add	esi, ebp
	cmp	rax, rdi
	jne	.L11
.L8:
	add	rsp, 120
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_restore_state
	mov	rcx, QWORD PTR [rsp]
	mov	rax, rdi
	.p2align 4,,10
	.p2align 3
.L14:
	mov	edx, DWORD PTR [r8]
	imul	edx, DWORD PTR [rcx]
	add	rcx, 4
	add	DWORD PTR [rax], edx
	add	rax, 4
	cmp	rax, r9
	jne	.L14
	jmp	.L15
.L9:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 47
	mov	esi, 1
	lea	rdi, .LC4[rip]
	call	fwrite@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE40:
	.size	matrix_multiply, .-matrix_multiply
	.section	.rodata.str1.1
.LC5:
	.string	"%d "
	.text
	.p2align 4
	.globl	print_matrix
	.type	print_matrix, @function
print_matrix:
.LFB41:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	mov	QWORD PTR 8[rsp], rdi
	mov	DWORD PTR 4[rsp], esi
	test	esi, esi
	jle	.L29
	mov	r12d, edx
	xor	r14d, r14d
	lea	rbp, .LC5[rip]
	xor	r13d, r13d
	.p2align 4,,10
	.p2align 3
.L31:
	test	r12d, r12d
	jle	.L34
	mov	rcx, QWORD PTR 8[rsp]
	movsx	rdx, r14d
	movsx	rax, r12d
	add	rax, rdx
	lea	r15, [rcx+rdx*4]
	lea	rbx, [rcx+rax*4]
	.p2align 4,,10
	.p2align 3
.L32:
	mov	edx, DWORD PTR [r15]
	mov	rsi, rbp
	mov	edi, 2
	xor	eax, eax
	add	r15, 4
	call	__printf_chk@PLT
	cmp	rbx, r15
	jne	.L32
.L34:
	mov	edi, 10
	add	r13d, 1
	add	r14d, r12d
	call	putchar@PLT
	cmp	DWORD PTR 4[rsp], r13d
	jne	.L31
.L29:
	add	rsp, 24
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE41:
	.size	print_matrix, .-print_matrix
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Usage: %s <matrix1.bin> <rows1> <cols1> <matrix2.bin> <rows2> <cols2>\n"
	.align 8
.LC7:
	.string	"Matrix dimensions must be positive integers.\n"
	.section	.rodata.str1.1
.LC8:
	.string	"Memory allocation failed.\n"
.LC9:
	.string	"Resultant Matrix:"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB42:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	mov	rbp, rsi
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	cmp	edi, 7
	je	.L38
	mov	rcx, QWORD PTR [rsi]
	mov	rdi, QWORD PTR stderr[rip]
	mov	esi, 2
	xor	eax, eax
	lea	rdx, .LC6[rip]
	call	__fprintf_chk@PLT
.L39:
	mov	eax, 1
.L37:
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
.L38:
	.cfi_restore_state
	mov	rax, QWORD PTR 8[rsi]
	mov	rdi, QWORD PTR 16[rsi]
	mov	edx, 10
	xor	esi, esi
	mov	QWORD PTR [rsp], rax
	call	strtol@PLT
	mov	rdi, QWORD PTR 24[rbp]
	mov	edx, 10
	xor	esi, esi
	mov	DWORD PTR 16[rsp], eax
	mov	r13, rax
	call	strtol@PLT
	mov	rdi, QWORD PTR 40[rbp]
	mov	edx, 10
	xor	esi, esi
	mov	DWORD PTR 28[rsp], eax
	mov	r15, rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR 8[rsp], rax
	call	strtol@PLT
	mov	rdi, QWORD PTR 48[rbp]
	mov	edx, 10
	xor	esi, esi
	mov	DWORD PTR 24[rsp], eax
	mov	rbx, rax
	call	strtol@PLT
	mov	DWORD PTR 20[rsp], eax
	mov	r14, rax
	test	r13d, r13d
	jle	.L40
	test	r15d, r15d
	jle	.L40
	test	ebx, ebx
	jle	.L40
	test	eax, eax
	jle	.L40
	mov	edi, r13d
	imul	edi, r15d
	movsx	rdi, edi
	sal	rdi, 2
	call	malloc@PLT
	mov	edi, ebx
	imul	edi, r14d
	mov	r12, rax
	movsx	rdi, edi
	sal	rdi, 2
	call	malloc@PLT
	mov	edi, r13d
	mov	esi, 4
	imul	edi, r14d
	mov	rbp, rax
	movsx	rdi, edi
	call	calloc@PLT
	test	r12, r12
	mov	r13, rax
	sete	al
	test	rbp, rbp
	sete	dl
	or	al, dl
	jne	.L46
	test	r13, r13
	je	.L46
	mov	ecx, DWORD PTR 28[rsp]
	mov	edx, DWORD PTR 16[rsp]
	mov	rsi, r12
	mov	rdi, QWORD PTR [rsp]
	call	read_matrix
	mov	ecx, DWORD PTR 20[rsp]
	mov	edx, DWORD PTR 24[rsp]
	mov	rsi, rbp
	mov	rdi, QWORD PTR 8[rsp]
	call	read_matrix
	mov	rdx, r13
	mov	r9d, ebx
	mov	r8d, r15d
	push	rax
	.cfi_def_cfa_offset 104
	mov	rsi, rbp
	mov	rdi, r12
	push	r14
	.cfi_def_cfa_offset 112
	mov	ecx, DWORD PTR 32[rsp]
	call	matrix_multiply
	lea	rdi, .LC9[rip]
	call	puts@PLT
	mov	rdi, r12
	call	free@PLT
	mov	rdi, rbp
	call	free@PLT
	mov	rdi, r13
	call	free@PLT
	pop	rdx
	.cfi_def_cfa_offset 104
	xor	eax, eax
	pop	rcx
	.cfi_def_cfa_offset 96
	jmp	.L37
.L40:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 45
	mov	esi, 1
	lea	rdi, .LC7[rip]
	call	fwrite@PLT
	jmp	.L39
.L46:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 26
	mov	esi, 1
	lea	rdi, .LC8[rip]
	call	fwrite@PLT
	mov	rdi, r12
	call	free@PLT
	mov	rdi, rbp
	call	free@PLT
	mov	rdi, r13
	call	free@PLT
	jmp	.L39
	.cfi_endproc
.LFE42:
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
