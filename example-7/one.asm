.386

name default

; constants

	


data segment use16
	; vars
	x	db 1,2,5,5,5,5
		db 25,50,50,50,50,50
		db 48,3,3,0,5,0
	y	db 3 dup(6 dup(?))
	
	x1	db 1,4,15,1,0,0
		db 30,2,2,2,1,5
		db 88,0,0,0,0,0
	y1	db 3 dup(6 dup(?))
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	ASSUME CS: code, DS: data, ES: data, SS: stack
	
	
	find proc
		
			push bp
			mov bp,sp
			
			mov cl, byte ptr [bp + 4] ; l
			mov dl,byte ptr[bp + 6] ; m
			mov bx,[bp + 10] ; x
			mov bp,[bp + 8]; y
			
		M3:	xor ax,ax
			xor si,si
			mov ch,6
			
		M1:	mov al,[bx+si]
			aad
			div dl
			inc si
			dec ch
			jnz M1
			
			cmp ah,0
			jne M2
			
		M4:	mov ch,6
			xor si,si
			mov al,[bx + si]
			mov ds:[bp + si],al
			inc si
			dec ch
			jnz M4
			add bp,6
			
		M2:	add bx,6
			dec cl
			jnz M3 
			
		ret 8
	find endp
	
	
	
	
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
		
		
		lea si,x ; addr x
		push si
		lea si,y ; addr y
		push si
		mov ax,5 ; Multiplicity
		push ax
		mov ax,3 ; length array
		push ax
		call find
		
		lea si,x1
		push si
		lea si,y2
		push si
		mov ax,9 ; Multiplicity
		push ax
		mov ax,3
		push ax
		call find
		
		
		
	
code ends
end start