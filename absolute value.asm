ORG 100H

; -------- PROMPT MESSAGE --------
MOV DX, OFFSET PROMPT
MOV AH, 09H
INT 21H

; -------- INPUT --------
MOV AH, 01H
INT 21H

CMP AL, '-'       
JNE POSITIVE

; ----- NEGATIVE CASE -----
MOV AH, 01H
INT 21H

SUB AL, 30H
JMP STORE

; ----- POSITIVE CASE -----
POSITIVE:
SUB AL, 30H

STORE:
MOV BL, AL

; -------- NEW LINE --------
MOV DL, 0DH
MOV AH, 02H
INT 21H

MOV DL, 0AH
INT 21H

; -------- PRINT MESSAGE --------
MOV DX, OFFSET MSG
MOV AH, 09H
INT 21H

; -------- PRINT RESULT --------
MOV AL, BL
ADD AL, 30H
MOV DL, AL
MOV AH, 02H
INT 21H

; -------- EXIT --------
MOV AH, 4CH
INT 21H

PROMPT DB 'Enter number (-9 to 9): $'
MSG DB 'Absolute value is: $'