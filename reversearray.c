#include <stdio.h>
#include <stdlib.h>

void reverse_in_place(int *arr, size_t length) {
    if (length < 2) return;
    int *left = arr;
    int *right = arr + length - 1;
    while (left < right) {
        int temp = *left;
        *left = *right;
        *right = temp;
        left++;
        right--;
    }
}

int* reverse_out_of_place(const int *arr, size_t length) {
    int *result = malloc(length * sizeof(int));
    if (result == NULL) return NULL;
    for (size_t i = 0; i < length; i++) {
        result[i] = arr[length - 1 - i];
    }
    return result;
}

void print_array(const char *label, const int *arr, size_t length) {
    printf("%s", label);
    for (size_t i = 0; i < length; i++) printf(" %d", arr[i]);
    printf("\n");
}

int main(void) {
    int numbers[] = {1, 2, 3, 4, 5};
    size_t length = sizeof(numbers) / sizeof(numbers[0]);
    print_array("original:", numbers, length);
    int *reversed = reverse_out_of_place(numbers, length);
    if (reversed == NULL) return 1;
    print_array("out-of-place reversed:", reversed, length);
    print_array("original (unchanged):", numbers, length);
    reverse_in_place(numbers, length);
    print_array("in-place reversed:", numbers, length);
    free(reversed);
    return 0;
}
