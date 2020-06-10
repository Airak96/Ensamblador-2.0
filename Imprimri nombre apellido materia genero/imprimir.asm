section .data
    nombre db "Fabricio",10
    lennombre equ $- nombre

    apellido db "Carrion",10
    lenapellido equ $- apellido

    materia db "Ensamblador", 10
    lenmateria equ $- materia

    genero db "Masculino",10
    lengenero equ $- genero
section .bss

section .text
    global _start
_start: 

    mov eax, 4
    mov ebx, 0
    mov ecx, nombre
    mov edx, lennombre
    int 80h

    mov eax, 4
    mov ebx, 0
    mov ecx, apellido
    mov edx, lenapellido
    int 80h

    mov eax, 4
    mov ebx, 0
    mov ecx, materia
    mov edx, lenmateria
    int 80h

    mov eax, 4
    mov ebx, 0
    mov ecx, genero
    mov edx, lengenero
    int 80h

    mov eax, 1
    int 80h
