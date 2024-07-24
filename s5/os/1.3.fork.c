#include <stdio.h>
int main()
{
    int x = 1;
    int k=fork();
    if(k<0)
	printf("error");
    else if (k == 0)
    {
        printf("Child has x = %d\n", ++x);
       
    }
    else
    {
        wait(1000);
        printf("Parent has x = %d\n", --x);
         
    }
    return 0;
}
