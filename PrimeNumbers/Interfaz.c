#include <stdio.h>


extern long primo(long n);

int main() {
    long num;
    printf("Introduce un número para verificar si es primo: ");
    if (scanf("%ld", &num) != 1) return 1;

    if (primo(num)) {
        printf("Resultado: %ld es PRIMO.\n", num);
    } else {
        printf("Resultado: %ld NO es primo.\n", num);
    }

    return 0;
}