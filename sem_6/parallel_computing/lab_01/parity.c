//2) WAP in MPI where even ranked process prints "Hello" & odd raned process prints "World"
#include <mpi.h>
#include <stdio.h>

int main(int argc, char **argv)
{
    int rank;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    printf("%d", rank);
    printf((rank%2)? "World\n":"Hello\n");
    MPI_Finalize();
}
