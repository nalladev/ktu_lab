#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    printf("Main pgm executing\n");

    char* args[] = { "Hello", "C", "Programming", NULL };

    execv("./hello", args);

    printf("Back to main pgm\n");

    return 0;
}
