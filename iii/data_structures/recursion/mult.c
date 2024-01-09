#include <stdio.h>
#include <stdlib.h>
int mult(int m, int n);
int main(int argc, char **argv)
{
    (void) argc;
    int n = atoi(argv[1]);
    printf("%dx%d = %d\n", m, n, mult(m, n));
}
int mult(int m, int n)
{
    if (n == 1) 
        return m;
    else
        return m + mult(m, n - 1);
}
