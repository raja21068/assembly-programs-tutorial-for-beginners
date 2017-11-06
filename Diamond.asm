.Model small
.Stack 100h
.Data
_SP DB ? ; For space limit
_ST DB ? ; For Starik limit

.Code
Main Proc
	MOV AX, @Data
	MOV DS, AX

	MOV _SP, 10 ; Space limit 10
	MOV _ST, 1  ; Starik start from 1
	MOV CL, 1   ; Counter start

	MOV AH, 2   ; Calling print function

	O_LOOP_1:
		CMP CL, 10      ; Comparing CL with 10 limit
		JG VALUE_SETTER ; Jump IF(CL > 10) VALUE_SETTER;
		
		MOV BL, 1  ; Set BL register value 1
		
		SP_LOOP_1: ; For printing space
			MOV DL, ' ' ; Set DL register value ' '
			INT 21h     ; Generate Signal
			INC BL      ; Increase BL register value (BL++)
			CMP _SP, BL ; Comparing _SP with BL
		JGE SP_LOOP_1         ; JUMP IF (_SP >= BL) SP_LOOP;

		DEC _SP   ; Decrease _SP value (_SP--)
		MOV BL, 1 ; Set BL register value 1

		ST_LOOP_1: ; For printing Starik
			MOV DL, '*'  ; Set DL register value ' '
			INT 21h      ; Generate Signal
			INC BL       ; Increase BL register value (BL++)
			CMP _ST, BL  ; Comparing ST with BL
		JGE ST_LOOP_1

		INC _ST  ; Increase _ST Value
		INC _ST  ; Increase _ST Value
		INC CL   ; Increase CL Value
		
		MOV AH, 2
	    	MOV DL, 0DH
		Int 21h
	    	MOV DL, 0AH
		Int 21h
	JMP O_LOOP_1

	VALUE_SETTER:
		DEC CL
		DEC _ST
		DEC _ST
		DEC _ST
		DEC _ST
		INC _SP
		INC _SP

	O_LOOP_2:
		CMP CL, 1  ; Comparing CL with 1 limit
		JLE EXIT   ; Jump IF(CL < 1) EXIT;
		
		MOV BL, 1  ; Set BL register value 1
		
		SP_LOOP_2: ; For printing space
			MOV DL, ' ' ; Set DL register value ' '
			INT 21h     ; Generate Signal
			INC BL      ; Increase BL register value (BL++)
			CMP _SP, BL ; Comparing _SP with BL
		JGE SP_LOOP_2       ; JUMP IF (_SP >= BL) SP_LOOP_2;

		INC _SP    ; Increase _SP value (_SP++)
		MOV BL, 1  ; Set BL register value 1

		ST_LOOP_2: ; For printing Starik
			MOV DL, '*'  ; Set DL register value ' '
			INT 21h      ; Generate Signal
			INC BL       ; Increase BL register value (BL++)
			CMP _ST, BL  ; Comparing ST with BL
		JGE ST_LOOP_2        ; JUMP IF (_ST >= BL) ST_LOOP_2;

		DEC _ST  ; Increase _ST Value
		DEC _ST  ; Increase _ST Value
		DEC CL   ; Increase CL Value
		
		MOV AH, 2
	    	MOV DL, 0DH
		Int 21h
	    	MOV DL, 0AH
		Int 21h
	JMP O_LOOP_2

	EXIT:
	    MOV AH, 4ch
    	    Int 21h
Main EndP
End Main