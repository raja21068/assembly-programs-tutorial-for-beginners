.Model small
.Stack 100h
.Data 
a DW 5
b DW 4

.Code
Main Proc 
	Mov AX, @Data
	Mov DS, AX
	
	Mov AX, a
	ADD AX, b
	
	Mov AH, 2
	Mov DX, AX
	Add DX, 30h
	Int 21h
	
	Mov AH, 4ch
	Int 21h
Main Endp
End Main
	