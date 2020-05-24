assume cs:code
code segment
start: 	mov ax, 2000h
		mov ds, ax
		mov bx, 0
	 s: mov cl, [bx]
		mov ch, [bx]
		inc bx
		inc cx
		loop s
	ok: mov dx, bx
		mov ax, 4c00h
		int 21h
code ends
end start