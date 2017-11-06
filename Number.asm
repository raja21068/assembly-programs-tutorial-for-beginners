.Model small
.Stack 100h
.Data
_msg DB 'Enter Number: $'
_pos DB 'Positive$'
_neg DB 'Negative$'

.Code
Main Proc
	MOV AX, @Data
	MOV DS, AX
	
	MOV AH, 9
	LEA DX, _msg
	INT 21h

	MOV AH, 1
	INT 21h
	
	CMP AL, 0
	JG IF_BLOCK
	JMP ELSE_BLOCK
	
	IF_BLOCK:
		MOV AH, 9
		LEA DX, _pos
		INT 21h
		JMP LAST
	ELSE_BLOCK:
		MOV AH, 9
		LEA DX, _neg
		INT 21h
		JMP LAST
	LAST:
		MOV AH, 4ch
    	Int 21h
Main EndP
End Main	