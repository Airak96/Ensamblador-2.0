;Roberth Fabricio Carrion Vega
;6to A Ingenieria en Sistemas

%macro escribir 2 
        mov eax, 4
        mov ebx, 1
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro

%macro leer 2 
        mov eax, 3
        mov ebx, 0
        mov ecx, %1
        mov edx, %2
        int 80h
%endmacro
section .data
    resultado db "La multiplicacion es: "
    len_resultado equ $- resultado

section .bss

    multiplicacion resb 5
section .text
    global _start
_start:

    mov al, 3
    mov bl, 2

    mul bl
    add al, '0'
    mov [multiplicacion], al

    escribir resultado, len_resultado
    escribir multiplicacion, 2

    mov eax, 1
    int 80h