section .data
    mensaje db "mi segunda vez con nasm", 10
    len_mensaje equ $- mensaje

section .bss

section .text
    global _start 
_start:

    ; imprimit mensaje

    mov eax, 4 ; ripo de subrutina 4 escribir
    mov ebx, 1 ; tipo de salida x lo general 1 
    mov ecx, mensaje ; ecx almacena la referencia del mensaje a imprimir
    mov edx, len_mensaje ; edx almacena la cantidad de caracteres a imprimir o a leer
    int 80h ; interrupcion del sw para el so, linux 80h windows 21h


    mov eax, 1  ; salida del programa
    int 80h