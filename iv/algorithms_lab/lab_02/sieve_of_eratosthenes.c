#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

int main(int argc, char **argv) 
{
    int n;
    if (argc == 1) {
        printf("program usage: ./sieve_of_eratosthenes 100\n");
        return -1;
    }
    else
        n = atoi(argv[1]);
    bool primes[n];
    for (int i = 0; i < n; i++)
        primes[i] = true;
    primes[0] = false;
    primes[1] = false;
    for (int i = 0; i <= sqrt(n); i++) {
        if (primes[i]) {
            for (int j = i*i; j < n; j += i)
                primes[j] = false;
        }
    }
    for (int i = 0; i < n; i++) {
        if (primes[i])
            printf("%d ", i);
    }
    printf("\n");
}
