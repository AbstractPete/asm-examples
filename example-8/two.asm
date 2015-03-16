.386

name default

; constants
	mask1 = 11010000b ; d7-d4
	mask2 = 00010100b ; d4-d2
	


data segment use16
	; vars
	x1 dw 0145h,034Ah,1234h,135Fh
	y1 dw 4 dup(?)
	x2 dw 923Fh,0EE23h,0D384h,0ACDFh
	y2 dq 4 dup(?)
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	find macro arr,len,res,mask,clear
		local M1,M2
		
			lea si, arr
			lea di, res
			mov dx,mask
			mov cx,len
			
		M1: mov ax,[si]
			and ax,clear
			
			cmp ax,mask
			jne M2
			mov ax,[si]
			mov [di],ax
			add di,2
			
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
		
		find x1,4,y1,mask1,11110000b ; or 0F0h delete d3-d0
		
		find x2,4,y2,mask2,00001110b ; 03h
	
code ends
end start