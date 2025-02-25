	.intel_syntax noprefix

	.data

MYBYTES:    
	.quad 0xdeadbeefdeadbeef
	
	.text
	
	.global _start

_start:
	xor rax, rax
	xor rbx, rbx

	mov rax, OFFSET [MYBYTES]

	
BYTES:
	mov rbx, BYTE PTR[MYBYTES]
	mov rbx, BYTE PTR[MYBYTES + 1]
	mov rbx, BYTE PTR[MYBYTES + 2]
	mov rbx, BYTE PTR[MYBYTES + 3]
	mov rbx, BYTE PTR[MYBYTES + 4]
	mov rbx, BYTE PTR[MYBYTES + 5]
	mov rbx, BYTE PTR[MYBYTES + 6]
	mov rbx, BYTE PTR[MYBYTES + 7]

WORDS:
	mov rbx, WORD PTR[MYBYTES]
	mov rbx, WORD PTR[MYBYTES + 2]
	mov rbx, WORD PTR[MYBYTES + 4]
	mov rbx, WORD PTR[MYBYTES + 6]

DWORDS:
	mov rbx, DWORD PTR[MYBYTES]
	mov rbx, DWORD PTR[MYBYTES + 4]

QWORD:
	mov rbx, QWORD PTR[MYBYTES]

	int3
	