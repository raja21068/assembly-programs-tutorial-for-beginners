.Model small
.Stack 100h

.Code
Main Proc
	MOV CL, 1
	MOV AH, 2

	O_LOOP:
		CMP CL, 10
		JG EXIT
		
		MOV BL, 1
		
		I_LOOP:
			MOV DL, '*'
			;ADD DL, 30h
			INT 21h
			INC BL
			CMP CL, BL
		JGE I_LOOP
		
		INC CL
		
		MOV AH, 2
    	MOV DL, 0DH
	    Int 21h
    	MOV DL, 0AH
	    Int 21h
		
	JMP O_LOOP
	EXIT:
		MOV AH, 4ch
    	Int 21h
Main EndP
End Main
