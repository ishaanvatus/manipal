#include <stdio.h>
#include <stdbool.h>
#include "ll.h"
int main(void)
{
    Node *head = NULL;
    bool go = true;
    int choice, data;
    while (go) {
        printf("1.append node\n");
        printf("2.delete node\n");
        printf("3.reverse list\n");
        printf("4.display list\n");
        printf("5.quit\n");
        scanf("%d", &choice);
        switch (choice) {
            case 1:
                printf("value to append? ");
                scanf("%d", &data);
                append(&head, create(data));
                break;
            case 2:
                printf("value to delete? ");
                scanf("%d", &data);
                delete(&head, data);
                break;
            case 3:
                reverse(&head);
                break;
            case 4:
                display(head);
                break;
            case 5:
                go = (choice == 5)? false:true;
                break;
        }
    }
    return 0;
}
