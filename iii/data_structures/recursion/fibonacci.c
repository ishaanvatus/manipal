#include <stdio.h>
#include <stdlib.h>
int fibonacci(int n);
int main(int argc, char **argv)
{
    (void) argc;
    int n = atoi(argv[1]);
    printf("fib(%d) = %d\n", n, fibonacci(n));
}
int fibonacci(int n)
{
    if (n < 2) 
        return n;
    else
        return fibonacci(n - 1) + fibonacci(n - 2);
}
