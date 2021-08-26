#include <stdio.h>

int main(void)
{
	int i = 123;
	// 変数 i の値を 10 倍する
	asm("imull $10, %0" : "=r"(i) : "0"(i));
	printf("i = %d\n", i);
	return 0;
}
