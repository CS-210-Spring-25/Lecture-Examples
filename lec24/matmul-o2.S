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
	sub	rsp, 24
	.cfi_def_cfa_offset 80
	mov	r12d, DWORD PTR 80[rsp]
	cmp	r8d, r9d
	jne	.L9
	test	r12d, r12d
	jle	.L8
	mov	rbp, rdx
	mov	r13d, ecx
	mov	r11d, r8d
	xor	edx, edx
	xor	eax, eax
	movsx	r15, r8d
	test	ecx, ecx
	jle	.L8
	mov	QWORD PTR 8[rsp], rsi
	mov	rbx, rdi
	.p2align 4,,10
	.p2align 3
.L11:
	mov	rsi, QWORD PTR 8[rsp]
	mov	DWORD PTR [rsp], edx
	movsx	rcx, edx
	mov	r10d, eax
	mov	DWORD PTR 4[rsp], eax
	xor	r9d, r9d
	xor	r8d, r8d
	lea	r14, [rsi+rcx*4]
	.p2align 4,,10
	.p2align 3
.L17:
	test	r11d, r11d
	jle	.L16
	movsx	rax, r10d
	movsx	rdx, r9d
	mov	rcx, r14
	lea	rdi, [rbx+rax*4]
	lea	rax, 0[rbp+rdx*4]
	add	rdx, r15
	lea	rsi, 0[rbp+rdx*4]
	.p2align 4,,10
	.p2align 3
.L13:
	mov	edx, DWORD PTR [rdi]
	imul	edx, DWORD PTR [rcx]
	add	rcx, 4
	add	DWORD PTR [rax], edx
	add	rax, 4
	cmp	rsi, rax
	jne	.L13
.L16:
	add	r8d, 1
	add	r9d, r12d
	add	r10d, r11d
	cmp	r13d, r8d
	jne	.L17
	mov	eax, DWORD PTR 4[rsp]
	mov	edx, DWORD PTR [rsp]
	add	eax, 1
	add	edx, r12d
	cmp	r12d, eax
	jne	.L11
.L8:
	add	rsp, 24
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
.L9:
	.cfi_restore_state
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
	jle	.L24
	mov	r12d, edx
	xor	r14d, r14d
	lea	rbp, .LC5[rip]
	xor	r13d, r13d
	.p2align 4,,10
	.p2align 3
.L26:
	test	r12d, r12d
	jle	.L29
	mov	rcx, QWORD PTR 8[rsp]
	movsx	rdx, r14d
	movsx	rax, r12d
	add	rax, rdx
	lea	r15, [rcx+rdx*4]
	lea	rbx, [rcx+rax*4]
	.p2align 4,,10
	.p2align 3
.L27:
	mov	edx, DWORD PTR [r15]
	mov	rsi, rbp
	mov	edi, 2
	xor	eax, eax
	add	r15, 4
	call	__printf_chk@PLT
	cmp	r15, rbx
	jne	.L27
.L29:
	mov	edi, 10
	add	r13d, 1
	add	r14d, r12d
	call	putchar@PLT
	cmp	DWORD PTR 4[rsp], r13d
	jne	.L26
.L24:
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
	je	.L33
	mov	rcx, QWORD PTR [rsi]
	mov	rdi, QWORD PTR stderr[rip]
	mov	esi, 2
	xor	eax, eax
	lea	rdx, .LC6[rip]
	call	__fprintf_chk@PLT
.L34:
	mov	eax, 1
.L32:
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
.L33:
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
	jle	.L35
	test	r15d, r15d
	jle	.L35
	test	ebx, ebx
	jle	.L35
	test	eax, eax
	jle	.L35
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
	jne	.L41
	test	r13, r13
	je	.L41
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
	jmp	.L32
.L35:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 45
	mov	esi, 1
	lea	rdi, .LC7[rip]
	call	fwrite@PLT
	jmp	.L34
.L41:
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
	jmp	.L34
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
