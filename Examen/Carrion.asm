;Nombre: Roberth Fabricio Carrion Vega
;Curso: 6to "A"
;Materia: Lenguaje Ensamblador
;Carrera: Ing en sistema
;Fecha: 24/08/2020

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



section .
    msj_inicio db "********* Examen Ensamblador Tema 1: Numero primo o no primo *******", 10
    len_msj_inicio equ $- msj_inicio

    msj db "Ingrese un numero del 1 al 9: ",10
    len_msj equ $- msj

    msj_ db "El numero "
    len_msj_ equ $- msj_ 

    mensaje_primo db " es primo",10
    len_primo equ $-mensaje_primo

    mensaje_noprimo db " no es primo",10
    len_noprimo equ $-mensaje_noprimo

    mensaje_error db "Ingrese un valor correcto!",10
    len_mensaje_error equ $-mensaje_error

section .bss
    numero resb 2
    cociente resb 2
    residuo resb 2
    contador resb 2

section .text
    global _start
_start:
    escribir msj_inicio, len_msj_inicio
    escribir msj,len_msj
    leer numero,1

    mov al,[numero]
    sub al,'0'

;----- Presenta directamente ---
    cmp al,1
    je presentar_noprimo
    cmp al,2
    je presentar_primo

;--------------------------------

    cmp al,9
    je proceso
    jmp proceso1

proceso:
        mov al, [numero]
        mov bl, 2
        sub ax, '0'

        div bl

        cmp ah,1
        je presentar_noprimo
        
proceso1:
        mov al, [numero]
        mov bl, 2
        sub ax, '0'

        div bl
        
        cmp ah,1
        je presentar_primo
        jmp presentar_noprimo
        


    
presentar_primo:
    escribir msj_, len_msj_
    escribir numero, 1
    escribir mensaje_primo,len_primo
    jmp salir

presentar_noprimo:
    escribir msj_, len_msj_
    escribir numero, 1
    escribir mensaje_noprimo,len_noprimo
    jmp salir

salir: 
    mov eax, 1
    int 80h