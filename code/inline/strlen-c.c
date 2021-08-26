#include <stdio.h>
#include <string.h>

extern unsigned int rdtsc(void);	// 外部関数 rdtsc の利用を宣言

#define STRLEN 10000	// 文字列の長さ
char str[STRLEN + 1];

int main(void)
{
	// 文字列 str を初期化する
	for (int i = 0; i < STRLEN; i++)
		str[i] = '*';
	str[STRLEN] = '\0';

	unsigned int last = rdtsc();
	volatile int n = strlen(str);	// 標準ライブラリの関数 strlen の呼び出し
	unsigned int c1 = rdtsc() - last;
	printf("%u\n", c1);
	return 0;
}
