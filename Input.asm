.Model small
.Stack 100h
.Data 
a db ?

.Code
Main Proc
	MOV ax, @data
	mov ds, ax
	
	Mov AH, 1
	Int 21h
	MOV a, AL
	SUB a, 30h
	
	MOV AH, 2
	MOV DL, 0DH
	Int 21h
	MOV DL, 0AH
	Int 21h

    Mov AH, 1
	Int 21h
	MOV BL, AL
	SUB BL, 30h
	
	MOV AH, 2
	MOV DL, 0DH
	Int 21h
	MOV DL, 0AH
	Int 21h
	
	MOV AL, a
	ADD AL, BL
	
	Mov AH, 2
	Mov DL, AL
	ADD DL, 30h
	Int 21h
	
	Mov AH, 4ch
	Int 21h
Main Endp
End Main
	
