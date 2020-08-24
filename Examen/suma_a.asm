section .data
    ;pedir un numero, comparar si es para pedir otro numero, si es impar salir del programa
    msj_a: db 'Ingrese 5 numeros y precione enter', 0xA
    ln_a equ $ - msj_a

    arreglo db 0, 0, 0, 0, 0
    ln_arreglo equ $ - arreglo
    
    nlinea db 10, 10, 0
    lnlinea equ $ - nlinea

section .bss
    resultado resb 2

section .text
    global _start

_start:
    mov esi, arreglo
    mov edi, 0
    
    mov eax, 4
    mov ebx, 1
    mov ecx, msj_a
    mov edx, ln_a
    int 80H

leer:
    mov eax, 03
    mov ebx, 01
    mov ecx, resultado
    mov edx, 2
    int 80H
    
    mov al, [resultado]
    sub al, '0'
    
    mov [esi], al
    inc esi
    inc edi
    
    cmp edi, ln_arreglo ; cuando edi sea menor al tamaño del arreglo
    jb leer
    
    mov ecx, 0
    mov ebx, 0

sumar: 
    mov al, [arreglo + ecx]
    add bl, al

contador:
    inc ecx
    cmp ecx, ln_arreglo
    jb sumar
  
imprimir:
    add bl, '0'
    mov [resultado], bl

    mov eax, 4
    mov ebx, 1
    mov ecx, resultado
    mov edx, 2 
    int 80H

salir:
    mov eax, 4
    mov ebx, 1
    mov ecx, nlinea
    mov edx, lnlinea
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h