assume cs:codesg, ds:datasg, ss:stacksg
stacksg segment
	dw 8 dup(0)
stacksg ends

datasg segment
	year db '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982'
		 db	'1983', '1984', '1985', '1986', '1987', '1988', '1989', '1990'
		 db	'1991', '1992', '1993', '1994', '1995'
	summ dd 16, 22, 123, 1234, 2345, 4567, 12345, 23456, 34567, 123456, 234567
		 dd	345678, 456789, 745678, 1234567, 2345678, 3456789, 4567890, 612345, 42345678, 6123456
	num	 dw 3, 7 ,9 ,18, 24, 56, 108, 299, 456, 789, 1000, 1500, 2300
		 dw	3000, 5000, 6000, 7000, 10000, 15000, 20000, 30000
	avg  dw 10, 20, 30, 40, 50 ,100, 200, 300, 500, 800, 1000, 1500, 4000, 8000
		 dw	10000, 12000, 15000, 20000, 30000, 40000, 50000
	flag dw 4 dup(0)
datasg ends

table segment
	db 21 dup('year summ ne ?? ')
table ends

codesg segment
	start:	mov ax, stacksg
			mov ss, ax
			mov sp, 010h
			mov ax, datasg
			mov ds, ax
			mov ax, table
			mov es, ax
			 
			mov bx, 0
			mov cx, 21
			
		s0: mov si, 0
			mov di, word ptr [flag]
			mov ax, word ptr [year + di]
			mov dx, word ptr [year +di + 2]
			mov word ptr es:[bx + si],  ax
			mov word ptr es:[bx + si + 2], dx
			add word ptr [flag], 4
			
			mov si, 05h
			mov di, word ptr [flag + 2]
			mov ax, word ptr [summ + di]
			mov dx, word ptr [summ + di + 2]
			mov word ptr es:[bx + si],  ax
			mov word ptr es:[bx + si + 2], dx
			add word ptr [flag + 2], 4
			
			mov di, word ptr [flag + 4]
			mov si, 0ah
			mov ax, word ptr [num + di]
			mov word ptr es:[bx + si], ax
			add word ptr [flag + 4], 2
			
			mov di, word ptr [flag + 6]
			mov si, 0dh
			mov ax, word ptr [avg + di]
			mov word ptr es:[bx + si], ax
			add word ptr [flag + 6], 2
			add bx, 16
			loop s0
			
			mov ax, 4c00h
			int 21h
			
codesg ends
end start