#include <stdio.h>
#include <stdbool.h>
#include "bst.h"
int main()
{
    Node *root = NULL;
    bool add = true;
    int val;
    while (add)
    {
        printf("integer to be added to bst? ");
        scanf("%d", &val);
        root  = insert_node(root, val);
        printf("continue? ");
        scanf("%d", &add);
    }
    printf("pre\n");
    preorder(root);
    printf("NULL\npost\n");
    postorder(root);
    printf("NULL\nin\n");
    inorder(root);
    printf("NULL\n");
    levelorder(root);
}
