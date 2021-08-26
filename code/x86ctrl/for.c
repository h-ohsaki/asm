volatile int i = 123;
volatile int j = 456;

int main(void)
{
	for (i = 0; i <= 4; i++)
		j = j - 1;
	return j;
}
