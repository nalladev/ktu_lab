#include<stdio.h>
#include<sys/stat.h>

int main()
	{
		struct stat buf;
		stat("hello.c",&buf);
		printf("User ID:\t%d\n", buf.st_uid);
		printf("Block Size:\t%d\n", buf.st_blksize);
		printf("No. Of Blocks:\t%d\n", buf.st_blocks);
		printf("Size of Files:\t%d\n", buf.st_size);
		printf("No of Links:\t%d\n", buf.st_nlink);
		printf("Access permission is ");
		printf((buf.st_mode &S_IROTH)?"r":"-");
		printf((buf.st_mode &S_IWOTH)?"w":"-");
		printf((buf.st_mode &S_IWOTH)?"x":"-");
		printf("\n");
		return 0;
	}
