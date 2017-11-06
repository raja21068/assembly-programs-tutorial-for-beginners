.Model small
.Stack 100h
.Data
A DW 2
B DW 3

.Code
Main Proc
	MOV AX, @Data
	MOV DS, AX
	
	MOV AX, A

	CMP AX, B 
	JL IF_BLOCK ;AX < B JUMP to IF_BLOCK
	JMP ELSE_BLOCK
IF_BLOCK:
	MOV AH, 2 ;print 3
	MOV DX, B
;	NOT DX
;	ADD DX, 1
	ADD DX, 30h
	INT 21h
	JMP ENDAS
ELSE_BLOCK:
	MOV AH, 2 ;print 2
	MOV DX, AX
	ADD DX, 30h
	INT 21h
	JMP ENDAS
ENDAS:
	MOV AH, 4ch
    Int 21h
Main EndP
End Main
