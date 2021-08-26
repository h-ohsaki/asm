// 拡張 asm 文のサンプル (変数への出力のみを利用)
#include <stdio.h>

int main(void)
{
	int i;
	asm("movl $123, %0"	// レジスタ %0 に 123 を格納する
	    : "=r" (i));	// i の値をレジスタ %0 経由で受け取る
	printf("i=%d\n", i);

	asm("movl $456, %%eax"	// EAX レジスタに 123 を格納する (% は %% と表記)
	    : "=a" (i));	// i の値をレジスタ EAX 経由で受け取る
	printf("i=%d\n", i);

	asm("movl $789, %0"	// アドレス %0 に 123 を格納する
	    : "=m" (i));	// i の値をアドレス %0 経由で受け取る
	printf("i=%d\n", i);
	return 0;
}
