//4) WAP in MPI to toggle the character of a given string indexed by the rank of the process

#include <mpi.h>
#include <stdio.h>
void *toggle(int rank, char *string)
{
    int len = 0;
    while (string[len] != '\0')
        len++;
    for (int index = 0; index < len; index++) {
        if (index == rank) {
            if (string[index] >= 'A' && string[index] <= 'Z')
                printf("%c", string[index] + 32);
            else if (string[index] >= 'a' && string[index] <= 'z')
                printf("%c", string[index] - 32);
            else
                printf("%c", string[index]);
        }
        else
            printf("%c", string[index]);
    }
    printf("\n");
    
}
int main(int argc, char **argv)
{
    int rank;
    char *string = argv[1];
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    printf("%d", rank);
    toggle(rank, string);
    MPI_Finalize();
}
