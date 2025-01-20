/*
1) Write a simple MPI program to find out pow(x,rank) for all the processes where x 
is the integer constant and rank is the rank of the process
*/
#include <mpi.h>
#include <stdio.h>
#include <math.h>
int main(int argc, char **argv)
{
    int rank, x = 2;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    double res = pow(x, rank);
    printf("Process %d, pow(%d, %d) = %d\n", rank, x, rank, (int) res);
    MPI_Finalize();
}
