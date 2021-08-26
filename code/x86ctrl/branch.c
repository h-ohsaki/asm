volatile int i = 123;
volatile int j = 456;

int main(void)
{
	if (i == 123)
		j = j + 1;
	else
		j = j - 1;
	return j;
}
