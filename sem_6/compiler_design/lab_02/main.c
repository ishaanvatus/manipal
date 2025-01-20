#include "lexer.h"
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

void main(int argc, char **argv)
{
	char *filename = argv[1];
	remove_whitespace(filename, "sanitized");
	remove_preprocessor("sanitized", "no_pre");
    regurge_keywords("no_pre", "keywords_present");
}
