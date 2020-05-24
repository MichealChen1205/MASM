assume cs:code
data segment
	dd 12345678h
data ends

code segment
start: 	mov ax, data
		mov ds, ax
		mov bx, 0
		mov [bx], bx
		mov [bx + 2], cs
		jmp dword ptr [bx]
		
code ends
end start
