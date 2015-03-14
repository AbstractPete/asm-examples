.386

name default

; constants
	
	


data segment use16
	; vars
	x1 	dd 12345679h
		dd 34219191h
		dd 34531232h
		dd 89301212h
	 
	y1 dd 4 dup (0)
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	odd macro x,y,n
			lea si,x
			lea di,y
			mov cx,n
		M1:
			mov ax, [si]
			mov dx, [si + 2]
			
			xor ax,dx
			xor al,dl
			
			jpe M2
			
			mov ax,[si]
			mov [di],ax
			mov [di + 2],dx
			add di,4
			
		M2: add si,4
			dec cx
			
			jnz M1
	
	
	endm
	

	
	
	
	
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
	
		odd x1,y1,4
	
code ends
end start