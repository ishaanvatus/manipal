	AREA RESET, DATA, READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	LDR R1, =NUMS
	LDR R5, =RESULT
	LDR R6, [R1], #4
	LDR R7, [R1]
	UMULL R3, R4, R6, R7
	STR R4, [R5], #4
	STR R3, [R5], #4
	MUL R3, R6, R7
	STR R3, [R5]
STOP
	B STOP
	
NUMS DCD 7, 31
	AREA data, DATA, READWRITE
RESULT DCD 0
	END