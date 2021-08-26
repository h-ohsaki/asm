	.global _start
	.text
_start:	
	movl	$123, %eax
1:	
	cmpl	$456, %eax
	je	1f             # 直後の局所ラベル 1 を意味する
	movl	$msg_neq, %ecx
	movl	$10, %edx
	jmp	2f             # 直後の局所ラベル 2 を意味する
1:	                       # 局所ラベル 1
	movl	$msg_eq, %ecx
	movl	$6, %edx
2:	                       # 局所ラベル 2
	movl	$4, %eax
	movl	$1, %ebx
	int	$0x80
1:	
	movl	$1,%eax
	int	$0x80
2:	
	.data
msg_eq:	.ascii	"equal\n"
msg_neq:.ascii	"not equal\n"
