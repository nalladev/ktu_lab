#include <stdio.h>

int main() {
    int x = 1;
    int k = fork(); // Creates a new process

    if (k < 0) printf("Error\n");
    else if (k == 0) printf("Child has x = %d\n", ++x); // Child process increments x
    else {
        wait(1000); // Parent process waits for child process to finish
        printf("Parent has x = %d\n", --x); // Parent process decrements x
    }

    return 0;
}
