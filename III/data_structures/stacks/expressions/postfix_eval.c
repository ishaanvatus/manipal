#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#define STACK_LIMIT 1024

typedef struct{
    int top;
    int items[STACK_LIMIT];
} Stack;

int pop(Stack *stack);
void push(Stack *stack, int item);
bool is_empty(Stack stack);
bool is_full(Stack stack);
int sizeof_stack(Stack stack);

bool is_digit(char op);
int operation(char op, int op1, int op2);

int main(int argc, char **argv) 
{
    char *expression;
    if (argc == 2)
        expression = argv[1];
    else {
        printf("Program Usage: ./postfix_eval 1 9 +\n");
        return -1;
    }
    int pos = 0;
    Stack s;
    s.top = -1;
    int val, op1, op2;
    while (expression[pos] != '\0') {
        if (is_digit(expression[pos]))
            push(&s, (int) (expression[pos] - '0'));
        else {
            op2 = pop(&s);
            op1 = pop(&s);
            val = operation(expression[pos], op1, op2);
            push(&s, val);
        }
        pos++;
    }
    int result = pop(&s);
    printf("%d\n", result);
}
bool is_digit(char symb)
{
    return (symb >= '0' && symb <= '9');
}
int operation(char symb, int op1, int op2)
{
    switch (symb) {
        case '+':
            return op1 + op2;
        case '-':
            return op1 - op2;
        case '*':
            return op1 * op2;
        case '/':
            return op1 / op2;
        default:
            printf("illegal operation\n");
            exit(-1);
    }
}
int pop(Stack *stack)
{
    if (is_empty(*stack)) {
        printf("Stack Underflow\n");
        exit(-1);
    }
    return stack->items[stack->top--];
}
void push(Stack *stack, int item)
{
    if (is_full(*stack)) {
        printf("Stack Overflow\n");
        exit(-1);
    }
    stack->items[++stack->top] = item;
}
bool is_empty(Stack stack)
{
    return stack.top == -1;
}
bool is_full(Stack stack)
{
    return stack.top == (STACK_LIMIT - 1);
}
