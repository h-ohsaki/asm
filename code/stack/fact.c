#include <stdio.h>

// n の階乗 (n!) を計算する関数
int fact(int n)
{
	if (n == 1)
		return 1;
	else
		return n * fact(n - 1);
}

int main(void)
{
	int n = fact(8);
	printf("%d\n", n);
	return 0;
}
