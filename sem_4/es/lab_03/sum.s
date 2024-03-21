; add 10 32-bit ints present in code mem and save to data mem
	area reset, data, readonly
	export __Vectors
__Vectors
	dcd 0x10001000
	dcd Reset_Handler
	align
	area program, code, readonly
	entry
	export Reset_Handler

Reset_Handler
	ldr r0, =primes
	ldr r1, =res
	mov r4, #0
	mov r2, #0
	str r2, [r1]
	mov r2, #N
loop
	ldr r3, [r0], #4
	add r4, r3
	subs r2, #1
	bne loop
	str r4, [r1]
halt
	b halt

N equ 10
primes DCD 0x02, 0x03, 0x05, 0x07, 0x0b, 0x0d, 0x11, 0x13, 0x17
	AREA sum, DATA, READWRITE
res DCD 0x00
	END