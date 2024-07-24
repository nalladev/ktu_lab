#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
#include<stdlib.h>
int main()
  {
   int pid=fork();
   printf("process created");
	(execl("/bin/date","NULL"));
   printf("execl executed");	
    return(0);
  }
