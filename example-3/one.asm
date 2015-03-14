.386

name default

; constants
	


data segment use16
	; vars
	x1 db 74h,76h
	   db 45h,33h
	   db 48h,70h
	y1 db 6 dup(00h) ; 74,76,70
	
	x2 db 34h,76h
	   db 35h,33h
	   db 38h,70h
	y2 db 6 dup(00h) ; 34,35,33,38
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
		assume cs:code,ds:data,es:data,ss:stack
		
	chooser proc
		M1 :mov al,[si] 
			and al,11110000b;  (any number)0 example 78 -> 70 
			cmp al,dl;  ; compare with mask
			jne M2 ; if number not starts with 7, not equal
			mov al,[si]
			mov[di],al
			inc di
		M2:	inc si			
			dec cx
			jnz M1
			
	ret
	chooser endp
	

	
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
		mov cx,(offset y1 - offset x1)/type x1
		mov dl,01110000b ; 7 mask
		call chooser
		
		lea si,x2
		lea di,y2
		mov cx,(offset y2 - offset x2)/type x2
		mov dl,00110000b ; 3 mask
		call chooser
		
		
	
code ends
end start