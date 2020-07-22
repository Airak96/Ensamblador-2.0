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
       mensaje db 10,"******* Comparacion de 2 numeros, cual es el mayor, menor o si son iguales  *******",10
       len_mensaje equ $- mensaje

       mensajen1 db 10,"Ingrese el primer numero: "
       lenn1 equ $ - mensajen1

       mensajen2 db "Ingrese el segundo numero: "
       lenn2 equ $ - mensajen2

       msj1 db 10,"El numero mayor es: "
       len1 equ $-msj1

       msj2 db 10,"El numero menor es: "
       len2 equ $-msj2

       msj3 db 10,"Los numeros son iguales",10
       len3 equ $-msj3

       line db 10,"",10
       lenLine equ $-line
section .bss
       n1 resb 1
       n2 resb 1

section .text
       global _start
_start:
       escribir mensaje,len_mensaje
       escribir mensajen1, lenn1 
       leer n1, 2
       escribir mensajen2, lenn2
       leer n2, 2

    mov al,[n1]
    sub al,'0'
    mov bl,[n2]
    sub bl,'0'

    cmp al,bl 
    je igual
    jg mayor 
    jng menor
    jmp salir
    

mayor:
       escribir msj1, len1
       escribir n1,1
       escribir msj2, len2 
       escribir n2,1
       escribir line, lenLine
       jmp salir

menor:
       escribir msj2, len2
       escribir n1,1
       escribir msj1,len1 
       escribir n2,1
       escribir line, lenLine
       jmp salir
igual:
       escribir msj3, len3
       escribir line, lenLine
salir:
       mov eax,1
       int 80h
