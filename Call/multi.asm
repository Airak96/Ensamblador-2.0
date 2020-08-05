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
    mensaje db 10,""
    msj db " * "
    len_msj equ $- msj

    msj1 db " = "
    len_msj1 equ $-msj1

    aviso db "Tabla de multiplicar",10
    len_aviso equ $- aviso

    ingreso_valor db "Ingrese el valo de la tabla: "
    len_ingreso_valor equ $-ingreso_valor
section .bss
    multi resb 2
    valor resb 2
    valor1 resb 2
section .text
    global _start
_start:
    escribir aviso, len_aviso
    escribir ingreso_valor, len_ingreso_valor
    leer valor, 2
    ;mov al, 3
    ;add al,'0'
    ;mov [valor],al
    mov cx, 1


multiplicacion:
    push cx
    mov ax, [valor]
    sub ax, '0'
    mul cx
    add ax, '0'
    mov [multi],ax
    add cx, '0'
    mov [valor1],cx
    call imprimir_num
    pop cx
    inc cx 
    cmp cx,10
    jnz multiplicacion
imprimir_num:
    escribir valor, 1
    escribir msj, len_msj
    escribir valor1, 1
    escribir msj1, len_msj1
    escribir multi, 1
    escribir mensaje,1
    ret
salir:
    mov eax, 1
    int 80h