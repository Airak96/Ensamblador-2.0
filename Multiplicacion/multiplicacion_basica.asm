%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
section .data
    mensaje db 10,""
    msj db "3 * "
    len_msj equ $- msj

    msj1 db " = "
    len_msj1 equ $-msj1
section .bss
    multi resb 2
    valor resb 2
    valor1 resb 2
section .text
    global _start
_start:
    mov al, 3
    mov bh, 1


multiplicacion:
    mul bh
    add al, '0'
    mov [multi],al



    push ebx
    push eax
    mov eax, 4
    mov ebx, 1
    mov ecx, multi 
    mov edx, 1
    int 80h
    pop ebx
    pop eax

    push ebx
    push ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, 1
    int 80h
    pop ebx
    pop ecx

    mov al,3
    inc bh
    cmp bh, 9
    je salir 
    jmp multiplicacion

salir:
    mov eax, 1
    int 80h