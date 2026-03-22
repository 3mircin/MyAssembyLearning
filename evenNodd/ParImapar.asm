section .text
    global ParImpar
    ;rdi = numero
ParImpar:
    mov rax, rdi
    mov rcx, 2
    xor rbx, rbx
    idiv rcx
    cmp rdx, 0
    jnz .Impar
    jmp .fin
    .Impar:
        mov rax, 0
        ret
    .fin:
    ret