%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
section .data
    asterisco db "*"

    new_line db 10,""
section .bss

section .text
    global _start
_start:
    mov ecx, 9
    mov ebx, 1

l1:
    push ecx
    push ebx

    ;---Nueva linea----;
    ;escribir new_line,1

    ;pop ecx
    mov ebx,ecx
    ;push ebx
l2:
    push ecx

    ;--Asterisco--
    escribir asterisco, 1

    pop ecx

    loop l2

    escribir new_line,1
    
    pop ebx
    pop ecx
    inc ebx
    loop l1


    mov eax, 1
    int 80h
