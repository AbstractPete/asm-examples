.386

name default

; constants

data segment use16
	; vars
	X1 db  34h, 21h, 98h, 53h, 22h, 23h
	Y1 db 6 DUP (0)  
	
	X2 db  25h, 32h, 77h, 56h, 99h
	Y2 db 6 dup (0)
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	find macro arr,len,res
		local M1,M2
		
		
		lea si,arr
		lea di,res
		mov dx,len
		xor ax,ax
		xor bx,bx
		M1:	mov al,[si]
		
			test bx,1
			jnz M2
			
			ror al,4
			mov [di],al
			inc di
		
		M2: inc si
			inc bx
			dec dx
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
		
		find X1,6,Y1
		
		find X2,6,Y2
	
code ends
end start