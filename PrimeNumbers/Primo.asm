section .text
    global primo
    ;rdi numero a comprobar si es primo
    
primo:
    mov r9, rdi ; Guardamos el valor de rdi para usarlo después
    sub r9,1    ; Restamos 1 para no comprobar el mismo número
    mov rcx, 2  ; Empezamos a comprobar desde el número 2
    cmp rdi, 1  ;   Si el número es 1 o menor, no es primo
    jbe .noes   ; Si es 1 o menor, saltamos a la etiqueta .noes
    cmp rdi, 2  ; Si el número es 2, es primo
    je .fin   ; Si es 2, saltamos a la etiqueta .fin
.bucle:
    xor rdx, rdx    ; Limpiamos rdx para la división
    mov rax, rdi    ; Movemos el número a comprobar a rax para la división
    idiv rcx        ; Dividimos rdi entre rcx, el resultado queda en rax y el resto en rdx
    cmp rdx, 0      ; Si el resto es 0, significa que rdi es divisible por rcx, por lo tanto no es primo
    je .noes        ; Si es divisible, saltamos a la etiqueta .noes
    cmp rcx, r9     ; Comparamos el divisor actual con r9 (que es rdi - 1)
    je .fin     ; Si hemos llegado a rdi - 1 sin encontrar divisores, es primo
    inc rcx     ; Incrementamos el divisor para comprobar el siguiente número
    jmp .bucle

.noes:
    mov rax,0   ; Si no es primo, devolvemos 0
    ret
.fin:
    mov rax, 1  ; Si es primo, devolvemos 1
    ret