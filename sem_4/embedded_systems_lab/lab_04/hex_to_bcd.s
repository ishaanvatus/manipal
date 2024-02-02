; 16 bit hex to packed bcd
	area reset, data, readonly
	export __Vectors
		
; renaming regs for ease of writing asm
hex_ptr rn r0
packed_ptr rn r1
hex rn r2
packed rn r3
decimal rn r4
denom rn r5
__Vectors
	dcd 0x10001000
	dcd Reset_Handler
	align
	area program, code, readonly
	entry
	export Reset_Handler

Reset_Handler
	ldr hex_ptr, =num
	ldr hex, [hex_ptr]
	mov denom, #0x10
	mov decimal, #0x00
	mov packed, #0x00
loop
	cmp hex, #0x00
	bne loop
	
stop 
	b stop
	
num dcd 0xdead
	area result, data, readwrite
res dcd 0
	end