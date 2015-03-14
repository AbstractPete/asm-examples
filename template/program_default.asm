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
	
	
	
code ends
end start