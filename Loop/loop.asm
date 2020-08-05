
section .data
    mensaje db "Hola "
    len_mensaje equ $- mensaje

    espacio db "",10


section .bss
    aux resb 2
section .text
    global _start
_start: 
    mov ecx,9

ciclo:

    push ecx

    add ecx,'0'
    mov [aux],ecx
    ;mov al,cl
    ;mov cl,10
    ;div cl
    ;add ax,'00'
    ;mov [aux],eax

    mov eax, 4
    mov ebx, 1
    mov ecx, mensaje
    mov edx, len_mensaje
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, aux
    mov edx, 2
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, espacio
    mov edx, 1
    int 80h

    pop ecx


    loop ciclo

salir:
    mov eax, 1
    int 80h

