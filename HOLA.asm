.model small	;usamos la direcctiva model para definir el tamaño del programa
				;tenemos segmento de datos cercanos
.stack	;definimos la utilizacion de una pila para almacenar datos con la directiva .tack
.data ;usamos la directiva .data para predefinir el segmento de datos
saludo db "Hola mundo!!!", "$";creamos una etiqueta con un mensaje en el segmento de datos
.code;usamos la directiva .code para marcar el incio de las instrucciones a ejecutar
main proc ;}aqui incia nuestro conjunto de intrucciones
mov ax,seg saludo;almacenamos en ax el contenido del segmento, en este caso el saludo
mov ds,ax ;almacenamos el contenido de ax en ds
lea dx,saludo ;usamos la directiva lea para mandar el contenido de nuestra etiqueta saludo y mostrarlo
int 21h ;Usamos la interrupcion 21h
int 21h ;Usamos la interrupcion 21h 
main endp ;Terminamos el proceso
end main;terminamos el programa



.model small ;usamos la direcctiva model para definir el tamaño del programa
			 ;tenemos segmento de datos cercanos
.stack ;definimos la utilizacion de una pila para almacenar datos con la directiva .tack
.data ;usamos la directiva .data para predefinir el segmento de datos
saludo db "Hola mundo","$" ;creamos una etiqueta con un mensaje
.code ;usamos la directiva .code para marcar el incio de las instrucciones a ejecutar
main proc ;aqui incia nuestro conjunto de intrucciones
mov ax,seg @data ;almacenamos en el registro de propocito general ,ax, el contenido del segmento
mov ds,ax ;movemos al segmento de datos el contenido del registro ax
mov ah,09h ;llamamos a la funcion de la interrupcion 21h,09, y lo pasamos a la parte alta del registro a
lea dx,saludo ;usamos la directiva lea para mostrar el contenido de nuestro mensaje
int 21h ;usamos la interrupcion 21h
.exit ;usamos la directiva .exit para llamar a la funcion MSDos para terminar la ejecucion
main endp ;aqui termina nuestro conjunto intrucciones
end ;marcamos el fin de nuestro ensamblado
