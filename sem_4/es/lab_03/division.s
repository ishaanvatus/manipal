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
	LDR R0, =NUM ; load numerator addr
	LDR R1, =DEN ; load denominator addr
	LDR R4, =DST ; result addr
	LDR R0, [R0]
	LDR R1, [R1]
	MOV R2, #0
	MOV R3, #0
up	CMP R0, R1
	BCC store
	SUB R0, R1
	ADD R2, #1
	B up
store	STR R2, [R4], #4
		STR R2, [R4]
STOP
	B STOP

NUM DCD 8
DEN DCD 3
	AREA res, DATA, READWRITE
DST DCD 0, 0
	END