#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "polynomial.h"

int main(void)
{
    Term *poly1 = NULL;
    Term *poly2 = NULL;
    int c, e, choice;
    bool make = true;
    while (make) {
        printf("enter term c e? ");
        scanf("%d %d", &c, &e);
        insert(&poly1, create(c, e));
        printf("continue? ");
        scanf("%d", &choice);
        make = (bool) choice;
    }
    make = true;
    while (make) {
        printf("enter term c e? ");
        scanf("%d %d", &c, &e);
        insert(&poly2, create(c, e));
        printf("continue? ");
        scanf("%d", &choice);
        make = (bool) choice;
    }
    display(poly1);
    display(poly2);
    Term *res = mult(poly1, poly2);
    display(res);
    display(add(poly1, poly2));
    return 0;
}
