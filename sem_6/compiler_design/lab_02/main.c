#include "lexer.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

int main(int argc, char **argv)
{
	char *filename = argv[1];
	char *cleaned = "sanitized";
	remove_whitespace(filename, cleaned);
	remove_preprocessor(cleaned, "no_pre");
    regurge_keywords("no_pre", "keywords_present");
	return 0;
}
