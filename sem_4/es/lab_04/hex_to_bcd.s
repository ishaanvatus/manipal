    AREA    RESET, DATA, READONLY
    EXPORT __Vectors

__Vectors
    DCD 0x10001010
    DCD Reset_Handler
    
    ALIGN
    
    AREA program, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler


hex_num rn R0
shift_count rn R1
quotient rn R2
res rn R3
res_mem rn R4


Reset_Handler
    LDR hex_num, =HEX
    LDR hex_num, [hex_num]
    MOV shift_count, #0x20           ; initialise (final) shift counter to 32


CONVERT
    BL DIVIDE_INIT
    CMP hex_num, #0x0            ; end if dividend is zero
    BNE CONVERT


STORE_IN_RAM
    LDR res_mem, =BCD
    LSR res, shift_count
    STR res, [res_mem]


STOP
    B STOP


DIVIDE_INIT
    MOV quotient, #0              ; set quotient to zero


DIVIDE
    CMP hex_num, #0x0A
    BLO PACK_DIGIT
    
    SUB hex_num, #0x0A           ; if dividend is exceeds 10 decrement it by 10
    ADD quotient, #0x1            ; and increment quotient by 1
    B DIVIDE                ; until dividend is less than 10


PACK_DIGIT
    ORR res, hex_num
    ROR res, #0x4
    MOV hex_num, quotient              ; quotient becomes new dividend
    
    SUB shift_count, #0x4
    BX LR


HEX DCD 0x2E

    AREA DATASEG, DATA, READWRITE
BCD DCD 0                   ; DST location in Data segment


    END
