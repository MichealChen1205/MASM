assume cs:code
code segment
start	mov ax, 2d
		mov cx, 11d
	s: add ax, ax
		loop s
	
		mov ax, 4c00h
		int 21h
code ends
end start