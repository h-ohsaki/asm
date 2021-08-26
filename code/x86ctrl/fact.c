volatile int i = 123;

int fact(int n)
{
	if (n == 1)
		return 1;
	else
		return n * fact(n - 1);
}

int main(void)
{
	i = fact(3);
	return i;
}
