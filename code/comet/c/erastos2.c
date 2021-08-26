// エラストテネスの篩 (ふるい)
// N 以下のすべて素数を求める
#include <stdio.h>

#define N 100	// 判定する数の最大値
int A[N + 1];	// 素数であれば 0、素数でなければ 1

int main(void)
{
	register int i, j;
	for (i = 2; i <= N; i++) {
		// すでに素数でないことが判明していればスキップ
		if (A[i])
			continue;
		// 2i, 3i, 4i, ... を素数から除外する
		j = i + i;
		while (j <= N) {
			A[j] = 1;
			j += i;
		}
	}

	// 見つかった素数の一覧を表示
	for (int i = 2; i <= N; i++) {
		if (A[i] == 0)
			printf("%d\n", i);
	}
	return 0;
}
