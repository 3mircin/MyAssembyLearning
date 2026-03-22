#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Declaración de las funciones en Ensamblador
extern long int BusquedaBinaria(long int *a, long int n, long int x); 
extern void burbuja(long int *a, long int n);

int main() {
    long int n, x;
    printf("Ingresa el tamaño del arreglo: ");
    scanf("%ld", &n);
    long int *a = (long int *)malloc(n * sizeof(long int));
    if (a == NULL) {
        printf("Error al asignar memoria.\n");
        return 1;
    }
    srand(time(NULL)); // Inicializar la semilla para los números aleatorios
    for (int i = 0; i < n; i++) {
        a[i] = rand() % 100001; 
    }
    burbuja(a, n);
    printf("Arreglo ordenado:\n");
    for (int i = 0; i < n; i++) {
        printf("%ld,", a[i]);
    }
    printf("\nIngresa el número que deseas buscar: ");
    scanf("%ld", &x);
    long int resultado = BusquedaBinaria(a, n, x);
    if (resultado != -1) {
        printf("El número %ld se encuentra en la posicion %ld.\n", x, resultado);
    } else {
        printf("El número %ld no se encuentra en el arreglo.\n", x);
    }

    free(a);
    return 0;
}