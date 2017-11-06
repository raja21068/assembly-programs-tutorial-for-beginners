.Model small
.stack 100h
.data
msg1 DB 'Read 1st Value: $'
msg2 DB 'Read 2nd Value: $'
msg3 DB 'Sum of two value is: $'
A db ?
sum db ?

.code
Main Proc
  MOV AX,@data 
  MOV DS,AX

  MOV AH, 9
  LEA DX, msg1
  INT 21h
 
  MOV AH, 1
  Int 21h
  MOV A, AL

  MOV AH, 2
  MOV DL, 0DH
  Int 21h
  MOV DL, 0AH
  Int 21h

  MOV AH, 9
  LEA DX, msg2
  INT 21h

  MOV AH, 1
  Int 21h
  MOV BL, AL
  SUB BL,30h

  MOV AH, 2
  MOV DL, 0DH
  Int 21h
  MOV DL, 0AH
  Int 21h

  SUB A, 30h

  MOV AH, 9
  LEA DX, msg3
  INT 21h

  MOV AL, A
  ADD AL, BL
  MOV SUM, AL

  MOV AH, 2
  MOV DL, SUM
  add DL, 30h
  Int 21h

  MOV AH, 4ch
  Int 21h
Main EndP
End Main
