.386

name default

; constants

	


data segment use16
	; vars
	x1	dw 1245h
		dw 1456h
		dw 5732h
	y1	dd ?
	
	x2	db 8312h
		db 7383h
		db 2833h
	y2	dd ?
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	
	find proc
		
			push bp
			mov bp,sp
			
			mov cx,[bp + 4]
			mov di,[bp + 6]
			mov si,[bp + 10]
			mov bx,cx
			xor dx,dx
		M1:	mov ax,[si]
			add [di],ax
			adc dx,0
			
			inc si
			inc si
			
			dec cx
			jnz M1
			
			mov ax, [di]
			div bx
			
			mov [di],ax
			mov [di + 2],dx
		
		pop bp	
		ret 6
	find endp
	
	
	
	
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
		
		
		lea ax,x1
		push ax
		lea ax,y1
		push ax
		mov ax,3
		push ax
		call find
	
	
		lea ax,x2
		push ax
		lea ax,y2
		push ax
		mov ax,3
		push ax
		call find
		
		
		
	
code ends
end start