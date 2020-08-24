section .data
    arreglo db 3,2,0,7,5
    len_arreglo equ $-arreglo
section .bss
    numero resb 1
section .text
    global _start 
_start:
    mov esi, arreglo    ;esi = fijar el tamaño del arreglo, posicionar el arreglo en memoria
    mov edi, 0          ;edi = contener el indice del arreglo

imprimir: 
    mov al,[esi]
    add al, '0'
    mov [numero], al
    
    add esi, 1
    add edi, 1

    mov eax, 4
    mov ebx, 1
    mov ecx, numero 
    mov edx, 1
    int 80h

    cmp edi,len_arreglo ;cmp 3, 4 => activa carry
                        ;cmp 4, 3 => desactiva carry y zero 0
                        ;cmp 3,3  => desactiva carry y zero se activa
    jb imprimir         ;se ejecuta cuando la bandera del carry esta activada

salir: 
    mov eax, 1
    int 80h