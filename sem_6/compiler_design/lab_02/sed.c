#include <stdio.h>
#include <stdbool.h>

int main(int argc, char **argv)
{
	char ch, *output_file = "sanitized";
	bool flag = false;
	FILE *fp = fopen(argv[1], "r");
	FILE *san = fopen(output_file, "w");
	while ((ch = getc(fp)) != EOF) {
		if ((ch == SPACE || ch == TAB) && !flag) {
			putc(SPACE, san);
			flag = true;
		}
		else if ((ch == SPACE || ch == TAB) && flag)
			continue;
		else {
			putc(ch, san);
			flag = false;
		}
	}
}
