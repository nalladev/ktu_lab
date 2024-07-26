#include <stdio.h>

int main() {
    int x = 1;
    int pid = fork(); // Creates a new process

    if (pid == 0) printf("Process id of Child = %d\n", getpid()); // Child process prints its PID
    else printf("Process id of parent = %d\n", getppid()); // Parent process prints its parent's PID

    return 0;
}
