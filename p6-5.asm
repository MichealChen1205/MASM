assume cs:codesg
a segment
	db 1, 2, 3, 4, 5, 6, 7, 8
a ends

b segment 
	db 1, 2, 3, 4, 5, 6, 7, 8
b ends

c segment
	db 1, 2, 3, 4, 5, 6, 7, 8
c ends

codesg segment
start: 	mov ax, a
		mov ds, ax
		mov ax, c
		mov es, ax
		
		mov bx, 0
		mov cx, 8
	 s: mov al, ds:[bx]
		mov ah, ds:[bx + 10h]
		add al, ah
		mov es:[bx], al
		inc bx
		loop s
		mov ax, 4c00h
		int 21h
codesg ends
end start
