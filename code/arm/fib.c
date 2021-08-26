// フィボナッチ数列を計算する
// f(0) = 0, f(1) = 1, f(n)= f(n-1) + f(n-2)

int fib(int n)
{
	if (n == 0)
		return 0;
	if (n == 1)
		return 1;
	return fib(n - 1) + fib(n - 2);
}

int main(void)
{
	int n = fib(10);
	return 0;
}
