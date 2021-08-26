// 挿入ソート
#define N 10	// 配列の要素数
int a[] = { 3, 8, 7, 2, 6, 9, 10, 5, 4, 1 };

int main(void)
{
	int i = 1;
	while (i < N) {
		// a[i] をソート済みの配列 a[0] .. a[i - 1] に挿入する
		int j = i;
		while (j > 0 && a[j - 1] > a[j]) {
			// a[j] と a[j - 1] を交換する
			int tmp = a[j];
			a[j] = a[j - 1];
			a[j - 1] = tmp;
			j = j - 1;
		}
		i = i + 1;
	}
	return 0;
}
