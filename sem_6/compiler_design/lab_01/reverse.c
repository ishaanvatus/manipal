#include <stdio.h>
int main(int argc, char **argv) 
{
	FILE *fp = fopen(argv[1], "r");
	FILE *rv = fopen("reversed", "w");
	int chars = 0;
	char ch;
	while ((ch = getc(fp)) != EOF) {
		chars++;
	}
	while (chars > 0) {
		fseek(fp, -1, SEEK_CUR); // read backwards
		ch = getc(fp);
		fseek(fp, -1, SEEK_CUR); // fix offset
		putc(ch, rv);
		chars--;
	}

}
