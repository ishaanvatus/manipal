	area reset, data, readonly
	export __Vectors

num rn r0
fact rn r1

__Vectors
	dcd 0x10001000
	dcd Reset_Handler
	align
	area program, code, readonly
	entry
	export Reset_Handler


Reset_Handler 
	mov num, #0x0a
	mov fact, #0x01
	bl factorial
stop
	b stop

factorial
	cmp num, #0x01
	beq return
	mul fact, fact, num
	sub num, #0x01
	bl factorial
return
	bx lr
	end