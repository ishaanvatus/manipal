#ifndef POLYNOMIAL_H
#define POLYNOMIAL_H
typedef struct Term {
    int coef;
    int expo;
    struct Term *next;
} Term;

Term *add(Term *t1, Term *t2);
Term *mult(Term *t1, Term *t2);
int evaluate(Term *t1, int n);
Term *create(int c, int e);
void insert(Term **head, Term *t);
void display(Term *head);

#endif
