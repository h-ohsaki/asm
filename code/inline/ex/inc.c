// インラインアセンブラで変数の値を +1 するプログラム
#include <stdio.h>

int main(void)
{
	int i = 123;
	// 変数 i の値を +1 する
	asm("incl %0"
	    : "=r" (i)		// 変数 i の値をレジスタ経由で受け取る
	    : "0" (i));		// レジスタの値を i の値で初期化する
	printf("i = %d\n", i);
	return 0;
}
