# Lab 06: Recursive descent parser for simple grammars
## Ishaan Vatus, 220905043

```Makefile
SOURCES = $(wildcard *.c)
EXECS = $(SOURCES:%.c=%)
CFLAGS = -g -Wall -Wpedantic -Wextra

all: $(EXECS)
```

## Lab Exercises:

1. Write a recursive descent parser for the following simple grammars.


### Grammar:


```txt
1.  S -> a | > | (T)
    T -> T,S | S
```

### Parser:


```c
/*
 * 1. 
 * S -> a|>|(T)
 * T -> SR
 * R -> ,S|epsilon
*/
#include <stdio.h>
#include <stdlib.h>

void failure();
void success();

void s(char **str);
void t(char **str);
void r(char **str);

void failure()
{
    fprintf(stderr, "FAILURE\n");
    exit(1);
}

void success()
{
    fprintf(stdout, "SUCCESS\n");
    exit(0);
}
void s(char **str)
{
    if (**str == 'a') {
        (*str)++;
        return;
    } else if (**str == '>') {
        (*str)++;
        return;
    } else if (**str == '(') {
        (*str)++;
        t(str);
        if (**str == ')') {
            (*str)++;
            return;
        } else
            failure();
    } else
        failure();
}
void t(char **str)
{
    s(str);
    r(str);
}
void r(char **str)
{
    if (**str == ',') {
        (*str)++;
        s(str);
        return;
    } else
        return;
}
int main(int argc, char **argv)
{
    char *input = argv[1];
    s(&input);
    if (*input == '$')
        success();
    failure();
    return 0;
}
```


### Output:

![]()


### Grammar


```txt
2.  S -> UVW
    U -> (S) | aSb | d
    V -> aV | epsilon
    W -> cW | epsilon 
```


### Parser:


```c
/*
 * 2.
 * S -> UVW
 * U -> (S)|aSb|d
 * V -> aV|epsilon
 * W -> cW|epsilon
*/
#include <stdio.h>
#include <stdlib.h>

void failure();
void success();
void s(char **str);
void u(char **str);
void v(char **str);
void w(char **str);
void failure()
{
    fprintf(stderr, "FAILURE\n");
    exit(1);
}
void success()
{
    fprintf(stdout, "SUCCESS\n");
    exit(0);
}
void s(char **str)
{
    u(str);
    v(str);
    w(str);
}
void u(char **str)
{
    if (**str == '(') {
        (*str)++;
        s(str);
        if (**str == ')') {
            (*str)++;
            return;
        } else
            failure();
    } else if (**str == 'a') {
        (*str)++;
        s(str);
        if (**str == 'b') {
            (*str)++;
            return;
        } else
            failure();
    } else if (**str == 'd') {
        (*str)++;
        return;
    } else
        failure();
}
void v(char **str)
{
    if (**str == 'a') {
        (*str)++;
        v(str);
        return;
    } else 
        return;
}
void w(char **str)
{
    if (**str == 'c') {
        (*str)++;
        w(str);
        return;
    } else
        return;
}
int main(int argc, char **argv)
{
    char *input = argv[1];
    s(&input);
    if (*input == '$')
        success();
    failure();
    return 0;
}
```


### Output:


![]()

### Grammar:


```txt
3.  S -> aAcBe
    A -> Ab | b
    B -> d
```


### Parser:


```c
/*
 * 3.
 * S -> aAcBe
 * A -> bR
 * R -> bR|epsilon
 * B -> d
*/
#include <stdio.h>
#include <stdlib.h>

void failure();
void success();
void s(char **str);
void a(char **str);
void r(char **str);
void b(char **str);
void failure()
{
    fprintf(stderr, "FAILURE\n");
    exit(1);
}
void success()
{
    fprintf(stdout, "SUCCESS\n");
    exit(0);
}
void s(char **str)
{
    if (**str == 'a') {
        (*str)++;
        a(str);
        if (**str == 'c') {
            (*str)++;
            b(str);
            if (**str == 'e') {
                (*str)++;
                return;
            } else
                failure();
        } else
            failure();
    } else
        failure();
}
void a(char **str)
{
    if (**str == 'b') {
        (*str)++;
        r(str);
        return;
    } else
        failure();
}
void r(char **str)
{
    if (**str == 'b') {
        (*str)++;
        r(str);
        return;
    } else
        return;
}
void b(char **str)
{
    if (**str == 'd') {
        (*str)++;
        return;
    } else
        failure();
}
int main(int argc, char **argv)
{
    char *input = argv[1];
    s(&input);
    if (*input == '$')
        success();
    failure();
    return 0;
}
```


### Output:


![]()


### Grammar:


```txt
4.  S -> (L) | a
    L -> L,S | S
```


### Parser:


```c
/*
 * 4.
 * S -> (L)|a
 * L -> SR
 * R -> ,SR|epsilon
*/
#include <stdio.h>
#include <stdlib.h>

void failure();
void success();
void s(char **str);
void l(char **str);
void r(char **str);
void failure()
{
    fprintf(stderr, "FAILURE\n");
    exit(1);
}
void success()
{
    fprintf(stdout, "SUCCESS\n");
    exit(0);
}
void s(char **str)
{
    if (**str == '(') {
        (*str)++;
        l(str);
        if (**str == ')') {
            (*str)++;
            return;
        } else
            failure();
    } else if (**str == 'a') {
        (*str)++;
        return;
    } else 
        failure();
}
void l(char **str)
{
    s(str);
    r(str);
}
void r(char **str)
{
    if (**str == ',') {
        (*str)++;
        s(str);
        r(str);
        return;
    } else
        return;
}
int main(int argc, char **argv)
{
    char *input = argv[1];
    s(&input);
    if (*input == '$')
        success();
    failure();
    return 0;
}
```


### Output:
