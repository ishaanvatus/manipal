#include <stdio.h>
#include <stdlib.h>
#include "ll.h"
int main()
{
	int v, e;
	printf("# of vertices?: ");
	scanf("%d", &v);
	printf("# of edges?: ");
	scanf("%d", &e);
	int mat[e][e];
	for (int i = 0; i < v; i++) {
		for (int j = 0; j < v; j++)
			mat[i][j] = 0;
	}
	int row, col;
	for (int i = 0; i < e; i++) {
		printf("enter edge from to: ");
		scanf("%d %d", &row, &col);
		mat[row][col] = 1;
	}
	for (int i = 0; i < v; i++) {
		for (int j = 0; j < v; j++)
			printf(" %d ", mat[i][j]);
		printf("\n");
	}
	Node *list[v];
	for (int i = 0; i < v; i++)
		list[i] = create(i);
	for (int i = 0; i < v; i++) {
		for (int j = 0; j < v; j++) {
			if (mat[i][j] && i != j)
				append(&list[i], create(j));
		}
	}
	for (int i = 0; i < v; i++)
		display(list[i]);
}
