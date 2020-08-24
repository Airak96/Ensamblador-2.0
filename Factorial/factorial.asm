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

    mensaje_primo db "El factorial es: "
    len_mensaje_primo equ $- mensaje_primo


section .bss
    num resb 2
    mult resb 2
section .text
    global _start
_start:
    escribir msj1, len_msj1
    leer num, 2
    mov eax, [num]
    sub eax, '0'
    
    mov ebx, [num]
    sub ebx, '0'
    
multiplicacion:
    dec ebx
    mul ebx
    add ecx,eax
    add ecx, '0'
    mov [mult], ecx
    push eax
    push ebx
    push ecx
    escribir mult,2
    pop eax
    pop ebx
    pop ecx
    ;escribir mult, 1
    cmp ebx, 1
    je salir 
    jmp multiplicacion
salir:
    mov eax, 1
    int 80h