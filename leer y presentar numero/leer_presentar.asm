section .data
    mensaje db "Ingrese un numero:",10
    len_mensaje equ $-mensaje

    presentar db "El numero ingresado es: "
    len_presentar equ $- presentar

section .bss
    numero resb 5

section .text
    global _start
_start:

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len_mensaje
    int 80h

    mov ebx, 7
    add ebx, '0' ;transformar de numero a cadena    sub para transformar de cadena a numero
    mov [numero],ebx

    mov eax, 4
    mov ebx, 1
    mov ecx, presentar
    mov edx, len_presentar
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, numero
    mov edx, 5
    int 80h


    mov eax, 1
    int 80h