// GCC のインラインアセンブラによる TSC の取得
#include <stdio.h>

int main(void)
{
	unsigned int low, high;
	asm("rdtscp"		// TSC (Time Stamp Clock) を EDX:EAX に取得
	    : "=a" (low), "=d" (high)	// 出力: EAX → low、EDX → high
	    : 			// 入力: なし
	    : "ecx");		// ECX レジスタを破壊する
	printf("%u %u\n", high, low);
	return 0;
}
