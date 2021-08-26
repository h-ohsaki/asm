// インラインアセンブラにより write システムコールを呼び出す
char *str = "Hello, World!\n";

int main (void) {
	// 複数行にわたるの文字列として記述 (冒頭のインデントはなくてもよい)
	asm ("movl str, %ecx\n\
movl $14, %edx\n\
movl $4, %eax\n\
movl $1, %ebx\n\
int $0x80");
}
