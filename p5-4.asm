assume cs:codesg
codesg segment
	mov ax, cs
	mov ds, ax
	mov ax, 2000h
	mov es, ax
	mov bx, 0
	mov cx, 017h
  s:mov al, [bx]
	mov es:[bx], al
	inc bx
	loop s
	
	mov ax, 4c00h
	int 21h
	
codesg ends
end