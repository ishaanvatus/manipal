/*
 * 1. 
 * S -> a|>|(T)
 * T -> SR
 * R -> ,S|epsilon
*/
#include <stdio.h>
#include <stdlib.h>

void failure();
void success();

void s(char **str);
void t(char **str);
void r(char **str);

void failure()
{
    fprintf(stderr, "FAILURE\n");
    exit(1);
}

void success()
{
    fprintf(stdout, "SUCCESS\n");
    exit(0);
}
void s(char **str)
{
    if (**str == 'a') {
        (*str)++;
        return;
    } else if (**str == '>') {
        (*str)++;
        return;
    } else if (**str == '(') {
        (*str)++;
        t(str);
        if (**str == ')') {
            (*str)++;
            return;
        } else
            failure();
    } else
        failure();
}
void t(char **str)
{
    s(str);
    r(str);
}
void r(char **str)
{
    if (**str == ',') {
        (*str)++;
        s(str);
        return;
    } else
        return;
}
int main(int argc, char **argv)
{
    char *input = argv[1];
    s(&input);
    if (*input == '$')
        success();
    failure();
    return 0;
}

