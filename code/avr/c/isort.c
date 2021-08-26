// 挿入ソート
#define N 10			// 配列の要素数
volatile char a[N];

void _start(void)
{
	a[0] = 3;
	a[1] = 8;
	a[2] = 7;
	a[3] = 2;
	a[4] = 6;
	a[5] = 9;
	a[6] = 10;
	a[7] = 5;
	a[8] = 4;
	a[9] = 1;

	register char i = 1;
	while (i < N) {
		// a[i] をソート済みの配列 a[0] .. a[i - 1] に挿入する
		register char j = i;
		while (j > 0 && a[j - 1] > a[j]) {
			// a[j] と a[j - 1] を交換する
			register char tmp = a[j];
			a[j] = a[j - 1];
			a[j - 1] = tmp;
			j = j - 1;
		}
		i = i + 1;
	}
	asm("loop: rjmp loop");	// 自分自身に相対ジャンプ
}
