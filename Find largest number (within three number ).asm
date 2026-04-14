ORG 100H

; ---------------- First Number ----------------
MOV AH, 01H
INT 21H
SUB AL, 30H
MOV BL, AL          ; Store first number

CALL NEWLINE        ; Move to next line

; ---------------- Second Number ----------------
MOV AH, 01H
INT 21H
SUB AL, 30H
CMP AL, BL
JLE SKIP1
MOV BL, AL
SKIP1:

CALL NEWLINE        ; Move to next line

; ---------------- Third Number ----------------
MOV AH, 01H
INT 21H
SUB AL, 30H
CMP AL, BL
JLE SKIP2
MOV BL, AL
SKIP2:

CALL NEWLINE        ; Move to next line before output

; ---------------- Print Result ----------------
MOV DX, OFFSET MSG
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

; ---------------- Subroutines ----------------
NEWLINE:            ; Print CR+LF
MOV DL, 0DH
MOV AH, 02H
INT 21H
MOV DL, 0AH
MOV AH, 02H
INT 21H
RET

MSG DB 'Largest number is: $'
