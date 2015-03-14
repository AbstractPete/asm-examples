.386

name default

; constants
	

data segment use16
	; vars
	x1  dd 0FFDF3B65h  
	    dd 75BCD15h
	    dd 0F09088CDh
	    dd 0DCED5F7h
	    dd  77AA725h
	y1  dq 0     
	x2  dd 64558866h
	    dd 32332552h
	    dd 36235555h
	    dd 33665566h
	y2  dq 0
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	 ASSUME CS: Code, DS: Data, ES: Data, SS: Stack
	adds macro array,length,result
		LOCAL M1
			lea si,array
			lea di,result
			mov cx,length
			xor dx,dx
		
		M1: mov ax,[si]
			add [di],ax
			cwd
			mov ax,[si + 2]
			adc [di + 2],ax
			adc [di + 4],dx
			
			add si,4
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
	
		adds x1,5,y1
		
		adds x2,5,y2
	
code ends
end start