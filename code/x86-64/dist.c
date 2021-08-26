#include <math.h>
double x = 1.23;
double y = -4.56;

int main(void)
{
	volatile double dist = sqrt(x * x + y * y);
	return 0;
}
