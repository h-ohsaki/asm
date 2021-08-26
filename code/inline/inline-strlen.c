// GCC のインラインアセンブラによる strlen の実装
#include <stdio.h>
#include <string.h>

#define STRLEN 10000		// 文字列の長さ
char str[STRLEN + 1];

unsigned int rdtsc(void)
{
	unsigned int high, low;
	asm("rdtscp"		// TSC (Time Stamp Clock) を EDX:EAX に取得
	    : "=a" (low), "=d" (high)	// 出力: EAX → low、EDX → high
	    :				// 入力: なし
	    : "ecx");			// レジスタ ECX を破壊する
	return low;
}

int strlen_asm(char *str)
{
	int l;
	asm("movl $0, %%eax\n\t"	// EAX ← 文字列長
	    "movb $0, %%cl\n\t"	// CL ← 終端文字
	    "L1: cmpb %%cl, (%%edx)\n\t"	// (EDX) が終端文字か?
	    "je L2\n\t"		// Yes なら L2 にジャンプ
	    "inc %%eax\n\t"	// 文字列長を + 1
	    "inc %%edx\n\t"	// str のアドレスを + 1
	    "jmp L1\n\t"	// L1 に戻る
	    "L2:"
	    : "=a" (l)		// 出力: レジスタ EAX → l
	    : "d" (str)		// 入力: レジスタ EDX ← str
	    : "ecx");		// ECX レジスタを破壊する
	return l;
}

int main(void)
{
	// 文字列 str を初期化
	for (int i = 0; i < STRLEN; i++)
		str[i] = '*';
	str[STRLEN] = '\0';

	unsigned int last = rdtsc();
	int l = strlen(str);
	unsigned int c = rdtsc() - last;	// 経過クロック数の取得
	printf("%d %u\n", l, c);
	return 0;
}
