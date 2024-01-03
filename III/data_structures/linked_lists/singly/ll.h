#ifndef LL_H
#define LL_H
typedef struct Node{
    int data;
    struct Node *next;
} Node;
void display(Node *head);
void reverse(Node **head);
Node *create(int n);
void append(Node **head, Node *node);
void delete(Node **head, int n);
#endif
