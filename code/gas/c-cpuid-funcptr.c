// プログラム実行中に中身を書き換えるための関数
void exec_cpuid(void)
{
	// 後から上書きできるように何らかのコードを生成する
	// コンパイル後に 19 バイト以上の機械語になれば中身は何でもよい
	int i = 1;
	i += 1;
	i += 1;
	i += 1;
	i += 1;
}

int main(int argc, char **argv)
{
	// CPUID 命令を実行し、exit システムコールを呼び出す機械語のプログラム
	unsigned char cpuid_code[19] = {
		0xb8, 0x01, 0x00, 0x00, 0x00, 0x0f, 0xa2, 0x89,
		0xd3, 0xc1, 0xeb, 0x18, 0xb8, 0x01, 0x00, 0x00,
		0x00, 0xcd, 0x80
	};
	// exec_cpuid の先頭から 19 バイトに機械語のプログラムを書き込む
	for (int i = 0; i < 19; i++)
		*((unsigned char *)exec_cpuid + i) = cpuid_code[i];
	// 関数 exec_cpuid を呼び出せば機械語のプログラムが実行される
	exec_cpuid();
	return 0;
}
