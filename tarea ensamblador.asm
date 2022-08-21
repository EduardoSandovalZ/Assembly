.model small
.stack 100h
.data

msg db "Ingrese la contrasenia: ", "$"
pswd db '1','2','3','4'
count dw 4
correcta db "contrasenia correcta", "$"
incorrecta db "contrasenia incorrecta", "$"

.code
inicio: 
print_location macro texto,x,y
		mov ah,02h
		mov bh,00d
		mov dh,10;posicion en y
		mov dl,23;posicion en x
		int 10h 

		mov ah,9h
		lea dx,msg
		int 21h 		
	endm     
.startup
		;marco
        ;vertical, izquierda
		mov ax,0600h
		mov bh,70h;color
		mov ch,0 ;punto incial abajo
		mov cl,0
		mov dh,24 ;punto final abajp
		mov dl,0
		int 10h 
		;vertical,derecha
		mov ax,0600h
		mov bh,70h;color
		mov ch,0;punto incial abajo
		mov cl,79;bordes
		mov dh,24 ;punto final abajp
		mov dl,79;bordes
		int 10h        
		;horizontal,arriba
		mov ax,0600h
		mov bh,70h;color
		mov ch,0 ;punto incial abajo
		mov cl,0
		mov dh,0 ;punto final abajo
		mov dl,80
		int 10h
		;horizontal,abajo
		mov ax,0600h
		mov bh,70h;color
		mov ch,24 ;punto incial abajo
		mov cl,0
		mov dh,24 ;punto final abajp
		mov dl,80
		int 10h 
		print_location variable,0,0

        mov ax,@data
        mov ds,ax

        mov cx, count; cx=4
        mov bx, offset pswd; apunta a contraseña

        

        
        lee: mov ah,08
        int 21h ; lee caracter

        cmp al,(bx)
        jne error
        inc bx 
        loop lee
         
         
        mov dx,offset correcta
        mov ah,09
        int 21h
        jmp fin
        
        error: mov dx,offset incorrecta
        mov ah,09h
        int 21h

        fin: mov ah,4ch
        int 21h
        end inicio