#include <stdio.h>
#include <stdlib.h>
#include "dll.h"
Node *create(int n)
{
    Node *new_node = malloc(sizeof(Node));
    if (new_node != NULL) {
        new_node->data = n;
        new_node->prev = NULL;
        new_node->next = NULL;
    }
    return new_node;
}
void display(Node *head)
{
    while (curr->next != NULL) {
        printf("%d<->", curr->data);
    }
    printf("%d\n", curr->data);
}
void reverse(Node **head)
{
    Node curr = *head;
    Node temp;
    while (curr != NULL) {
        temp = curr->next;
        curr->next = curr->prev;
        curr->prev = curr->
        curr = curr->next;
    }
}
