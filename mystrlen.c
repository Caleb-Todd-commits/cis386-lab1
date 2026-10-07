#include <stdio.h>
#include <stddef.h>

size_t my_strlen(const char *str) {
    const char *start = str;
    const char *end = str;
    while (*end != '\0') end++;
    return (size_t)(end - start);
}

int main(int argc, char *argv[]) {
    char word[4096];
    const char *text;
    if (argc > 1) text = argv[1];
    else {
        printf("Enter a word: ");
        if (scanf("%4095s", word) != 1) return 1;
        text = word;
    }
    printf("length: %zu\n", my_strlen(text));
    return 0;
}
