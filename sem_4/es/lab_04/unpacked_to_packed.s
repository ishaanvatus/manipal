; program to convert 32 bit unpacked number to packed form
	area reset, data, readonly
	export __Vectors
		
; renaming regs for ease of writing asm
unpacked_ptr rn r0
unpacked rn r1
mask rn r2
packed rn r3
count rn r4
temp rn r5

__Vectors
	dcd 0x10001000
	dcd Reset_Handler
	align
	area program, code, readonly
	entry
	export Reset_Handler

Reset_Handler
	ldr unpacked_ptr, =num
	ldr unpacked, [unpacked_ptr]
	mov mask, #0x0f 
	mov packed, #0x00
	mov count, #0x04
loop
	and temp, unpacked, mask
	orr packed, temp
	lsl mask, #4
	; 0000 0000 0000 0000 0000 0000 0000 1111 -> 0000 0000 0000 0000 0000 0000 1111 0000 
	lsr unpacked, #4
	subs count, count, #1
	bne loop
store 
	ldr temp, =res
	str packed, [temp]
stop 
	b stop
	
num dcd 0x02030709
	area result, data, readwrite
res dcd 0
	end