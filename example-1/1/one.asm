.386
name program

data segment use16
	x0 dd 12341234h 
	   dd 12341234h
       dd 12341234h
       dd 12341234h
	y0 dd 11111111h
       dd 11111111h
       dd 11111111h
       dd 11111111h
	z0 dw 3 dup(4 dup(?))
	x1 dd 4 dup(?)
	y1 dd 4 dup(?)
	z1 dw 3 dup(4 dup(?))
data ends

stack segment use16
	dw 16 dup(?)
	top label word
stack ends

code segment use16
	assume cs:code, ds:data,es:data,ss:stack
	; our procedure
	substract proc
		push bp ; put  base address of stack
		
		mov bp,sp ; move stack pointer in base reg
		
		; grab params
		
		mov cx,[bp + 4] ; get 4th parameter
		
		mov bx,[bp + 6] ; 3rd - z0
		
		mov di,[bp + 8] ; 2nd - y0
		
		mov si,[bp + 10] ; 1st - x0
		
		; ready to compute)
		
		step1 :
			xor dx,dx ; reset reg
			
			mov ax,[si] ; load low word by addr in reg si
		    sub ax, word ptr [di] ; substraction x - y
			mov [bx],ax ; store result of low words
			
			mov ax,[si + 2] ; high word
			cwd ; sign in dx
			mov[bx + 2],ax
			mov[bx + 4],dx
			
			mov ax, [di+2]
			cwd
			sbb[bx +4],ax
			sbb[bx + 6],dx
			
			add si,4
			add di,4
			add bx,6
			
			loop step1
			pop bp
			
			ret 8
	substract endp
	
	
	
	
	start:
		;system
		mov ax,data
		mov ds,ax
		mov es,ax
		;stack
		mov ax,stack
		mov ss,ax
		mov sp, offset top
		;store state of registers in stack
		;pusha
		;passing parameters in stack 
		
		lea ax,x0
		push ax
		lea ax,y0
		push ax
		lea ax,z0
		push ax
		mov ax,4 ; length of array
		push ax
		
		call substract
		
		;next array
		lea ax,x0
		push ax
		lea ax,y0
		push ax
		lea ax,z0
		push ax
		mov ax,4 ; length of array
		push ax
		
		call substract
		
		;restore registers
		;popa
		;that's all folks!
		
code ends

end start