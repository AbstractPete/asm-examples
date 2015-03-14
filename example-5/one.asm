.386

name default

; constants
	
	


data segment use16
	; vars
	
	
	
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	
	copy proc
		M1: mov ax,ds:[si]
			mov es:[di],ax
			
			add si,2
			add di,2
			
		loop M1
		ret
	copy endp
	
	
	
	
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
		
		;ABCDEh è 725h => ABCD|000Eh 0720|0005h
		mov ax,0ABCDh
		mov ds,ax
		mov si,000Eh
		mov di,0
		mov cx,4
		call copy
		
		
		mov ax,0720h
		mov ds,ax
		mov si,0005h
		mov di,0
		mov cx,5
		call copy
	
code ends
end start