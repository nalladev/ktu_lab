#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
#include<stdlib.h>

int main() {

  int pid = fork(); // Creates a new process 
  printf("Process created\n");

  (execl("/bin/date", "NULL")); // Replaces the current process with the "date" command

  printf("execl executed\n");

  return(0);
}
