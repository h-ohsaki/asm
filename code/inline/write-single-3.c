// インラインアセンブラにより write システムコールを呼び出す
char *str = "Hello, World!\n";

int main (void) {
	// GAS の文をセミコロン (;) で区切って記述 (i386 の場合)
	// 区切文字や、その使用の可否は対象となるコンピュータによって異なる
	asm ("movl str, %ecx; movl $14, %edx; movl $4, %eax; movl $1, %ebx; int $0x80");
}
