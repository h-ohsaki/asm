volatile int sum;		// 静的変数 sum を宣言

void _start(void)
{
	asm("eor __zero_reg__, __zero_reg__");	// R1 をゼロで初期化
	sum = 0;		// 0 で初期化
	for (int i = 1; i <= 100; i++) {
		sum += i;	// 変数 sum に i を加算
	}
	asm("loop: rjmp loop");	// 自分自身に相対ジャンプ
}
