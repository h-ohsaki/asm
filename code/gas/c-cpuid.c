int main(int argc, char **argv)
{
	// CPUID 命令を実行し、exit システムコールを呼び出す機械語のプログラム
	unsigned char cpuid_code[19] = {
		0xb8, 0x01, 0x00, 0x00, 0x00, 0x0f, 0xa2, 0x89,
		0xd3, 0xc1, 0xeb, 0x18, 0xb8, 0x01, 0x00, 0x00,
		0x00, 0xcd, 0x80
	};
	// スタックに格納されているリターンアドレスを cpuid_code のアドレスに書き換える
	*(unsigned int *)(cpuid_code + 23) = (unsigned int)cpuid_code;
	// 上の細工により、main 関数からリターンする時に cpuid_code のアドレスにジャンプする
	return 0;
}
