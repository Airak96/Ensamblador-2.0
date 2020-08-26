;11198888
;La moda es: 8
;Se repite: 4 veces

%macro write 2
  mov eax, 4
  mov ebx, 1
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

%macro read 2
  mov eax, 3
  mov ebx, 0
  mov ecx, %1
  mov edx, %2
  int 80h
%endmacro

section .data
    pathDes db '/home/fabricio/Escritorio/Examen_5/datos.txt',0
    newLine db '',10

    mjsIngreso db 'Ingrese un caracter: '
    lenmjsIngreso equ $ -mjsIngreso

    mjsCont db 'Se repite: '
    lenCont equ $ -mjsCont

    mjsSomething db ' veces',10
    lenSomething equ $ -mjsSomething


    ;Dfenir arreglo 
    array db 0,0,0,0,0,0,0,0,0,0
    lenArray equ $ -array

    archivo db "/home/fabricio/Escritorio/Examen_5/resultados.txt",0

section .bss
    idArray resb 1
    ; variables moda
    aux resb 1
    value resb 1
    cont resb 1
    caracter resb 1
    idarchivo resd 1
section .text
    global _start
leer:
    mov eax, 3
    mov ebx, 0
    mov ecx, cont
    mov edx, 10
    int 80h
    ret 
_start:
    write mjsIngreso, lenmjsIngreso
    read caracter, 1
leerArchivo:
    mov eax, 5 
    mov ebx, pathDes
    mov ecx, 0
    mov edx, 0
    int 80h

    test eax, eax
    jz salir
    mov dword[idArray], eax
    
    mov eax, 3
    mov ebx, [idArray]
    mov ecx, array
    mov edx, lenArray ;len
    int 80h

    write array,lenArray
    write newLine,1

    ; close file 1
    mov eax, 6
    mov ebx, [idArray]
    mov ecx, 0
    mov edx, 0x1FF
    int 80h


inicializar:
    mov esi, array
    mov edi, 0
    
    mov cl, 0


encontrar:
    mov al, [caracter]
    mov bl, [esi]
    call comparar
    inc esi 
    inc edi 
    cmp edi, lenArray
    jb encontrar 
    jmp presentar
    
comparar:
    cmp al, bl
    je incrementar
    ret
incrementar:
    inc cl
    ret

presentar:

    push ecx
    write mjsCont, lenCont
    pop ecx

    add cl, '0'
    mov [cont], cl
    write cont, 1
    write mjsSomething, lenSomething

escribirArchivo:
    mov eax, 8   
    mov ebx, archivo 
    mov ecx, 1 

    mov edx, 777h
    int 80h

    test eax, eax   
 
    jz salir        

    mov dword [idarchivo], eax

    call leer




    mov eax, 4
    mov ebx, [idarchivo]
    mov ecx, mjsCont
    mov edx, 20
    int 80h

    mov eax, 4
    mov ebx, [idarchivo]
    mov ecx, cont
    mov edx, 20
    int 80h

    mov eax, 4
    mov ebx, [idarchivo]
    mov ecx, mjsSomething
    mov edx, 20
    int 80h

salir:
    mov eax, 1
    int 80h