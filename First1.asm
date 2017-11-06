.Model small
.stack 100h
.Data
A DW 5
B DW 3
dif DW ?

.code
Main Proc
  MOV AX, @Data
  MOV DS, AX
  MOV AX, A
  ADD AX, B
  mov dif,ax

  MOV AH, 2
  MOV dx, dif
  add dx, 30h
  Int 21h
  MOV AH, 4ch
  Int 21h
Main EndP
End Main

