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
	
	LDR R0,=SRC ;load address of src
	LDR R1, =DST ;load address of dst
	MOV R3, #N ;counter
	
UP	LDR R2,[R0], #4
	STR R2,[R1], #4
	SUBS R3,#1
	BNE UP
STOP
	B STOP


N EQU 10
	
SRC DCD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
	AREA nums, DATA, READWRITE
	
DST DCD 0
	
	END