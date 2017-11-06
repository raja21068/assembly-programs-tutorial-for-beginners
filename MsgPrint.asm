.Model small
.stack 100h
.Data
MSG DB 'Hello Assembly$'

.code
Main Proc
  MOV AX, @Data
  MOV DS, AX

  MOV AH, 9
  LEA DX, MSG
  Int 21h

  MOV AH, 4ch
  Int 21h
Main EndP
End Main

