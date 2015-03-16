.386

name default

; constants

	


data segment use16
	; vars
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	
	transfer proc
		M1:	mov ax,[si]
			out dx
			inc si
			inc si
			inc dx
			inc dx
			dec cx
			jnz M1
		ret
	transfer endp
	
	
	
	
	start:
		; init data
		mov ax,data
		mov ds,ax
		mov es,ax
		; init stack
		mov ax,stack
		mov bp,ax
		mov sp,offset head
		;code here
		
		
		mov ax, 900h	; расщепляем адрес 981h на 900h и 81h
		mov ds, ax      ; загружаем адрес в сегмент данных   
		mov si, 81h		; восстанавливаем смещение
		mov cx, 5		; массив из 5 элементов
		mov dx, 3000h 	; номер порта
		call transfer
		
		mov ax, 0A000h
	    mov ds, ax
	    mov si, 5738h
	    mov cx, 6
	    mov dx, 5000h
		call transfer
	
code ends
end start