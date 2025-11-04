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
	.text
	.globl	read_matrix
	.type	read_matrix, @function
read_matrix:
.LFB39:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	r12, rdi
	mov	r13, rsi
	mov	ebx, edx
	mov	r14d, ecx
	lea	rsi, .LC0[rip]
	call	fopen@PLT
	test	rax, rax
	je	.L5
	mov	rbp, rax
	imul	ebx, r14d
	movsx	rbx, ebx
	mov	rcx, rax
	mov	rdx, rbx
	mov	esi, 4
	mov	rdi, r13
	call	fread@PLT
	cmp	rbx, rax
	jne	.L6
	mov	rdi, rbp
	call	fclose@PLT
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	lea	rdi, .LC1[rip]
	call	perror@PLT
	mov	edi, 1
	call	exit@PLT
.L6:
	mov	rcx, r12
	lea	rdx, .LC2[rip]
	mov	esi, 2
	mov	rdi, QWORD PTR stderr[rip]
	mov	eax, 0
	call	__fprintf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE39:
	.size	read_matrix, .-read_matrix
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Matrix dimensions do not allow multiplication.\n"
	.text
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
	jne	.L8
	mov	rbx, rdi
	mov	rbp, rdx
	mov	r13d, ecx
	mov	r11d, r8d
	test	r12d, r12d
	jle	.L7
	mov	edx, 0
	mov	eax, 0
	movsx	r15, r8d
	mov	QWORD PTR 8[rsp], rsi
	jmp	.L10
.L8:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 47
	mov	esi, 1
	lea	rdi, .LC3[rip]
	call	fwrite@PLT
	mov	edi, 1
	call	exit@PLT
.L13:
	movsx	rax, r10d
	lea	rdi, [rbx+rax*4]
	movsx	rdx, r9d
	lea	rax, 0[rbp+rdx*4]
	add	rdx, r15
	lea	rsi, 0[rbp+rdx*4]
	mov	rcx, r14
.L11:
	mov	edx, DWORD PTR [rdi]
	imul	edx, DWORD PTR [rcx]
	add	DWORD PTR [rax], edx
	add	rax, 4
	add	rcx, 4
	cmp	rax, rsi
	jne	.L11
.L14:
	add	r8d, 1
	add	r9d, r12d
	add	r10d, r11d
	cmp	r13d, r8d
	je	.L17
.L15:
	test	r11d, r11d
	jg	.L13
	jmp	.L14
.L17:
	mov	eax, DWORD PTR [rsp]
	mov	edx, DWORD PTR 4[rsp]
.L12:
	add	eax, 1
	add	edx, r12d
	cmp	r12d, eax
	je	.L7
.L10:
	test	r13d, r13d
	jle	.L12
	mov	r10d, eax
	movsx	rcx, edx
	mov	rsi, QWORD PTR 8[rsp]
	lea	r14, [rsi+rcx*4]
	mov	r9d, 0
	mov	r8d, 0
	mov	DWORD PTR [rsp], eax
	mov	DWORD PTR 4[rsp], edx
	jmp	.L15
.L7:
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
.LFE40:
	.size	matrix_multiply, .-matrix_multiply
	.section	.rodata.str1.1
.LC4:
	.string	"%d "
	.text
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
	jle	.L19
	mov	r13d, edx
	mov	r15d, 0
	mov	r14d, 0
	lea	r12, .LC4[rip]
	jmp	.L21
.L23:
	movsx	rdx, r15d
	mov	rcx, QWORD PTR 8[rsp]
	lea	rbx, [rcx+rdx*4]
	movsx	rax, r13d
	add	rax, rdx
	lea	rbp, [rcx+rax*4]
.L22:
	mov	edx, DWORD PTR [rbx]
	mov	rsi, r12
	mov	edi, 2
	mov	eax, 0
	call	__printf_chk@PLT
	add	rbx, 4
	cmp	rbx, rbp
	jne	.L22
.L24:
	mov	edi, 10
	call	putchar@PLT
	add	r14d, 1
	add	r15d, r13d
	cmp	DWORD PTR 4[rsp], r14d
	je	.L19
.L21:
	test	r13d, r13d
	jg	.L23
	jmp	.L24
