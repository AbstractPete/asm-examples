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
	
	
	
	
	; init data
	mov ax,data
	mov ds,ax
	mov es,ax
	; init stack
	mov ax,stack
	mov bp,ax
	mox sp,offset head
	
	
	
	
	start:
	
		;code here
	
	
	
code ends
end start