#include <stdio.h>

int main() {
    int choice;

    printf("Do you enjoy ECE 120?\n");
    printf("1. Yes\n");
    printf("2. No\n");
    scanf("%d", &choice);   // scanf gets the user input, opposite of printf

    if (choice == 1) {
        printf(":D\n");
    } else if (choice == 2) {
        printf(":|\n");
    } else {
        printf("Please enter either 1 or 2\n");
    }

    return 0;
}