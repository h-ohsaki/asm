#include <stdio.h>

char *_str;	// インラインアセンブラから参照できる大域変数

int main(void)
{
	// 局所変数 str の宣言・初期化
	char str[] = "Hello, World!\n";
	_str = str;			// 文字列のアドレスを大域変数に格納
	asm("movl _str, %edx\n\t"	// 文字列のアドレスを取得
	    "movb $'o, 1(%edx)\n\t"	// 2 文字目を o に書き換え
	    "movb $'a, 4(%edx)");	// 5 文字目を a に書き換え
	printf(str);
	return 0;
}