.L19:
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
.LC5:
	.string	"Usage: %s <matrix1.bin> <rows1> <cols1> <matrix2.bin> <rows2> <cols2>\n"
	.align 8
.LC6:
	.string	"Matrix dimensions must be positive integers.\n"
	.section	.rodata.str1.1
.LC7:
	.string	"Memory allocation failed.\n"
.LC8:
	.string	"Resultant Matrix:"
	.text
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
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	mov	rbp, rsi
	cmp	edi, 7
	je	.L28
	mov	rcx, QWORD PTR [rsi]
	lea	rdx, .LC5[rip]
	mov	esi, 2
	mov	rdi, QWORD PTR stderr[rip]
	mov	eax, 0
	call	__fprintf_chk@PLT
	mov	eax, 1
.L27:
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
.L28:
	.cfi_restore_state
	mov	r15, QWORD PTR 8[rsi]
	mov	rdi, QWORD PTR 16[rsi]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	mov	rbx, rax
	mov	DWORD PTR 8[rsp], eax
	mov	rdi, QWORD PTR 24[rbp]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	mov	r12, rax
	mov	DWORD PTR 20[rsp], eax
	mov	r14, QWORD PTR 32[rbp]
	mov	rdi, QWORD PTR 40[rbp]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	mov	r13, rax
	mov	DWORD PTR 16[rsp], eax
	mov	rdi, QWORD PTR 48[rbp]
	mov	edx, 10
	mov	esi, 0
	call	strtol@PLT
	mov	rbp, rax
	mov	DWORD PTR 12[rsp], eax
	test	ebx, ebx
	jle	.L30
	test	r12d, r12d
	jle	.L30
	test	r13d, r13d
	jle	.L30
	test	eax, eax
	jle	.L30
	mov	edi, ebx
	imul	edi, r12d
	movsx	rdi, edi
	sal	rdi, 2
	call	malloc@PLT
	mov	QWORD PTR [rsp], rax
	mov	edi, r13d
	imul	edi, ebp
	movsx	rdi, edi
	sal	rdi, 2
	call	malloc@PLT
	mov	QWORD PTR 24[rsp], rax
	imul	ebx, ebp
	movsx	rdi, ebx
	mov	esi, 4
	call	calloc@PLT
	mov	rbx, rax
	cmp	QWORD PTR [rsp], 0
	sete	al
	cmp	QWORD PTR 24[rsp], 0
	sete	dl
	or	al, dl
	jne	.L35
	test	rbx, rbx
	je	.L35
	mov	ecx, DWORD PTR 20[rsp]
	mov	edx, DWORD PTR 8[rsp]
	mov	rsi, QWORD PTR [rsp]
	mov	rdi, r15
	call	read_matrix
	mov	ecx, DWORD PTR 12[rsp]
	mov	edx, DWORD PTR 16[rsp]
	mov	r15, QWORD PTR 24[rsp]
	mov	rsi, r15
	mov	rdi, r14
	call	read_matrix
	sub	rsp, 8
	.cfi_def_cfa_offset 104
	push	rbp
	.cfi_def_cfa_offset 112
	mov	r9d, r13d
	mov	r8d, r12d
	mov	ecx, DWORD PTR 24[rsp]
	mov	rdx, rbx
	mov	rsi, r15
	mov	r14, QWORD PTR 16[rsp]
	mov	rdi, r14
	call	matrix_multiply
	lea	rdi, .LC8[rip]
	call	puts@PLT
	mov	rdi, r14
	call	free@PLT
	mov	rdi, r15
	call	free@PLT
	mov	rdi, rbx
	call	free@PLT
	add	rsp, 16
	.cfi_def_cfa_offset 96
	mov	eax, 0
	jmp	.L27
.L30:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 45
	mov	esi, 1
	lea	rdi, .LC6[rip]
	call	fwrite@PLT
	mov	eax, 1
	jmp	.L27
.L35:
	mov	rcx, QWORD PTR stderr[rip]
	mov	edx, 26
	mov	esi, 1
	lea	rdi, .LC7[rip]
	call	fwrite@PLT
	mov	rdi, QWORD PTR [rsp]
	call	free@PLT
	mov	rdi, QWORD PTR 24[rsp]
	call	free@PLT
	mov	rdi, rbx
	call	free@PLT
	mov	eax, 1
	jmp	.L27
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
