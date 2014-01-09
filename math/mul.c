#include <stdio.h>
int main(void)
{
	signed int a, b;
	a=5,b=25;
	mymul(&a,&b);
	printf("\nresult=%d",b);
	return 0;
}
