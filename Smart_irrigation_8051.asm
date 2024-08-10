RS EQU P2.7
RW EQU P2.6
E EQU P2.5
ORG 00H
SETB P3.5
MOV TMOD,#00000001B
MAIN:ACALL DINT
ACALL TEXT1
JB P3.5, NEXT 
ACALL LINE2
ACALL TEXT2
CLR P2.0
SJMP EXIT
NEXT:ACALL LINE
ACALL TEXT3
SETB P2.0
EXIT:ACALL DELAY1
SJMP MAIN
DELAY1:MOV R0,#15D
BACK1: MOV TH0,#00000000B
MOV TL0,#00000000B
SETB TR0
HERE2: JNB TF0,HERE2
CLR TR0
CLR TF0
DJNZ R0,BACK1
RET
DINT:MOV A,#0CH
ACALL CMD
MOV A,#01H
ACALL CMD
MOV A,#06H
ACALL CMD
MOV A,#80H
ACALL CMD
MOV A,#3CH
ACALL CMD
RET
LINE2:MOV A,#0C0H
ACALL CMD
RET
CMD: MOV P0,A
CLR RS
CLR RW
SETB E
CLR E
ACALL DELAY
RET
DISPLAY:MOV P0,A
SETB RS
CLR RW
SETB E
CLR E
ACALL DELAY
RET
DELAY: CLR E
CLR RS
SETB RW
MOV P0,#0FFH
SETB E
MOV A,P0
JB ACC.7,DELAY
CLR E
CLR RW
RET
END