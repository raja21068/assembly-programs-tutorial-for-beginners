.Model small
.Stack 100h
.Data 
a DB 5

.Code
Main Proc 
	Mov AX, @Data
	Mov DS, AX
	
	Mov AL, a
	CBW
	MOV BL, 7
	DIV BL
	
	Mov AH, 2
	Mov DL, AL
	Add DL, 30h
	Int 21h
	
	Mov AH, 4ch
	Int 21h
Main Endp
End Main
	
