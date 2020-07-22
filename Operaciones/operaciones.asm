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

    resDiv db 10,"El cociente es: "
    len_resDiv equ $-resDiv

    residuo1 db 10,"El residuo es: "
    len_residuo equ $-residuo1

    resMul db 10,"La multiplicacion es: "
    len_resMul equ $- resMul

    resResta db 10,"La resta es: "
    len_resResta equ $- resResta

    resSuma db 10,"La suma es: "
    len_resSuma equ $- resSuma
    
    newLine db 10,""
    lenLine equ $- newLine

section .bss
    multiplicacion resb 5
    division resb 5
    residuo resb 5
    resta resb 5
    suma resb 5
section .text
        global _start
_start:
        
         
; ṕroceso de suma
        
        mov al, 4
        mov ah, 2

        add al, ah
        add al, '0'
    
        mov[suma], al

        escribir resSuma, len_resSuma
        escribir suma,2


; ṕroceso de resta
    mov ax, 4
    mov bx, 2
        
    sub ax, bx
    add ax, '0'
    
    mov[resta], ax

    escribir resResta, len_resResta
    escribir resta, 2


; ṕroceso de producto
    mov al, 4
    mov bh, 2

    mul bh
    add al, '0'
    ;add ah, '0'
    mov [multiplicacion], al

    escribir resMul, len_resMul
    escribir multiplicacion, 4


;  división
        
    mov al, 4
    mov bl, 2

    div bl
    add al, '0'
    mov [division], al 
    add ah, '0'
    mov [residuo], ah

    escribir resDiv, len_resDiv
    escribir division, 2

    escribir residuo1, len_residuo
    escribir residuo, 2
    escribir newLine, lenLine


       
        mov eax, 1
        int 80h
