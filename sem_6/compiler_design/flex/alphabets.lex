%{
#include <stdio.h>
int consonants = 0;
int vowels = 0;
%}

%%
[aeiouAEIOU] ++vowels; ++consonants;
[a-zA-Z] ++consonants;
%%

int main()
{
    yylex();
    printf("# of Vowels = %d\n", vowels);
    printf("# of Consonants = %d\n", consonants);
}
