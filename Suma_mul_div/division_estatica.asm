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
    resultado db "La division es: "
    len_resultado equ $-resultado

    residuo1 db 10,"El residuo es: "
    len_residuo equ $-residuo1

section .bss
    division resb 5
    residuo resb 5

section .text
    global _start
_start:

    mov al, 8
    mov bl, 3

    div bl
    add al, '0'
    mov [division], al 
    add ah, '0'
    mov [residuo], ah

    escribir resultado, len_resultado
    escribir division, 2

    escribir residuo1, len_residuo
    escribir residuo, 2

    mov eax, 1
    int 80h