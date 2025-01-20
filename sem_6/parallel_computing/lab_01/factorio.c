/*
5)WAP in MPI wheree even ranked process prints the factorial of the rank and 
odd ranked process prints the fibonacci number for the rank.
*/

#include <mpi.h>
#include <stdio.h>
int fibonacci(int n)
{
    if ((n == 0) || (n == 1))
        return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}
int factorial(int n)
{
    if ((n == 0) || (n == 1))
        return 1;
    else return n*factorial(n - 1);
}
int main(int argc, char **argv)
{
    int rank;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    if (rank%2)
        printf("Process %d! factorial %d\n",rank, factorial(rank));
    else
        printf("Process %dth fibonacci %d\n",rank, fibonacci(rank));
    MPI_Finalize();
}
