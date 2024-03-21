;void selection_sort (int *a, int n) {
;    int i, j, m, t;
;    for (i = 0; i < n; i++) {
;        for (j = i, m = i; j < n; j++) {
;            if (a[j] < a[m]) {
;                m = j;
;            }
;        }
;        t = a[i];
;        a[i] = a[m];
;        a[m] = t;
;    }
;}

	area reset, data, readonly
	export __Vectors
		
bp rn r0
counter_i rn r1
counter_j rn r2
small_pointer rn r3
current rn r4 
temp rn r5
bp_copy r6
n equ 8
__Vectors
	dcd 0x40001000
	dcd Reset_Handler
	align
	area program, code, readonly
	entry
	export Reset_Handler

Reset_Handler 
	ldr base_pointer, =nums
	mov counter_i, #0x00
outer
	mov counter_j, counter_i
	mov small_pointer, counter_i
	mov 
inner
	add current, bp, counter_i
	
	cmp counter_j, #n
	bne inner
	cmp counter_i, #n
	bne outer
	
stop
	b stop
	area array, data, readwrite
nums dcd 56, 17, 35, 13, 63, 34, 12, 49	
	end