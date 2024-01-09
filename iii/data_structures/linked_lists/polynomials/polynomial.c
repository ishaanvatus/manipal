#include <stdio.h>
#include <stdlib.h>
#include "polynomial.h"
static int power(int x, int e)
{
    int res = 1;
    for (int i = 0; i < e; i++) 
        res *= x;
    return res;
}
Term *add(Term *t1, Term *t2)
{
    Term *curr1 = t1;
    Term *curr2 = t2;
    Term *res = NULL;
    while (curr1 != NULL && curr2 != NULL) {
        if (curr1->expo == curr2->expo) {
            insert(&res, create(curr1->coef + curr2->coef, curr1->expo)); 
            curr1 = curr1->next;
            curr2 = curr2->next;
        }
        else if (curr1->expo < curr2->expo) {
            insert(&res, create(curr1->coef, curr1->expo));
            curr1 = curr1->next;
        }
        else {
            insert(&res, create(curr2->coef, curr2->expo));
            curr2 = curr2->next;
        }
    }
    if (curr1 != NULL) {
        while (curr1 != NULL) {
            insert(&res, create(curr1->coef, curr1->expo));
            curr1 = curr1->next;
        }
    }
    if (curr2 != NULL) {
        while (curr2 != NULL) {
            insert(&res, create(curr2->coef, curr2->expo));
            curr2 = curr2->next;
        }
    }
    return res;
}
Term *mult(Term *t1, Term *t2)
{
    Term *res = NULL;
    Term *curr1 = t1;
    Term *curr2 = t2;
    int c, e;
    while (curr1 != NULL) {
        curr2 = t2;
        while (curr2 != NULL) {
            c = curr1->coef*curr2->coef;
            e = curr1->expo + curr2->expo;
            insert(&res, create(c, e));
            curr2 = curr2->next;
        }
        curr1 = curr1->next;
    }
    return res;
}
int evaluate(Term *t1, int n)
{
    int res = 0;
    Term *curr = t1;
    while (curr != NULL) {
        res += curr->coef*power(n, curr->expo);
        curr = curr->next;
    }
    return res;
}
Term *create(int c, int e)
{
    Term *t = malloc(sizeof(Term));
    t->coef = c;
    t->expo = e;
    t->next = NULL;
    return t;
}
void insert(Term **head, Term *t)
{
    if ((*head) == NULL) {
        (*head) = t;
        return;
    }
    Term *curr = *head;
    Term *prev = NULL;
    while (curr != NULL && curr->expo < t->expo) {
        prev = curr;
        curr = curr->next;
    }
    if (curr != NULL && curr->expo == t->expo) {
        curr->coef += t->coef;
        free(t);
    }
    else {
        if (prev == NULL) {
            t->next = (*head);
            (*head) = t;
        }
        else {
            prev->next = t;
            t->next = curr;
        }
    }
}
void display(Term *head)
{
    Term *curr = head;
    printf("\n");
    while (curr->next != NULL) {
        if (curr->expo == 0)
            printf("%d +", curr->coef);
        else
            printf("%dx^%d +", curr->coef, curr->expo);
        curr = curr->next;
    }
    printf(" %dx^%d\n", curr->coef, curr->expo);
}
