ORG 100H

MOV DX, OFFSET MSG   ; string ?? address DX ? ????
MOV AH, 9            ; function 9 (print string)
INT 21H              ; interrupt call

MOV AH, 4CH          ; program exit
INT 21H

MSG DB 'Hello World$'   ; string ???? $ ???? ???
