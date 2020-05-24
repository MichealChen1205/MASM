assume cs:codesg, ds:datasg
datasg segment
	a dw 0fffh
datasg ends

codesg segment
	start: 
	mov ax, datasg
	mov ds, ax
	mov ax, word ptr [a]
	
	mov ax, 4c00h
	int 21h
codesg ends
end start