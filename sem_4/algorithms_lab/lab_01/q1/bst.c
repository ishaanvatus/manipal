#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "bst.h"
void destroy_tree(Node *root)
{
    if (root->left)
        destroy_tree(root->left);
    if (root->left)
        destroy_tree(root->right);
    free(root);
}
Node *insert_node(Node *root, int data)
{
    if (root == NULL)
        return create_node(data);
    if (root->data > data)
        root->left = insert_node(root->left, data);
    else if (root->data < data)
        root->right = insert_node(root->right, data);
    return root;

}
Node *search(Node *root, int data)
{
    if (root == NULL || root->data == data)
        return root;
    if (root->data < data)
        return search(root->right, data);
    return search(root->left, data);
}
Node *create_node(int n)
{
    Node *new_node = malloc(sizeof(Node));
    new_node->left = NULL;
    new_node->right = NULL;
    new_node->data = n;
    return new_node;
}
void preorder(Node *root)
{
    if (root == NULL)
        return;
    printf("%d->", root->data);
    preorder(root->left);
    preorder(root->right);
}
void postorder(Node *root)
{
    if (root == NULL)
        return;
    postorder(root->left);
    postorder(root->right);
    printf("%d->", root->data);
}
void inorder(Node *root)
{
    if (root == NULL)
        return;
    inorder(root->left);
    printf("%d->", root->data);
    inorder(root->right);
}
