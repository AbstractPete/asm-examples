.386

name default

; constants
	
	


data segment use16
	; vars
	table db 0, 1, 2 dup (?), 2, 4 dup (?), 3, 6 dup (?), 4, 8 dup (?), 5, 10 dup (?), 6
	x1 db 1, 4, 9, 4, 16, 25
	x2 db 16, 36, 25, 36
	y1 db 6 dup (0)          
	y2 db 6 dup (0)
	
	
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	sqrt proc
		M1:	mov al,[si]
			xlat table
			mov [di],al
			
			inc si
			inc di
			
		
		loop M1
		ret
	sqrt endp
	

	
	
	
	
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
		
		lea si,x1
		lea di,y1
		lea bx,table
		mov cx,6
		call sqrt
		
		lea si,x2
		lea di,y2
		lea bx,table
		mov cx,4
		call sqrt
	
	
code ends
end start