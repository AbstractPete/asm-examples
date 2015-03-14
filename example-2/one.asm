.386

name default

; constants
	
	


data segment use16
	; vars
	array 	dd 12341234h
			dd 23456789h
			dd 32783678h
			dd 39237333h
	result  dw 3 dup(0Ah)
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	addition proc
		M1:	xor bx,bx ; clean reg
		
			mov ax,[si]
			mov dx,[si + 2]
			
			xor ax,dx
			xor al,dl
			
			jpo M2
			
			mov ax,[si] ; 
			
			add [di],ax
			adc [di + 2],dx
			adc [di + 4],bx
			
		M2:	add si,4
			dec cx
			jnz M1
	
	addition endp
	
	

	
	
	
	
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
		
		
		;loads 
		lea si,array
		lea di,result
		mov cx,(offset result - offset array)/ type array
		
		call addition
	
	
code ends
end start