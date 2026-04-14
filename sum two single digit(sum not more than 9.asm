ORG 100H

; ----- First Input -----
MOV AH, 01H
INT 21H
SUB AL, 30H
MOV BL, AL

; ----- Second Input -----
MOV AH, 01H
INT 21H
SUB AL, 30H
MOV BH, AL

; ----- Add -----
MOV AL, BL
ADD AL, BH       ; AL = result

ADD AL, 30H      ; ASCII convert
MOV CL, AL       ; ?? result save

; ----- New Line -----
MOV DL, 0DH
MOV AH, 02H
INT 21H

MOV DL, 0AH
INT 21H
          ; ----- Print "sum is :" -----
MOV AH, 09H
LEA DX, MSG
INT 21H
; ----- Display Result -----
MOV DL, CL       ; ?? saved result use
MOV AH, 02H
INT 21H

; ----- Exit -----
MOV AH, 4CH
INT 21H

; ----- Data -----
MSG DB "sum is :$"
