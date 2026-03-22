#include <stdio.h>

extern void burbuja(long long *arreglo, long long n);

int main() {
    long long n;
    printf("Tamano del arreglo ");
    scanf("%lld", &n);

    long long mi_arreglo[n];

    printf("ingresa los %lld números:\n", n);
    for (long long i = 0; i < n; i++) {
        scanf("%lld", &mi_arreglo[i]);
    }

    burbuja(mi_arreglo, n);

    printf("\nArreglo ordenado: ");
    for (long long i = 0; i < n; i++) {
        printf("%lld ", mi_arreglo[i]);
    }
    printf("\n");

    return 0;
}