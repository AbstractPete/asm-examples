.386

name default

; constants
	MAX1 = 3000
	MAX2 = -5000
	


data segment use16
	; vars
	x1 dw 10, 20, 3000, 3100, -200, 3300
	y1 dd ?
	x2 dw  3000, -5100, 2500, -855, 60, -90
	y2 dd ?
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	find macro arr,len,res,factor
		local M1,M2
		
			lea si,arr
			lea di,res
			lea bx,y
			mov cx,len
		M1: mov ax,[si]
			cmp ax,factor
			
			jg M2 ; if greater go to M2
			
			cwd
			add [di],ax
			adc [di + 2],dx
			
			inc di
			inc di
			
			
		M2:	add si,2
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
		
		find x1,6,y1,MAX1
		
		find x2,6,y2,MAX2
	
code ends
end start