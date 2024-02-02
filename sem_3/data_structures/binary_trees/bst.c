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
void enqueue(Node *n, queue *q)
{
    qNode *node = malloc(sizeof(qNode));
    node->data = n;
    node->next = NULL;
    if (q->rear == NULL) {
        q->front = node;
        q->rear = node;
        return;
    }
    q->rear->next = node;
    q->rear = node;
}
Node *dequeue(queue *q)
{
    if (q->front == NULL)
        return NULL;
    qNode *temp = q->front;
    Node *tNode = temp->data;
    q->front = temp->next;

    if (q->front == NULL)
        q->rear = NULL;

    free(temp);
    return tNode;
}
void levelorder(Node *root)
{
    if (root == NULL)
        return;
    queue *q = malloc(sizeof(queue));
    q->front = NULL;
    q->rear = NULL;
    enqueue(root, q);
    while (!is_empty(q)) {
        Node *curr = dequeue(q);
        printf("%d ", curr->data);
        if (curr->left != NULL)
            enqueue(curr->left, q);
        if (curr->right != NULL)
            enqueue(curr->right, q);
    }
}
bool is_empty(queue *q)
{
    return q->front == NULL;
}
