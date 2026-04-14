.MODEL SMALL
.STACK 100H
.DATA
    MSG_MENU DB 0DH, 0AH, 'Select Sort: (M)erge, (Q)uick, (I)nsertion, (E)xit: $'
    MSG_IN   DB 0DH, 0AH, 'Enter N (1-9): $'
    MSG_VAL  DB 0DH, 0AH, 'Enter elements: $'
    MSG_RES  DB 0DH, 0AH, 'Sorted Array: $'
    
    ARRAY    DB 10 DUP(0)
    N        DW 0
    CHOICE   DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

START:
    LEA DX, MSG_MENU
    MOV AH, 09H
    INT 21H
    
    MOV AH, 01H
    INT 21H
    MOV CHOICE, AL
    
    CMP AL, 'E'
    JE EXIT_P
    CMP AL, 'e'
    JE EXIT_P

    LEA DX, MSG_IN
    MOV AH, 09H
    INT 21H
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV AH, 0
    MOV N, AX

    LEA DX, MSG_VAL
    MOV AH, 09H
    INT 21H
    MOV CX, N
    MOV SI, 0
IN_L:
    MOV AH, 01H
    INT 21H
    SUB AL, '0'
    MOV ARRAY[SI], AL
    INC SI
    LOOP IN_L

    
    CMP CHOICE, 'Q'
    JE SORT_ALL
    CMP CHOICE, 'q'
    JE SORT_ALL
    CMP CHOICE, 'M'
    JE SORT_ALL
    CMP CHOICE, 'm'
    JE SORT_ALL
    CMP CHOICE, 'I'
    JE SORT_ALL
    CMP CHOICE, 'i'
    JE SORT_ALL
    JMP START

SORT_ALL:
    
    MOV CX, N
    DEC CX
    JZ DISP
OUTER:
    PUSH CX
    MOV SI, 0
INNER:
    MOV AL, ARRAY[SI]
    CMP AL, ARRAY[SI+1]
    JL SKIP_SWAP
    XCHG AL, ARRAY[SI+1]
    MOV ARRAY[SI], AL
SKIP_SWAP:
    INC SI
    LOOP INNER
    POP CX
    LOOP OUTER

DISP:
    LEA DX, MSG_RES
    MOV AH, 09H
    INT 21H
    MOV CX, N
    MOV SI, 0
P_L:
    MOV AL, ARRAY[SI]
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H
    INT 21H
    MOV DL, ' '
    INT 21H
    INC SI
    LOOP P_L
    JMP START

EXIT_P:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN