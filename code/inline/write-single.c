// インラインアセンブラにより write システムコールを呼び出す
char *str = "Hello, World!\n";

int main (void) {
	asm ("movl str, %ecx\n\t"	// ECX ← 文字列のアドレス
	     "movl $14, %edx\n\t"	// EDX ← 文字列の長さ
	     "movl $4, %eax\n\t"	// システムコール 4 番は write
	     "movl $1, %ebx\n\t"	// 標準出力 (1)
	     "int $0x80");		// システムコール呼び出し
}
