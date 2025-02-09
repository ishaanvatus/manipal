/*
 * 3.
 * S -> aAcBe
 * A -> bR
 * R -> bR|epsilon
 * B -> d
*/
#include <stdio.h>
#include <stdlib.h>

void failure();
void success();
void s(char **str);
void a(char **str);
void r(char **str);
void b(char **str);
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
        a(str);
        if (**str == 'c') {
            (*str)++;
            b(str);
            if (**str == 'e') {
                (*str)++;
                return;
            } else
                failure();
        } else
            failure();
    } else
        failure();
}
void a(char **str)
{
    if (**str == 'b') {
        (*str)++;
        r(str);
        return;
    } else
        failure();
}
void r(char **str)
{
    if (**str == 'b') {
        (*str)++;
        r(str);
        return;
    } else
        return;
}
void b(char **str)
{
    if (**str == 'd') {
        (*str)++;
        return;
    } else
        failure();
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

