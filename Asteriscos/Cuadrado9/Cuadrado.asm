;Roberh Fabricio Carriòn Vega
;22/07/2020
;6to
;Cuadrado de asteriscos

%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj db "* "
    
    len_msj equ $-msj
    espacio db 10,""
section .text
    global _start
_start:

    mov ecx, 9
    mov eax, 9
    jmp imprimir

principal:
    dec eax

    push eax
    escribir espacio,1
    pop eax

    mov ecx, 9

    cmp eax,0
    jz salir
    jmp imprimir

imprimir:
    dec ecx 

    push eax
    push ecx
    escribir msj,len_msj
    pop ecx
    pop eax

    cmp ecx, 0
    je principal
    jmp imprimir


salir:
    mov eax, 1
    int 80h