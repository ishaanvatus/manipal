; 32 bit packed to equivalent hex
	area reset, data, readonly
	export __Vectors
		
; renaming regs for ease of writing asm
packed_ptr rn r0
hex_ptr rn r1
packed rn r2
hex rn r3
mask rn r4
ten_pow rn r5
count rn r6
temp rn r7
ten rn r8

__Vectors
	dcd 0x10001000
	dcd Reset_Handler
	align
	area program, code, readonly
	entry
	export Reset_Handler

Reset_Handler
	ldr packed_ptr, =num
	ldr packed, [packed_ptr]
	mov ten_pow, #1
	mov ten, #0x0A
	mov hex, #0x00
	mov mask, #0x0f
	mov count, #0x08
loop
	and temp, packed, mask
	mla hex, temp, ten_pow, hex
	mul ten_pow, ten
	lsr packed, #4
	subs count, count, #1
	bne loop
store
	ldr hex_ptr, =res
	str hex, [hex_ptr]
stop 
	b stop
	
num dcd 0x00004096
	area result, data, readwrite
res dcd 0
	end