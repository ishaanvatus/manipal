#include <stdio.h>
#include <stdlib.h>
#include "ll.h"

Node *create(int n)
{
    Node *new_node = malloc(sizeof(Node));
    new_node->data = n;
    new_node->next = NULL;
    return new_node;
}
void display(Node *head)
{
    if (head == NULL)
        return;
    Node *temp = head;
    while (temp->next != NULL) {
        printf("%d->", temp->data);
        temp = temp->next;
    }
    printf("%d\n", temp->data);
}
void append(Node **head, Node *node)
{
    if ((*head) == NULL) {
        (*head) = node;
        return;
    }
    Node *temp = *head;
    while (temp->next != NULL)
        temp = temp->next;
    temp->next = node;
}
