#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>

int euclid(int m, int n);
int consec(int m, int n);
int middle(int m, int n);

int main(int argc, char **argv)
{
    int m, n;
    if (argc < 3) {
        printf("program usage: ./gcd 36 4\n");
        return -1;
    }
    else {
        m = atoi(argv[1]);
        n = atoi(argv[2]);
    }
    if (m < n) {
        int temp = m;
        m = n;
        n = temp;
    }
    if (m < 0)
        m = (-1)*m;
    if (n < 0)
        n = (-1)*n;
    printf("Euclid: gcd(%d, %d) = %d\n", m, n, euclid(m, n));
    printf("Consec: gcd(%d, %d) = %d\n", m, n, consec(m, n));
    printf("Middle: gcd(%d, %d) = %d\n", m, n, middle(m, n));
}

int euclid(int m, int n)
{
    int rem;
    while (n != 0) {
        rem = m%n;
        m = n;
        n = rem;
    }
    return m;
}
int consec(int m, int n) {
    int k = n;
    while (true) {
        if (m%k == 0) {
            if (n%k == 0)
                return k;
        }
        k--;
    }
}
int middle(int m, int n)
{
    //Use Eratosthenes Sieve to generate primes till m inclusive (m > n);
    int lim = m + 1;
    bool primes[lim];
    for (int i = 0; i < lim; i++)
        primes[i] = true;
    primes[0] = false;
    primes[1] = false;
    for (int i = 2; i <= sqrt(lim); i++) {
        if (primes[i]) {
            for (int j = i*i; j < lim; j += i)
                primes[j] = false;
        }
    }
    //use the primes
    int gcd = 1;
    int lm, ln, max;
    for (int i = 0; i < lim; i++) {
        if (primes[i]) {
            lm = 0;
            ln = 0;
            while (m%i == 0) {
                m = m/i;
                lm++;
            }
            while (n%i == 0) {
                n = n/i;
                ln++;
            }
            max = (lm < ln)? lm : ln;
            gcd = gcd*pow(i, max);
        }
    }
    return gcd;
}















