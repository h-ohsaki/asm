volatile int i, j;	// int 型の大域変数 i、j を宣言

int main(void)
{
	i = 123;
	i = i + 1;
	j = 456;
	j = i + j;
	return j;
}
