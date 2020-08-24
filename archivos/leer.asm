%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj1 db "Leer archivo",10
    len_msj1 equ $-msj1 

    archivo db "/home/fabricio/Escritorio/Ensamblador codigos/Ensamblador 2.0/archivos/archivo.txt"
section .bss
    texto resb 30
    idarchivo resd 1
section .text
    global _start

_start: 
;****************** Abrir archivo ********************
    mov eax, 5   ; servicio para crear archivos, trabajar con archivos
    mov ebx, archivo ; direccion del archivo
    mov ecx, 0  
    mov edx, 777h
    int 80h

    test eax, eax  
    jz salir        ;se ejecuta cuando existen errores en el archivo

    mov dword [idarchivo], eax
    escribir msj1,len_msj1


;****************** Leer archivo ********************
    mov eax, 3 ; close
    mov ebx, [idarchivo]
    mov ecx, texto 
    mov edx, 15
    int 80h

    escribir texto, 15
;****************** Cerrar archivo ********************
    mov eax, 6  ; close
    mov ebx, [idarchivo] 
    mov ecx, 0  
    mov edx, 0
    int 80h

salir: 
    mov eax, 1
    int 80h