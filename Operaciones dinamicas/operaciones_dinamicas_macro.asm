;Roberth Fabricio Carrion Vega
;6to A Ingenieria en Sistemas
;22 de junio del 2020

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
    ingresar db "Ingresar un numero: "
    len_ingresar equ $-ingresar

    opciones db "1.Suma",10,"2.Resta",10,"3.Multiplicacion",10,"4.Division",10,"5.Salir",10,"Seleccione una opcion: "
    len_opciones equ $-opciones

    err_opcion db "Ingrese una opcion valida"
    len_err_opcion equ $-err_opcion

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
    n1 resb 5
    n2 resb 5
    opcion resb 2
section .text
        global _start
_start:
        
    escribir ingresar,len_ingresar
    leer n1,2

    escribir ingresar,len_ingresar
    leer n2,2
menu:
    escribir opciones, len_opciones
    leer opcion, 2
    mov ah,[opcion]
    sub ah,'0'

    cmp ah,1
    je sumatoria
    cmp ah,2
    je restar
    cmp ah,3
    je muliplicar
    cmp ah,4
    je dividir
    cmp ah, 5
    je salir

    escribir err_opcion, len_err_opcion
    jmp menu

sumatoria:        
; ṕroceso de suma
        
    mov al, [n1]
    mov ah, [n2]
    sub al,'0'
    sub ah,'0'

    add al, ah
    add al, '0'
    
    mov[suma], al

    escribir resSuma, len_resSuma
    escribir suma,2
    jmp salir
restar:
; ṕroceso de resta
    mov ax, [n1]
    mov bx, [n2]
    sub ax,'0'
    sub bx,'0'

    sub ax, bx
    add ax, '0'
    
    mov[resta], ax

    escribir resResta, len_resResta
    escribir resta, 2
    jmp salir
muliplicar:
; ṕroceso de producto
    mov al, [n1]
    mov bh, [n2]
    sub al,'0'
    sub bh,'0'

    mul bh
    add al, '0'
    ;add ah, '0'
    mov [multiplicacion], al

    escribir resMul, len_resMul
    escribir multiplicacion, 4
    jmp salir
dividir:
;  división
        
    mov al, [n1]
    mov bl, [n2]
    sub al,'0'
    sub bl,'0'

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
    jmp salir

salir:    
    mov eax, 1
    int 80h