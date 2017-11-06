
 ;**************************************************************************;
 ;                                                                          ; 
 ;	  By :                                                              ;
 ;		Muhammad Tahir Shahzad  [ MTS ]                             ;
 ;		B.C.S Honours  [ 2000-04 ]                                  ;
 ;		Government College University Lahore                        ;
 ;		Pakistan                                                    ;
 ;                                                                          ;
 ;    E-mail :  mtshome@wol.net.pk                                          ;
 ;                                                                          ;
 ;  Web-Site :  www.mts-home.cjb.net  [ www.wol.net.pk/mtshome ]            ;
 ;		www.mtshome.cjb.net   [ www.geocities.com/mtahirshahzad ]   ;
 ;                                                                          ;
 ;**************************************************************************;

 TITLE AL-015 : An AL Program to print counting from 0 to 9.

 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  'The counting from 0 to 9 is : $'

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 10                   ; initialize CX

     MOV AH, 2                    ; set output function  
     MOV DL, 48                   ; set DL with 0

     @LOOP:                       ; loop label
       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX
     JNZ @LOOP                    ; jump to label @LOOP if CX is 0

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN