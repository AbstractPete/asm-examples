.386

name default

; constants
	min1 = 1000   		; range from 1000 till 2000
	max1 = 2000
	min2 = -5000			; range from -5000 till 5000
	max2 = 5000


data segment use16
	; vars
	x1 dw 4B0h
	   dw 8520h
	   dw 3EDh
	   dw 7D1h
	   dw 384h
	   dw 601h  
	Y1 dw 6 Dup(?)  
    X2 dw 8300h
	   dw 1F4h
	   dw 0F448h
	   dw 13ECh
	   dw 0EC14h
	   dw 0D05h
	Y2 dw 6 dup(?) 
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	find macro arr,len,res,min,max
		local M1,M2
		mov cx,len
		lea si,arr
		lea di,res
		
		M1: mov ax,[si]
			
			cmp ax, min
			jl M2 ; x < min go to M2
			cmp ax, max
			jg M2 ; x > max go to M2
			
			mov ax,[si]
			mov [di],ax
			inc di
			inc di
		
		M2: inc si
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
		
		find X1,6,Y1,min1,max1
		
		find X2,6,Y2,min2,max2
	
code ends
end start