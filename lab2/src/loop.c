#include <stdio.h>

int main() {
    char count;
    char input;
    char c;
    int i;

    count = 0;
    while ((input = getchar()) != '\n') {
        c = input;
        count = count + 1;
    }

    for (i = 0; i < count; i = i + 1) {
        printf("The last character you entered was: '%c'\n", c);
    }

    return 0;
}