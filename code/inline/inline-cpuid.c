// GCC のインラインアセンブラによる CPUID の取得
#include <stdio.h>

int main(void)
{
	unsigned int eax, ebx, ecx, edx;
	asm("cpuid"		// CPUID を取得 (レジスタ EAX が種別)
	    : "=a" (eax), "=b" (ebx), "=c" (ecx), "=d" (edx)	// 出力: EAX〜EDX
	    : "a" (1));		// 入力: EAX ← 1
	printf("%u %u %u %u\n", eax, ebx, ecx, edx);
	return 0;
}
