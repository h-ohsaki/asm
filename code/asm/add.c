volatile int i = 123;	// 大域変数 i を宣言し、123 で初期化

int main(void)
{
	i = i + 456;	// 変数 i に 456 を加算
	return 0;
}
