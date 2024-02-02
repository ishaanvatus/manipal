#ifndef BST_H
#define BST_H

typedef struct Node{
    int data;
    struct Node *left;
    struct Node *right;
} Node;

Node *create_node(int data);
Node *insert_node(Node *root, int data);
Node *search(Node *root, int data);
void preorder(Node *root);
void postorder(Node *root);
void inorder(Node *root);
void destroy_tree(Node *root);
#endif
