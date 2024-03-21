#include <stdio.h>
#include <stdbool.h>
#include "bst.h"
int main()
{
    Node *root = NULL;
    bool add = true;
    int val, target;
    while (add)
    {
        printf("integer to be added to bst? ");
        scanf("%d", &val);
        root  = insert_node(root, val);
        printf("continue? ");
        scanf("%d", &add);
    }
    printf("enter value to be searched\n");
    scanf("%d", &target);
    Node *temp = search(root, target);
	if (temp == NULL) {
		printf("value not found\n");	
		root = insert_node(root, target);
	}
	else
		printf("value found\n");	
    printf("pre\n");
    preorder(root);
    printf("NULL\npost\n");
    postorder(root);
    printf("NULL\nin\n");
    inorder(root);
}
