# CIS 386 — Lab 1: Intro to C

Each program is in a separate C file. The code contains no comments.

## Compile

```sh
gcc -std=c11 -Wall -Wextra -pedantic triangleinfo.c -o triangleinfo -lm
gcc -std=c11 -Wall -Wextra -pedantic ispalindrome.c -o ispalindrome
gcc -std=c11 -Wall -Wextra -pedantic arraystats.c -o arraystats
gcc -std=c11 -Wall -Wextra -pedantic mystrlen.c -o mystrlen
gcc -std=c11 -Wall -Wextra -pedantic reversearray.c -o reversearray
```

## Run

```sh
./triangleinfo
./ispalindrome
./arraystats
./mystrlen architecture
./reversearray
```

MyStrlen also prompts for a word when run without an argument. Text and word input are limited to 4095 bytes. Palindrome comparison handles ASCII letters and digits, ignoring punctuation, spaces, and case.

ArrayStats prints five decimal places, following the written requirement. TriangleInfo rejects nonpositive sides and degenerate triangles where one side equals the sum of the other two.

## Submit on GitHub

Create a GitHub repository named `cis386-lab1`, upload these five `.c` files and this README, and submit the repository URL to your course.
