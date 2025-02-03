%{
#include <stdio.h>
#include <string.h>
int words = 0;
int characters = 0;
int lines = 0;
int blanks = 0;
%}

%%
. ++characters;
\n ++lines; ++characters;
[^\t\n ]+ ++words; characters += strlen(yytext);
[ \t]+ ++blanks;
%%

int main()
{
    yylex();
    printf("# of Characters = %d\n", characters);
    printf("# of Lines = %d\n", lines);
    printf("# of Words = %d\n", words);
    printf("# of Whitespace = %d\n", words);
}
