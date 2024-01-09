#ifndef BST_H
#define BST_H
#include "bst.h"

typedef struct Node{
    int data;
    struct Node *left;
    struct Node *right;
} Node;

typedef struct qNode{
    Node *data;
    struct qNode *next;
} qNode;

typedef struct queue{
    qNode *front;
    qNode *rear;
} queue;

bool is_empty(queue *q);
void enqueue(Node *n, queue *q);
Node *dequeue(queue *q);
Node *create_node(int data);
Node *insert_node(Node *root, int data);
void preorder(Node *root);
void postorder(Node *root);
void inorder(Node *root);
void levelorder(Node *root);
void destroy_tree(Node *root);
#endif
