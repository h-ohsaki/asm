volatile int i;			// 静的変数 i を宣言

void _start(void)
{
	i = 12;			// i を 12 で初期化
	i = i + 34;		// 変数 i に 34 を加算
	asm("loop: rjmp loop");	// 自分自身に相対ジャンプ
}
