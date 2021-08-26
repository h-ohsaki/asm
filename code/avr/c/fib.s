	.file	"fib.c"
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
/* #APP */
	rjmp _start
/* #NOAPP */
	.text
.global	fib
	.type	fib, @function
fib:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	tst r24
	breq .L3
	cpi r24,lo8(1)
	breq .L4
	mov r28,r24
	ldi r24,lo8(-1)
	add r24,r28
	rcall fib
	mov r29,r24
	ldi r24,lo8(-2)
	add r24,r28
	rcall fib
	add r24,r29
	rjmp .L2
.L3:
	ldi r24,0
	rjmp .L2
.L4:
	ldi r24,lo8(1)
.L2:
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	fib, .-fib
.global	_start
	.type	_start, @function
_start:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
/* #APP */
 ;  19 "fib.c" 1
	ldi r16, 0x9f
	out __SP_L__, r16
 ;  0 "" 2
/* #NOAPP */
	ldi r24,lo8(10)
	rcall fib
/* #APP */
 ;  22 "fib.c" 1
	loop: rjmp loop
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	_start, .-_start
	.ident	"GCC: (GNU) 5.4.0"
