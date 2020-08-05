;Roberh Fabricio Carriòn Vega
;29/07/2020
;6to
;loop cuadrado asteriscos
section .data
    asterisco db "* "
    len_asterisco equ $-asterisco

    espacio db 10,""
section .bss

section .text
    global _start
_start:

    mov ecx, 9
    mov eax, 9
    jmp imprimir

principal:
    dec eax
    push eax

    mov eax, 4
    mov ebx, 1
    mov ecx, espacio
    mov edx, 1
    int 80h

    pop eax

    mov ecx, 9

    cmp eax, 0
    jz salir
    jmp imprimir
imprimir:
    push eax
    push ecx

    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx, len_asterisco
    int 80h

    pop ecx
    pop eax

    loop imprimir
    jmp principal

salir:
    mov eax, 1
    int 80h