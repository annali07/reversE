	.file	"dowhile.c"
	.text
	.globl	dw_loop
	.type	dw_loop, @function
dw_loop:
.LFB0:
	.cfi_startproc
	endbr64
	movl	%edi, %edx
	movswl	%di, %ecx
	imull	$7282, %ecx, %ecx
	shrl	$16, %ecx
	movl	%edi, %eax
	sarw	$15, %ax
	subl	%eax, %ecx
	sall	$2, %edi
.L2:
	leal	5(%rcx,%rdx), %edx
	leal	-2(%rdi), %eax
	movl	%eax, %edi
	testw	%ax, %ax
	jg	.L2
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	dw_loop, .-dw_loop
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
