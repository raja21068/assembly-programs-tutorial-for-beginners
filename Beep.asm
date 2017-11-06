.Model small
.Stack 100h

.Code
Main Proc
	MOV AH, 2
	MOV DL, 7       ;07h is the value to produce the beep tone
	INT 21h         ;produce the sound
	
	MOV AH, 4ch
	INT 21h
Main EndP
End Main
