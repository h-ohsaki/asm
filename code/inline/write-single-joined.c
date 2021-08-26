// インラインアセンブラにより write システムコールを呼び出す
char *str = "Hello, World!\n";

int main (void) {
	asm ("movl str, %ecx\n\tmovl $14, %edx\n\tmovl $4, %eax\n\tmovl $1, %ebx\n\tint $0x80");
}
