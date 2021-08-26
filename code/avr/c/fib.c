// フィボナッチ数列を計算する
// f(0) = 0, f(1) = 1, f(n)= f(n-1) + f(n-2)

asm("rjmp _start");		// リセット時のジャンプテーブル

char fib(char n)
{
	if (n == 0)
		return 0;
	if (n == 1)
		return 1;
	return fib(n - 1) + fib(n - 2);
}

void _start(void)
{
	asm("ldi r16, 0x9f\n\t"	// スタックポインタを初期化
	    "out __SP_L__, r16");
	fib(10);
	asm("loop: rjmp loop");	// 自分自身に相対ジャンプ
}
