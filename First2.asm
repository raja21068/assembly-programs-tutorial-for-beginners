.Model small
.stack 100h
.Data
v1 DB 'First Value: $'
A DW 5
v2 DB 'Second Value: $'
B DW 3
v3 DB 'Addtion is: $'
dif DW ?

.code
Main Proc
  MOV AX, @Data
  MOV DS, AX

  MOV AX, A
  ADD AX, B
  mov dif, ax

  MOV AH, 9
  LEA DX, v1
  Int 21h

  MOV AH, 2
  MOV dx, A
  add dx, 30h
  Int 21h

  MOV DL, 0DH
  Int 21h
  MOV DL, 0AH
  Int 21h

  LEA DX, v2
  MOV AH, 9
  Int 21h

  MOV AH, 2
  MOV dx, B
  add dx, 30h
  Int 21h

  MOV DL, 0DH
  Int 21h
  MOV DL, 0AH
  Int 21h

  LEA DX, v3
  MOV AH, 9
  Int 21h

  MOV AH, 2
  MOV dx, dif
  add dx, 30h
  Int 21h

  MOV AH, 4ch
  Int 21h
Main EndP
End Main