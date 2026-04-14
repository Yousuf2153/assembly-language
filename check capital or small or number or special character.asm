ORG 100H

; ---------------- Input Character ----------------
MOV AH, 01H      ; Function 01h: Read character from keyboard
INT 21H          ; Character stored in AL


; ---------------- Check Capital Letter ----------------
CMP AL, 65       ; 'A'
JB CHECK_SMALL   ; If AL < 65, check next
CMP AL, 90       ; 'Z'
JBE CAPITAL      ; If AL <= 90, it's capital
  
; ---------------- Check Small Letter ----------------
CHECK_SMALL:
CMP AL, 97       ; 'a'
JB CHECK_NUMBER
CMP AL, 122      ; 'z'
JBE SMALL
     
; ---------------- Check Number ----------------
CHECK_NUMBER:
CMP AL, 48       ; '0'
JB SPECIAL
CMP AL, 57       ; '9'
JBE NUMBER
    
; ---------------- Special Character ----------------
SPECIAL:
CALL NEWLINE
MOV DX, OFFSET MSG_SPECIAL
JMP PRINT_MSG

CAPITAL: 
CALL NEWLINE
MOV DX, OFFSET MSG_CAP
JMP PRINT_MSG

SMALL:  
CALL NEWLINE
MOV DX, OFFSET MSG_SMALL
JMP PRINT_MSG

NUMBER: 
CALL NEWLINE
MOV DX, OFFSET MSG_NUMBER

; ---------------- Print Message ----------------
PRINT_MSG:
MOV AH, 09H      ; DOS print string
INT 21H

; ---------------- Exit ----------------
MOV AH, 4CH
INT 21H
; ---------------- New Line Subroutine ----------------
NEWLINE:
MOV DL, 0DH
MOV AH, 02H
INT 21H
MOV DL, 0AH
MOV AH, 02H
INT 21H
RET
; ---------------- Messages ----------------
MSG_CAP DB 'Capital Letter$', 0
MSG_SMALL DB 'Small Letter$', 0
MSG_NUMBER DB 'Number$', 0
MSG_SPECIAL DB 'Special Character$', 0
