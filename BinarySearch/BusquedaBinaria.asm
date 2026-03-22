section .text
    global BusquedaBinaria
    ;Rdi apuntador al inicio
    ;RSI n elementos
    ;RDX elemento a buscar
    BusquedaBinaria:
        xor r10, r10                ;R10 es el tope izq
        mov r11, rsi                ;R11 sera el tope der
        dec r11
        .bucle:
            cmp r10, r11            ;SI izq es mayor a der, no se encontro el elemento
            jg .Noencontrado
            mov rax, r10            ;Calculamos la mitad del arreglo
            add rax, r11            ;(izq+der)
            shr rax, 1              ;Dividimos entre 2
            mov rcx, [rdi + rax*8]  ;Valor medio del arreglo
            cmp rcx, rdx            ;Comparamos el valor medio con el buscado
            je .encontrado          ;Si es igual, se encontro el elemento
            jl .menos               ;Si el valor medio es menor, buscamos en la mitad inferior
        .mas: 
            mov r11, rax            ;Si es mayor, buscamos en la mitad superior
            dec r11
            jmp .bucle
        .menos:                     ;Si es menor, buscamos en la mitad inferior
            mov r10, rax        
            inc r10
            jmp .bucle
        .encontrado:
            ret                     ;Retorna la posicion

        .Noencontrado:
            mov rax, -1
            ret






