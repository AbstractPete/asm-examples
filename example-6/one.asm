.386

name default

; constants
 c0 = 576h
 c1 = 1571h	
	


data segment use16
	; vars
	x0 dd 12345478h
	   dd 12718928h
	   dd 12718928h
	   dd 12718928h
	y0 dd 4 dup(?)   
	x1 dd 12345478h
	   dd 12718928h
	   dd 12718928h
	   dd 12718928h
	y1 dd 4 dup(?)
	; --
	x dw ?
	y dw ?
	c dw ?
	l dw ?
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	
	find proc
			mov si,x
			mov di,y
			mov cx,l
			mov bx,c
		
		M1: xor dx,dx
			mov ax,[si + 2] ; high word
			div bx
			mov ax,[si]
			div bx
			
			cmp dx,0
			jne M2 ; if zf = 0 goto M2
			
			mov ax,[si]
			mov [di],ax
			mov ax,[si + 2]
			mov [di + 2],ax
			
			add di,4
			
			
		M2: add si,4
			dec cx
			jnz M1
		ret
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
		
		lea ax, x0
		mov x,ax
		lea ax,y0
		mov y,ax
		mov ax,c0
		mov ax,c
		mov l,4
		call find
		
		lea ax, x1
		mov x,ax
		lea ax,y1
		mov y,ax
		mov ax,c1
		mov ax,c
		mov l,4
		call find
	
code ends
end start