.Model small
.Stack 100h
.Data
msg1 DB 'Read 1st Value: $'
msg2 DB 'Read 2nd Value: $'
msg3 DB 'Sum of two value is: $'
A DB ?
B DB ?

.Code
Main Proc
	MOV AX, @Data
	MOV DS, AX
	
	MOV AH, 9
	LEA DX, msg1
	INT 21h
	
	MOV AH, 1
	INT 21h
	MOV A, AL
	SUB A, 30h
	
	MOV AH, 2
	MOV DL, 0dh
	INT 21h
	MOV DL, 0ah
	INT 21H
	
	MOV AH, 9
	LEA DX, msg2
	INT 21h
	
	MOV AH, 1
	INT 21h
	MOV B, AL
	SUB B, 30h
	
	MOV AH, 2
	MOV DL, 0dh
	INT 21h
	MOV DL, 0ah
	INT 21H
	
	MOV AH, 9
	LEA DX, msg3
	INT 21h
	
	MOV AL, A
	ADD AL, B
	
    MOV AH, 2
	MOV DL, AL
    ADD DL, 30h
	INT 21h
	
	MOV AH, 4ch
	INT 21h
Main EndP
End Main