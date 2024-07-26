#include<stdio.h>
#include<sys/stat.h>

int main() {
	struct stat fileStat;
	stat("hello.c", &fileStat); // Gets file status for "hello.c"

	printf("User ID: %d\n", fileStat.st_uid);
	printf("Block Size: %d\n", fileStat.st_blksize);
	printf("No. Of Blocks: %d\n", fileStat.st_blocks);
	printf("Size of Files: %d\n", fileStat.st_size);
	printf("No of Links: %d\n", fileStat.st_nlink);

	printf("Access permission is ");
	printf((fileStat.st_mode & S_IROTH) ? "r" : "-");
	printf((fileStat.st_mode & S_IWOTH) ? "w" : "-");
	printf((fileStat.st_mode & S_IWOTH) ? "x" : "-");
	printf("\n");

	return 0;
}
