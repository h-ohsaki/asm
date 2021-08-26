// C 言語の関数ポインタを使って任意の機械語プログラムを実行するサンプル
int main(int argc, char **argv)
{
	// CPUID 命令を実行し、exit システムコールを呼び出す機械語のプログラム
	unsigned char cpuid_code[19] =
	    { 0xb8, 0x01, 0x00, 0x00, 0x00, 0x0f, 0xa2, 0x89,
		0xd3, 0xc1, 0xeb, 0x18, 0xb8, 0x01, 0x00, 0x00,
		0x00, 0xcd, 0x80
	};
	// アドレス cpuid_code を関数ポインタへ型キャストする
	void (*func_ptr) (void) = (void *)cpuid_code;
	// 関数ポインタ func_ptr の呼び出し
	func_ptr();
	return 0;
}
