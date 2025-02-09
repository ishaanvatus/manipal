/*
 * 2.
 * S -> UVW
 * U -> (S)|aSb|d
 * V -> aV|epsilon
 * W -> cW|epsilon
*/
#include <stdio.h>
#include <stdlib.h>

void failure();
void success();
void s(char **str);
void u(char **str);
void v(char **str);
void w(char **str);
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
    u(str);
    v(str);
    w(str);
}
void u(char **str)
{
    if (**str == '(') {
        (*str)++;
        s(str);
        if (**str == ')') {
            (*str)++;
            return;
        } else
            failure();
    } else if (**str == 'a') {
        (*str)++;
        s(str);
        if (**str == 'b') {
            (*str)++;
            return;
        } else
            failure();
    } else if (**str == 'd') {
        (*str)++;
        return;
    } else
        failure();
}
void v(char **str)
{
    if (**str == 'a') {
        (*str)++;
        v(str);
        return;
    } else 
        return;
}
void w(char **str)
{
    if (**str == 'c') {
        (*str)++;
        w(str);
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

