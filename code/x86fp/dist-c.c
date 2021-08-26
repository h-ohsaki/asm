#include <math.h>

int main(void)
{
	double x = 1.23;
	double y = -4.56;
	volatile double dist = sqrt(x * x + y * y);
	return 0;
}
