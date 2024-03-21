#include <stdio.h>
#include <stdlib.h>


void bubble_sort(int *arr, int n) 
{
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

int main(int argc, char **argv) 
{
    int len;
    if (argc == 1) {
        printf("program usage: ./bubble 10\n");
        return -1;
    }
    else
        len = atoi(argv[1]);
    int nums[len];
    for (int i = 0; i < len; i++) {
        printf("elem %d? ", i);
        scanf("%d", &nums[i]);
    }
    for (int i = 0; i < len; i++)
        printf("%d ", nums[i]);
    printf("\n");
    bubble_sort(nums, len);
    for (int i = 0; i < len; i++)
        printf("%d ", nums[i]);
    printf("\n");
}














