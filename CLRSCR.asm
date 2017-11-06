.Model small
.Stack 100h

.Code
Main Proc
    mov AX, 3
    int 10h

	MOV AH, 4ch
	INT 21h
Main EndP
End Main
