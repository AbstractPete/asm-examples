.386
; constants
	
	


data segment use16
	x1 dd 0ff128934h ; x1 & x2 - 2 dwords array
	   dd 12341234h
	x2 dd 13748478h
	   dd 14563738h
	y  dd 3 dup(66666666h) ; fill result array sevens, better view in debugger
							 ; we need 3 words for result  _ _ _ _ |_ _ _ _ | _ _ _ _
data ends

stack segment use16
	dw 16 dup(?)
	head label word
stack ends

code segment use16
	
	;macro
	substruction macro minuend_addr,subtrahend_addr,difference_addr
		lea si,minuend_addr
		lea di,subtrahend_addr
		lea bx,difference_addr
		
		mov cx, (offset x2 - offset x1)/type x1
	f1:	clc
		mov ax, word ptr [si]
		sbb ax, word ptr [di]
		mov [bx],ax
		
		inc si
		inc si
		inc di
		inc di
		inc bx
		inc bx
		
		mov ax, word ptr [si]
		cwd
		mov[bx],ax
		mov[bx + 2],dx
		
		mov ax, word ptr[di]
		cwd
		
		sbb [bx],ax
		sbb[bx+2],dx
		
		
		inc si
		inc si
		inc di
		inc di
		inc bx
		inc bx
		inc bx
		inc bx
		dec cx
		jnz f1
		
		
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
		
		
		substruction x1,x2,y
		
	
	
	
code ends
end start