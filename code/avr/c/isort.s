	.file	"isort.c"
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.global	_start
	.type	_start, @function
_start:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,lo8(3)
	sts a,r24
	ldi r24,lo8(8)
	sts a+1,r24
	ldi r24,lo8(7)
	sts a+2,r24
	ldi r24,lo8(2)
	sts a+3,r24
	ldi r24,lo8(6)
	sts a+4,r24
	ldi r24,lo8(9)
	sts a+5,r24
	ldi r24,lo8(10)
	sts a+6,r24
	ldi r24,lo8(5)
	sts a+7,r24
	ldi r24,lo8(4)
	sts a+8,r24
	ldi r24,lo8(1)
	sts a+9,r24
	ldi r19,lo8(1)
.L2:
	mov r24,r19
.L3:
	mov r30,r24
	mov __tmp_reg__,r24
	lsl r0
	sbc r31,r31
	movw r26,r30
	subi r26,lo8(-(a-1))
	sbci r27,hi8(-(a-1))
	ld r18,X
	subi r30,lo8(-(a))
	sbci r31,hi8(-(a))
	ld r25,Z
	cp r25,r18
	brge .L6
	ld r25,Z
	ld r18,X
	st Z,r18
	st X,r25
	subi r24,lo8(-(-1))
	brne .L3
.L6:
	subi r19,lo8(-(1))
	cpi r19,lo8(10)
	brne .L2
/* #APP */
 ;  34 "isort.c" 1
	loop: rjmp loop
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	_start, .-_start
	.comm	a,10,1
	.ident	"GCC: (GNU) 5.4.0"
.global __do_clear_bss
