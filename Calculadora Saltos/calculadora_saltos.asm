;Roberth Fabricio Carrion Vega
;6to A Ingenieria en Sistemas
;13 de julio del 2020

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
	msg1		db		10,'-Calculadora-',10,0
	lmsg1		equ		$ - msg1
 
	msg2		db		10,'Numero 1: ',10
	lmsg2		equ		$ - msg2
 
	msg3		db		'Numero 2: ',10
	lmsg3		equ		$ - msg3

	msg4		db		'1.Restar ',10
	lmsg4		equ		$ - msg4

	msg5		db		'2.Sumar',10
	lmsg5		equ		$ - msg5

	msg6		db		'3.Multiplicar',10
	lmsg6		equ		$ - msg6

	msg7		db		'4.Dividir',10
	lmsg7		equ		$ - msg7

	msg8		db		'5.Salir',10
	lmsg8		equ		$ - msg8

	msg9		db		10,'Resultado: ',0
	lmsg9		equ		$ - msg9
 
	msg10		db		10,'Opcion Invalida',10
	lmsg10		equ		$ - msg10

	msg11		db		'Seleccione una opcion:',0
	lmsg11		equ		$ - msg11

	msg12		db 		10,'Desea seguir? escriba 1 para seguir o escriba 0 para salir: '
	lmsg12		equ 	$ - msg12
 
	nlinea		db		10,10,0
	lnlinea		equ		$ - nlinea
 
section .bss
	opcion: 	resb	2
	opcion2:	resb	2
  	num1:		resb	2
	num2:		resb 	2
	resultado:	resb 	2
 
section .text
 	global _start
 
_start:
	; Imprimimos en pantalla el mensaje 1
	escribir msg1,lmsg1
 
	; Imprimimos en pantalla el mensaje 2
	escribir msg2,lmsg2
 
	; Obtenemos el numero 1
	leer num1,2
 
	; Imprimimos en pantalla el mensaje 3
	escribir msg3,lmsg3
 
	; Obtenemos el numero 2
	leer num2,2
 

menu: 
	;Mostramos mensajes del menu
	escribir msg4,lmsg4
	escribir msg5,lmsg5
	escribir msg6,lmsg6
	escribir msg7,lmsg7
	escribir msg8,lmsg8
	escribir msg11,lmsg11

	leer opcion,2

	mov ah,[opcion]
	sub ah,'0'

	cmp ah,1
	je restar
	cmp ah,2
	je sumar
	cmp ah,3
	je multiplicar 
	cmp ah,4
	je dividir
	cmp ah,5
	je salir

	mov eax, 4
	mov ebx, 1
	mov ecx, msg10 
	mov edx, lmsg10
	jmp menu

sumar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Sumamos el registro AL y BL
	add al, bl
;	aaa
 
	; Convertimos el resultado de la suma de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	
	escribir msg9,lmsg9
 
	; Imprimimos en pantalla el resultado
	escribir resultado,2
 
	escribir msg12,lmsg12
	leer opcion2,2

	mov al,[opcion2]
	sub al,'0'
	cmp al,1
	je menu
	cmp al,0
	je salir

	escribir msg10,lmsg10
	jmp salir

 
restar:
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Restamos el registro AL y BL
	sub al, bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add al, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], al
 
	; Imprimimos en pantalla el mensaje 9
	escribir msg9,lmsg9

	; Imprimimos en pantalla el resultado
	escribir resultado,1
 
	escribir msg12,lmsg12
	leer opcion2,2

	mov al,[opcion2]
	sub al,'0'
	cmp al,1
	je menu
	cmp al,0
	je salir

	escribir msg10,lmsg10
	jmp salir

 
multiplicar:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Multiplicamos. AX = AL X BL
	mul bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Imprimimos en pantalla el mensaje 9
	escribir msg9,lmsg9
 
	; Imprimimos en pantalla el resultado
	escribir resultado,1
 
	escribir msg12,lmsg12
	leer opcion2,2

	mov al,[opcion2]
	sub al,'0'
	cmp al,1
	je menu
	cmp al,0
	je salir

	escribir msg10,lmsg10
	jmp salir

 
dividir:
 
	; Movemos los numeros ingresados a los registro AL y BL
	mov al, [num1]
	mov bl, [num2]
 
	; Igualamos a cero los registros DX y AH
	mov dx, 0
	mov ah, 0
 
	; Convertimos los valores ingresados de ascii a decimal
	sub al, '0'
	sub bl, '0'
 
	; Division. AL = AX / BL. AX = AH:AL
	div bl
 
	; Convertimos el resultado de la resta de decimal a ascii
	add ax, '0'
 
	; Movemos el resultado a un espacio reservado en la memoria
	mov [resultado], ax
 
	; Print on screen the message 9
	escribir msg9,lmsg9
 
	; Imprimimos en pantalla el resultado
	escribir resultado,1
 
	escribir msg12,lmsg12
	leer opcion2,2

	mov al,[opcion2]
	sub al,'0'
	cmp al,1
	je menu
	cmp al,0
	je salir

	escribir msg10,lmsg10
	jmp salir

 
salir:
	; Imprimimos en pantalla dos nuevas lineas
	escribir nlinea,lnlinea
 
	; Finalizamos el programa
	mov eax, 1
	mov ebx, 0
	int 80h
