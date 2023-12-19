	.file	"mem.c"
	.text
	.section	.rodata
.LC0:
	.string	"common.h"
.LC1:
	.string	"rc == 0"
	.text
	.globl	GetTime
	.type	GetTime, @function
GetTime:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	-32(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	gettimeofday@PLT
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.L2
	leaq	__PRETTY_FUNCTION__.1(%rip), %rax
	movq	%rax, %rcx
	movl	$11, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L2:
	movq	-32(%rbp), %rax
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
	movq	-24(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC2(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movq	%xmm0, %rax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	movq	%rax, %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	GetTime, .-GetTime
	.globl	Spin
	.type	Spin, @function
Spin:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movl	$0, %eax
	call	GetTime
	movq	%xmm0, %rax
	movq	%rax, -8(%rbp)
	nop
.L6:
	movl	$0, %eax
	call	GetTime
	movq	%xmm0, %rax
	movq	%rax, %xmm1
	subsd	-8(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2sdl	-20(%rbp), %xmm0
	comisd	%xmm1, %xmm0
	ja	.L6
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	Spin, .-Spin
	.section	.rodata
.LC3:
	.string	"mem.c"
.LC4:
	.string	"p != NULL"
	.align 8
.LC5:
	.string	"(%d) address pointed to by p: %p\n"
.LC6:
	.string	"(%d) p: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	$4, %edi
	call	malloc@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L8
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	leaq	.LC3(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L8:
	call	getpid@PLT
	movl	%eax, %ecx
	movq	-24(%rbp), %rax
	movq	%rax, %rdx
	movl	%ecx, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-24(%rbp), %rax
	movl	$0, (%rax)
.L9:
	movl	$1, %edi
	call	Spin
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	movq	-24(%rbp), %rax
	movl	(%rax), %ebx
	call	getpid@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	jmp	.L9
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.1, @object
	.size	__PRETTY_FUNCTION__.1, 8
__PRETTY_FUNCTION__.1:
	.string	"GetTime"
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 5
__PRETTY_FUNCTION__.0:
	.string	"main"
	.align 8
.LC2:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 13.2.0-4ubuntu3) 13.2.0"
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
