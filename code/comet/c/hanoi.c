#include <stdio.h>

void hanoi(int n, char from, char to, char aux)
{
	if (n == 1)
		printf("%c -> %c\n", from, to);
	else {
		hanoi(n - 1, from, aux, to);
		printf("%c -> %c\n", from, to);
		hanoi(n - 1, aux, to, from);
	}
}

int main(void)
{
	hanoi(5, 'A', 'B', 'C');
	return 0;
}
