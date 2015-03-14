.386

name default

; constants
	
	


data segment use16
	; vars
	x1 dw 1234h, 4567h, 4321h, 6542h
	x2 dw 2564h, 3245h, 1254h, 5212h
	y1 dw 4 dup(?)
	y2 dw 4 dup(?)
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	odd macro length_arr,array,result
		local M1,M2
		
			mov cx,length_arr
			
			lea si,array
			lea di,result
			
		M1:	mov ax,[si]
			test ax,1
			jnz M2
			
			mov [di],ax
			inc di
			inc di
		
		M2:
			inc si
			inc si
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
		
		odd 4,x1,y1
		
		odd 4,x2,y2
		
code ends
end start