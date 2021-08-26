#include <stdio.h>

extern unsigned int rdtsc(void);	// 外部関数 rdtsc の利用を宣言
extern int strlen_asm(char *str);	// 外部関数 strlen_asm の利用を宣言
extern int strlen_asm2(char *str);	// 外部関数 strlen_asm2 の利用を宣言

#define STRLEN 10000	// 文字列の長さ
char str[STRLEN + 1];

// C 言語で実装した strlen 関数
int strlen_c(char *str)
{
	char *p = str;
	while (*p++ != '\0')	// p ← 終端文字のアドレス + 1
		;
	return p - str - 1;	// 文字列長 = 終端文字のアドレス - 開始アドレス - 1
}

int main(void)
{
	// 文字列 str を初期化する
	for (int i = 0; i < STRLEN; i++)
		str[i] = '*';
	str[STRLEN] = '\0';

	unsigned int last = rdtsc();
	unsigned int c1 = rdtsc() - last;

	last = rdtsc();
	strlen_c(str);		// C 言語で実装した strlen の呼び出し
	unsigned int c2 = rdtsc() - last;

	last = rdtsc();
	strlen_asm(str);	// アセンブリ言語で実装した strlen の呼び出し
	unsigned int c3 = rdtsc() - last;

	last = rdtsc();
	strlen_asm2(str);	// アセンブリ言語で実装した strlen の呼び出し
	unsigned int c4 = rdtsc() - last;
	printf("%u %u %u %u\n", c1, c2, c3, c4);
	return 0;
}
