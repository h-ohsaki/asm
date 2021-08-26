#include <stdio.h>

void hanoi(int n, int from, int to, int aux)
{
	if (n == 1)
		printf("%d -> %d\n", from, to);
	else {
		hanoi(n - 1, from, aux, to);
		printf("%d -> %d\n", from, to);
		hanoi(n - 1, aux, to, from);
	}
}

int main(void)
{
	hanoi(5, 100, 200, 300);
	return 0;
}
