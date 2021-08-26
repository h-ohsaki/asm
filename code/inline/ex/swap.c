// インラインアセンブラで変数の値を交換するプログラム
#include <stdio.h>

int main(void)
{
	int i = 123, j = 456;
	// 2 つのレジスタの値を交換する
	asm("xchgl %0, %1"
	    : "=r" (i), "=r" (j)	// 変数 i, j の値をレジスタ経由で受け取る
	    : "0" (i), "1" (j));	// 2 つのレジスタの値を i, j の値で初期化する
	printf("i = %d, j = %d\n", i, j);
	return 0;
}
