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
	LDR R0, =SRC ; start addr of 2 nums in code mem
	LDR R4, =DST ; addr of result in data mem
	LDR R1, [R0], #4
	LDR R2, [R0]
	SUB R3, R2, R1
	STR R3, [R4]	
STOP
	B STOP
SRC DCD 8, 3
	AREA dat, DATA, READWRITE
	
DST DCD 0
	
	END