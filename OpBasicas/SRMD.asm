section .text
    global suma
    global resta
    global multiplicacion
    global division
suma:
    mov rax, rdi
    add rax, rsi
    ret

resta:
    mov rax, rdi
    sub rax, rsi
    ret

multiplicacion:
    mov rax, rdi
    imul rax, rsi
    ret

division:
    mov rax, rdi
    idiv rsi
    ret
