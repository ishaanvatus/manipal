#include <stdio.h>
int main(int argc, char **argv) 
{
	FILE *src0 = fopen(argv[1], "r");
	FILE *src1 = fopen(argv[2], "r");
	FILE *dst = fopen("spliced", "w");
	char ch;
	int flag = 0;
	int ended = -1;
	while (1) {
		if (flag) {
			ch = getc(src1);
			if (ch == EOF) {
				ended = 1;
				break;
			}
			else if (ch == '\n') {
				fputc(ch, dst);
				flag = !flag;
				continue;
			}
			else
				fputc(ch, dst);
		}
		else {
			ch = getc(src0);
			if (ch == EOF) {
				ended = 0;
				break;
			}
			else if (ch == '\n') {
				fputc(ch, dst);
				flag = !flag;
				continue;
			}
			else
				fputc(ch, dst);
		}
	}
	if (ended == 1) {
		while ((ch = getc(src0)) != EOF)
			putc(ch, dst);
	}
	else if (ended == 0) {
		while ((ch = getc(src1)) != EOF)
			putc(ch, dst);
	}
}
