#include <stdio.h>

extern int sum_asm(void);	// 外部関数 sum_asm の利用を宣言
// 大きさ 10 の配列を宣言・初期化
int array_size = 10;
int array[10] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

int main(void)
{
	int sum = sum_asm();	// 外部関数 sum_asm の返り値を表示
	printf("sum = %d\n", sum);
	return 0;
}
