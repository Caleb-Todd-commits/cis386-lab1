#include <stdio.h>

int findMax(int *arr, int n) {
    int max = *arr;
    for (int i = 1; i < n; i++) {
        if (*(arr + i) > max) max = *(arr + i);
    }
    return max;
}

int main(void) {
    int numbers[50];
    int n;
    printf("Enter how many numbers: ");
    if (scanf("%d", &n) != 1 || n < 1 || n > 50) return 1;
    printf("Enter %d integers: ", n);
    for (int i = 0; i < n; i++) {
        if (scanf("%d", &numbers[i]) != 1) return 1;
    }

    int min = numbers[0];
    long long sum = 0;
    for (int i = 0; i < n; i++) {
        if (numbers[i] < min) min = numbers[i];
        sum += numbers[i];
    }
    printf("min: %d\n", min);
    printf("max: %d\n", findMax(numbers, n));
    printf("sum: %lld\n", sum);
    printf("average: %.5f\n", (double)sum / n);
    return 0;
}
