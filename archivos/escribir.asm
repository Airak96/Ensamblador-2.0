%macro escribir 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msj1 db "Ingresa datos en el archivo",10
    len_msj1 equ $-msj1 

    archivo db "/home/fabricio/Escritorio/Examen_5/datos.txt"
section .bss
    texto resb 30
    idarchivo resd 1
section .text
    global _start

leer:
    mov eax, 3
    mov ebx, 0
    mov ecx, texto
    mov edx, 10
    int 80h
    ret 

_start: 
    mov eax, 8   ; servicio para crear archivos, trabajar con archivos
    mov ebx, archivo ; direccion del archivo
    mov ecx, 1  ; modo de acceso
                    ; O-Ronly 0: el archivo se abre solo para leer
                    ; O-WONLY 1: el archhivo se abre solo para escritura
                    ;O-RDWR 2: el archivo se abre para lectura y escritura
                    ;O-CREATE 256: crea el archivo en caso que no exista
                    ;O-APPEND 2000H: agregar elementos al final del archivo 
    mov edx, 777h
    int 80h

    test eax, eax   ; instruccion de comparacion realiza la operacion logica Y de dos operandos
                    ;pero no afecta a ninguno de ellos, solo afecta al registro de estado 
                    ;Admite todos los tipos de direccionamiento excepto los dos operandos en memoria
                        ;text reg, reg
                        ;TEST reg, mem
                        ;TEST mem, reg
                        ;TEST reg, inmediato
                        ;TEST mem, inmediato
    jz salir        ;se ejecuta cuando existen errores en el archivo

    mov dword [idarchivo], eax
    escribir msj1,len_msj1

    call leer

;*********Escritura del archivo *****************
    mov eax, 4
    mov ebx, [idarchivo]
    mov ecx, texto
    mov edx, 20
    int 80h
salir: 
    mov eax, 1
    int 80h
