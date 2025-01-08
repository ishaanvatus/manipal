#include <stdio.h>
int main(int argc, char **argv)
{
	FILE *fp = fopen(argv[1], "r");
	FILE *san = fopen("sanitized", "w");
	char ch;
	int lines = 0, chars = 0;
	while ((ch = fgetc(fp)) != EOF) {
		chars++;
		if (ch == '\n') {
			lines++;
		}
	}
	printf("LINES:%d\nCHARACTERS:%d\n", lines, chars);
}

