#include <stdio.h>

extern unsigned int rdtsc(void);	// 外部関数 rdtsc の利用を宣言

int main(void)
{
	unsigned int counter = rdtsc();	// 外部関数 rdtsc の返り値を表示
	printf("%u\n", counter);
	return 0;
}
