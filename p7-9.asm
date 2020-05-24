assume cs:codesg, ds:datasg, ss:stacksg
stacksg segment
	sd dw 0, 0, 0, 0, 0, 0, 0, 0
stacksg ends

datasg segment
	d1 db '1. display      '
	d2 db '2. brows        '
	d3 db '3. replace      '
	d4 db '4. modify       '
datasg ends

codesg segment
start: 	mov ax, stacksg
		mov ss, ax
		mov sp, 10h
		mov ax, datasg
		mov ds, ax
		
		mov bx, 0
		mov cx, 4
	s0: push cx
		mov si, 0
		mov cx, 4
	s1: mov al, byte ptr 3[bx + si]
		and al, 11011111b
		mov byte ptr 3[bx + si], al
		inc si
		loop s1
		pop cx
		add bx, 010h
		loop s0
		
		mov ax, 4c00h
		int 21h

codesg ends
end start