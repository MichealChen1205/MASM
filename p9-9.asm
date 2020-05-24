assume cs:codesg, ds:datasg, ss:stacksg
stacksg segment
	dw 16 dup(0)
stacksg ends

datasg segment
	text db 'Welcome to masm!'
	color db 10001010b, 10101100b, 11111001b
datasg ends

codesg segment
start:	mov ax, stacksg
		mov ss, ax
		mov sp, 010h
		mov ax, datasg
		mov ds, ax
		mov ax, 0b800h
		mov es, ax
		mov bx, 0820h  ;第十二行显示绿色   第十三行显示绿底红色  第十四行显示白底蓝色
		mov si, 0		;符号设置的地址偏移
		mov di, 0		;颜色设置的地址偏移
		
		mov cx, 03h
		;外循环每增加一次，跳到下一行设置，并且改变颜色
	s0: mov ah, byte ptr [color + di]
		push cx
		push di
		mov di, 0
		mov si, 0
		mov cx, 010h
		;内循环设置第12+N行符号和颜色
	s1:	mov al, byte ptr [text + di]
		mov es:64[bx + si], al			;复制符号
		mov es:65[bx + si], ah			;复制颜色
		add si, 2
		inc di;
		loop s1
		;结束内循环   
		pop di
		pop cx
		inc di
		add bx, 0a0h
		loop s0
		;结束外循环
		mov ax, 4c00h
		int 21h
codesg ends
end start
