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
    msj1 db "Ingrese un numero",10
    len_msj1 equ $ - msj1

    mensaje_primo db "Es primo"
    len_mensaje_primo equ $- mensaje_primo

    mensaje_noPrimo db "No es primo"
    len_mensaje_noPrimo equ $- mensaje_noPrimo

section .bss
    num resb 2

section .text
    global _start
_start:
    escribir msj1, len_msj1
    leer num, 2
    mov al, [num]
    sub al, '0'

    call division
    cmp ah, 1
    je primo
    jmp no_primo 
division:
    mov al, [num]
    sub al, '0'
    mov bl, 2
    div bl
    ret
primo:
    escribir mensaje_primo,len_mensaje_primo
    jmp salir
no_primo:
    escribir mensaje_noPrimo, len_mensaje_noPrimo
    jmp salir

salir:
    mov eax, 1
    int 80h