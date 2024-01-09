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
void reverse(Node **head)
{
    Node *curr = *head;
    Node *prev = NULL;
    Node *next = NULL;
    while (curr != NULL) {
        next = curr->next;
        curr->next = prev;
        prev = curr;
        curr = next;
    }
    (*head) = prev;
}
void delete(Node **head, int n)
{
    Node *prev = NULL;
    Node *curr = *head;

    while (curr->next != NULL) {
        if (curr->data == n)
            break;
        prev = curr;
        curr = curr->next;
    }
    if (prev == NULL) {
        (*head) = curr->next;
        free(curr);
        return;
    }
    prev->next = curr->next;
    free(curr);
}
