assume cs:codesg, ds:datasg
datasg segment
	db 'BaSic'
	db 'iNfOrNaTiOn'
datasg ends

codesg segment
start:  
		mov ax, datasg
		mov ds, ax
	
		mov bx, 0
		mov cx, 5
	s0: mov al, ds:[bx]
		and al, 11011111b
		mov ds:[bx], al
		inc bx
		loop s0
		
		mov bx, 5
		mov cx, 11
	s1: mov al, ds:[bx]
		or al, 00100000b
		mov ds:[bx], al
		inc bx
		loop s1
	
		mov ax, 4c00h
		int 21h
codesg ends
end start