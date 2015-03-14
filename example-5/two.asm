.386

name default

; constants
	
	


data segment use16
	; vars
	x1 db 9,9,9,9,9     		; 99999
	     db 6,7,8,9,2		; 29876
	     db 3,4,5,6,7    		; 76543
	y1 db 6 dup (0)      
	
	x2 db 1,2,3,4,5
	     db 3,4,5,6,7
	     db 9,8,8,3,4
	y2 db 6 dup (0)
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	sum macro x,y,n
			local M1,M2
			lea si,x
			lea di,y
			mov cl,n ;arr length
			mov ch,5 ; parts of number
			xor ax,ax
		
		M1: clc
		M2: xor al,al
			mov al,[si]
			adc al,[di]
			aaa
			mov [di],al
			inc si
			inc di
			dec ch
			jnz M2
			
			add [di], ah		
			mov ch, 5		
			lea di, y     		
			dec cl
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
		
		sum x1,y1,3
		
		sum x2,y2,3
	
code ends
end start