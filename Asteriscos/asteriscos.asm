;Programa que imprimie ***********

section .data
    asterisco db "*"
section .bss

section .text
    global _start
_start:

    mov ecx, 9
    mov eax, 9

imprimir:
    push ecx
    push eax

    mov eax, 4
    mov ebx, 1
    mov ecx, asterisco
    mov edx,1
    int 80h

    pop ecx
    pop eax
    dec ecx
    cmp ecx,0
    je salir
    jmp imprimir

salir:
    mov eax, 1
    int 80h