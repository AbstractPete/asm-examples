.386

name default

; constants
	
	


data segment use16
	; vars
	a  dw 2783h     	
	   dw 1234h		
	   dw 1EEFh   
	b  db 23h     	
	   db 0AFh	
	   db 13h 
	y  dd 3 dup (0)      
	
	d  dw 2783h     	
	   dw 1234h		
	   dw 12FFh   
	e  db 32h     	
	   db 0AFh	
	   db 0DDh  		
	y2 dd 3 dup (0) 
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	multiply macro x,x1,y,l
		local M1,M2	
			lea si,x
			lea di,x1,
			lea bx,y
			mov cx,l
		M1: mov al,[di]
			cwd
			imul word ptr[si]
			mov [bx],ax
			mov [bx+2],dx
			
			add si,2
			add di,2
			add bx,4
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
		
		multiply a,b,y,3
		
		multiply d,e,y1,3
	
code ends
end start