;Roberth Fabricio Carrion Vega
;6to A Ingenieria en Sistemas

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
    resultado db "La resta es: "
    len_resultado equ $- resultado

section .bss
    resta resb 5

section .text
    global _start
_start:

    mov ax, 5
    mov bx, 3
        
    sub ax, bx
    add ax, '0'
    
    mov[resta], ax

    escribir resultado, len_resultado
    escribir resta, 2


    mov eax, 1
    int 80h
