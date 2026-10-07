#include <stdio.h>
#include <math.h>

int main(void) {
    double a, b, c;
    printf("Enter side 1: ");
    if (scanf("%lf", &a) != 1) return 1;
    printf("Enter side 2: ");
    if (scanf("%lf", &b) != 1) return 1;
    printf("Enter side 3: ");
    if (scanf("%lf", &c) != 1) return 1;

    if (!isfinite(a) || !isfinite(b) || !isfinite(c) ||
        a <= 0 || b <= 0 || c <= 0 ||
        a + b <= c || a + c <= b || b + c <= a) {
        printf("impossible\n");
        return 0;
    }

    if (a == b && b == c) printf("equilateral\n");
    if (a == b || a == c || b == c) printf("isosceles\n");
    else printf("scalene\n");

    double s = (a + b + c) / 2;
    printf("area: %.2f\n", sqrt(s * (s - a) * (s - b) * (s - c)));
    return 0;
}
