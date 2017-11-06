.Model small
.Stack 100h
.Data
_SP DB ?    ; For sapce limit
_ST DB ? ; For Starik limit

.Code
Main Proc
	MOV AX, @Data
	MOV DS, AX

	MOV _SP, 10 ; Space limit 10
	MOV _ST, 1  ; Starik start from 1
	MOV CL, 1   ; Counter start

	MOV AH, 2   ; Calling print function

	O_LOOP:
		CMP CL, 10  ; Comparing CL with 10 limit
		JG EXIT ; Jump IF(CL > 10) EXIT;
		
		MOV BL, 1  ; Set BL register value 1
		
		SP_LOOP: ; For printing space
			MOV DL, ' ' ; Set DL register value ' '
			INT 21h     ; Generate Signal
			INC BL      ; Increase BL register value (BL++)
			CMP _SP, BL ; Comparing _SP with BL
		JGE SP_LOOP         ; JUMP IF (_SP >= BL) SP_LOOP;

		DEC _SP   ; Decrease _SP value (_SP--)
		MOV BL, 1 ; Set BL register value 1

		ST_LOOP: ; For printing Starik
			MOV DL, '*'  ; Set DL register value ' '
			INT 21h      ; Generate Signal
			INC BL       ; Increase BL register value (BL++)
			CMP _ST, BL  ; Comparing ST with BL
		JGE ST_LOOP

		INC _ST
		INC _ST
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
