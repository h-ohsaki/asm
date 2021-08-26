volatile long long int i, j;

int main(void)
{
	i = 123;
	i = i + 1;
	j = 456;
	j = i + j;
	return j;
}
