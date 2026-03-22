section .text
    global burbuja

    burbuja: 
        ;rdi apuntador al inicio del arreglo (base)
        ;rsi tamano del arreglo (numero de elementos)
        mov rcx, 0 ;Contador i
        mov r8, rsi
        sub r8, 1   ;n-1

        .buclei:
            cmp rcx, r8 ; Comparamos i con el tamano del arreglo - 1
            jge .fin ; Si i >= tamano salimos del bucle
            mov rdx,0 ; Contador j
            mov r9, r8 
            sub r9, rcx ; (n-1)-i

        .buclej:
            cmp rdx,r9 ;Comparamos j con n-1-i
            jge .finj ; Si j >= n-1-i, salimos del bucle
            mov rax, [rdi + rdx*8] ; Cargamos el elemento j, usando [BASE + INDICE * ESCALA]
            mov rbx, [rdi + (rdx+1)*8] ; Cargamos el elemento j+1
            cmp rax, rbx ; Comparamos los elementos
            jle .avanzar ; Si el elemento j es menor o igual al elemento j+1, lo mantenemos ahi
            ; Si el elemento j es mayor que el elemento j+1, los intercambiamos
            mov [rdi + rdx*8], rbx ; Colocamos el elemento j+1 en la posición j
            mov [rdi + (rdx+1)*8], rax ; Colocamos el elemento j en la posición j+1

        .avanzar:
            inc rdx ; Incrementamos j
            jmp .buclej ; Volvemos al inicio del bucle j

        .finj:
            inc rcx ; Incrementamos i
            jmp .buclei ; Volvemos al inicio del bucle i 
            
        .fin: 
            ret

            ;CALL-Llamado a la funcion

