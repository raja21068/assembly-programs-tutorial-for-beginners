.Model small
.Stack 100h
.Data
msg1 DB 'Enter 1st Value: $'
msg2 DB 'Enter 2nd Value: $'
msg3 DB 'Choose an operator (+, -, *, /, %): $'
msg4 DB 'Result is: $'
error DB 'Error$'
negs DB '-$'
A DB ?
char DB ?

.code
Main Proc  ; Main code begin
    MOV AX,@data ; All the user data inserted in AX register
    MOV DS,AX    ; AX converted into DS

    MOV AH, 9    ; Print message 
    LEA DX, msg1
    INT 21h	 ;
 
    MOV AH, 1    ; Taking integer input from keyboard
    Int 21h
    MOV A, AL
    SUB A, 30h   ;

    MOV AH, 2    ; For new line
    MOV DL, 0DH
    Int 21h
    MOV DL, 0AH
    Int 21h	 ;

    MOV AH, 9	 ; Print message 
    LEA DX, msg2
    INT 21h	 ;

    MOV AH, 1    ; Taking integer input from keyboard
    Int 21h
    MOV BL, AL
    SUB BL, 30h  ;


    MOV AH, 2    ; For new line
    MOV DL, 0DH
    Int 21h
    MOV DL, 0AH
    Int 21h	 ;

    MOV AH, 9	 ; Print message 
    LEA DX, msg3
    INT 21h	 ;

    MOV AH, 1    ; Taking operator input from keyboard
    Int 21h
    MOV char, AL ;

    MOV AH, 2    ; For new line
    MOV DL, 0DH
    Int 21h
    MOV DL, 0AH
    Int 21h	 ;

    MOV AH, 9	 ; Print message 
    LEA DX, msg4
    INT 21h	 ;
	
    CMP char, '+'  ; Comparision function
    JE _PLUS	 ; IF(AL=='+')
    CMP char, '-'  ; Comparision function
    JE _MINUS	 ; IF(AL=='-')
    CMP char, '*'  ; Comparision function
    JE _MULTI	 ; IF(AL=='*')
    CMP char, '/'  ; Comparision function
    JE _DIV	 ; IF(AL=='/')
    CMP char, '%'  ; Comparision function
    JE _REM	 ; IF(AL=='%')
	
    MOV AH, 9	 ; Print error message on invalid input
    LEA DX, error
    INT 21h	 ;

    JMP _ENDS	 ;Jump at Exit

    _PLUS:         ; Plus Label
        MOV AL, A  ; Move A variable value in AL register
    	ADD AL, BL ; Perform addition function

	JMP _PRINT ; Jump at print label for result print
		
    _MINUS:	     ; Minus Label
	MOV AL, A    ; Move A variable value in AL register
	CMP AL, BL   ; Comparision function
	JL _MINUS_B  ; IF(AL<BL) jump at minusb label
		     ; ELSE		
	SUB AL, BL ; Perform subtraction function (AL = AL - BL) 

        JMP _PRINT ; Jump at print label for result print
			
	_MINUS_B:	; MinusB label
	    MOV AH, 9	; Print negative sign
	    LEA DX, negs 
	    INT 21h	;
			
	    MOV AL, A	; Move A variable value in AL register
	    SUB BL, AL	; Perform subtraction function (AL = BL - AL)
	    MOV AL, BL	; Move BL register value in AL register
			
	    JMP _PRINT  ; Jump at print label for result print
				
    _MULTI:	       ; Multiplication label
	MOV AL, A  ; Move A variable value in AL register
	MUL BL     ; Perform multiplication function (AL = AL * BL)
		
	JMP _PRINT ; Jump at print label for result print
		
    _DIV:	   ; Division label
	MOV AL, A  ; Move A variable value in AL register
	CBW	   ; Extend sign to AH registor
	DIV BL     ; Perform divistion function (AL = AL / BL)

  	JMP _PRINT ; Jump at print label for result print
		
    _REM:	   ; Reminder label
	MOV AL, A  ; Move A variable value in AL register
        CBW	   ; Extend sign to AH registor
	DIV BL     ; Perform divistion function (AL = AL / BL)
		   ; and reminder result stored in AH register
	MOV AL, AH ; Move AH register value in AL register
		
	JMP _PRINT ; Jump at print label for result print
		
    _PRINT:	   ; Print label
	MOV AH, 2  ; Calling display function
	MOV DL, AL ; AL register data moved in DL register
	ADD DL, 30h; Add 30hexadecimal value in DL register
	INT 21h    ; Generate signal

    _ENDS:	   ; Exit label
	MOV AH, 4ch; These lines use to terminate program
	Int 21h    ;
Main EndP
End Main