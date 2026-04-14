ORG 100H

; ---------------- First Number ----------------
MOV AH, 01H
INT 21H
SUB AL, 30H
MOV BL, AL          ; Store first number as current minimum

CALL NEWLINE        ; Move to next line

; ---------------- Second Number ----------------
MOV AH, 01H
INT 21H
SUB AL, 30H
CMP AL, BL
JGE SKIP1_MIN       ; If AL >= BL, skip
MOV BL, AL          ; Update minimum
SKIP1_MIN:

CALL NEWLINE

; ---------------- Third Number ----------------
MOV AH, 01H
INT 21H
SUB AL, 30H
CMP AL, BL
JGE SKIP2_MIN       ; If AL >= BL, skip
MOV BL, AL          ; Update minimum
SKIP2_MIN:

CALL NEWLINE

; ---------------- Print Result ----------------
MOV DX, OFFSET MSG_MIN
MOV AH, 09H
INT 21H

MOV AL, BL
ADD AL, 30H
MOV DL, AL
MOV AH, 02H
INT 21H

CALL NEWLINE        ; Move to next line after output

; ---------------- Exit ----------------
MOV AH, 4CH
INT 21H

; ---------------- Subroutine: New Line ----------------
NEWLINE:            
MOV DL, 0DH
MOV AH, 02H
INT 21H
MOV DL, 0AH
MOV AH, 02H
INT 21H
RET

MSG_MIN DB 'Minimum number is: $'
