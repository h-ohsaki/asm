	.global _start
	.text
_start:	
	movl	$123, %eax     # EAX に 123 を格納
	cmpl	$456, %eax     # EAX は 456 か？
	je	L1             # もしそうなら L1 にジャンプ
	movl	$msg_neq, %ecx # ECX に msg_neq のアドレスを格納
	movl	$10, %edx      # 10 文字
	jmp	L2	       # L2 にジャンプ
L1:	
	movl	$msg_eq, %ecx  # ECX に msg_eq のアドレスを格納
	movl	$6, %edx       # 6 文字
L2:	
	movl	$4, %eax       # システムコール 4 番は write 
	movl	$1, %ebx       # 標準出力 (1)
	int	$0x80          # システムコール呼び出し
	
	movl	$1,%eax        # 1 番は exit
	int	$0x80          # システムコール呼び出し
	
	.data
msg_eq:	.ascii	"equal\n"
msg_neq:.ascii	"not equal\n"
