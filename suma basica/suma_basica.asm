%macro imprimir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro leer 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
section .data
    mensaje db "Ingrese un numero: ",10
    len_mensaje equ $- mensaje

    msj_suma db "La suma es: "
    len_msj_suma equ $-msj_suma


section .bss

    numero resb 5
    numero1 resb 5
    resultado resb 5
section .text
    global _start
_start:


    imprimir mensaje, len_mensaje
    leer numero, 5

    imprimir mensaje, len_mensaje
    leer numero1,5


    mov eax, [numero]
    sub eax,'0'
    mov ebx, [numero1]
    sub ebx,'0'
    
    add eax,ebx
    add eax,'0'
    mov [resultado],eax

    imprimir msj_suma, len_msj_suma
    imprimir resultado, 5

    mov eax, 1
    int 80h