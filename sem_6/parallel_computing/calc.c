//3) WAP in MPI to simulate simple calculator. Perform each operation using diff operations in parallel

#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    int rank, a = atoi(argv[1]), b = atoi(argv[2]);
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    switch (rank) {
        case 0:
            printf("Process %d, Add: %d\n",rank, a + b);
            break;
        case 1:
            printf("Process %d, Subtract: %d\n", rank, a - b);
            break;
        case 2:
            printf("Process %d, Multiply: %d\n",rank, a*b);
            break;
        case 3:
            printf("Process %d, Divide: %f\n", rank, ((double) a) / b);
            break;
        default:
            break;

    }
    MPI_Finalize();
}
