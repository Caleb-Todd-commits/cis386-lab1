#include <stdio.h>
#include <ctype.h>
#include <string.h>

int main(void) {
    char text[4096];
    printf("Enter a string: ");
    if (fgets(text, sizeof(text), stdin) == NULL) return 1;

    int left = 0;
    int right = (int)strlen(text) - 1;
    while (left < right) {
        while (left < right && !isalnum((unsigned char)text[left])) left++;
        while (left < right && !isalnum((unsigned char)text[right])) right--;
        if (tolower((unsigned char)text[left]) != tolower((unsigned char)text[right])) {
            printf("false\n");
            return 0;
        }
        left++;
        right--;
    }
    printf("true\n");
    return 0;
}
