volatile int i = 123;
volatile int j = 456;

int main(void)
{
	while (i > 0) {
		i = i - 1;
		j = j + 1;
	}
	return j;
}
