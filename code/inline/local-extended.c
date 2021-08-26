#include <stdio.h>

int main(void)
{
	// 局所変数 str の宣言・初期化
	char str[] = "Hello, World!\n";
	asm("movb $'o, 1(%0)\n\t"	// 2 文字目を o に書き換え
	    "movb $'a, 4(%0)"		// 5 文字目を a に書き換え
	    :
	    : "r"(str));
	printf(str);
	return 0;
}
