assume cs:code, ds:data, ss:stack
data segment
	dw 0012h, 0023h, 0034h, 0045h, 0056h, 0067h, 0078h, 0089h
data ends

stack segment
	dw 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
stack ends
	
code segment
start:	mov ax, stack
		mov ss, ax
		mov sp, 20h
		mov ax, data
		mov ds, ax
		
		mov bx, 0
		mov cx, 8
	s0: push [bx]
		add bx, 2
		loop s0
		
		mov bx, 0
		
		mov cx, 8
	s1: pop [bx]
		add bx, 2
		loop s1
	
		mov ax, 4c00h
		int 21h
code ends
end start