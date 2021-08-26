	.file	"add.c"
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
	ldi r24,lo8(12)
	ldi r25,0
	sts i+1,r25
	sts i,r24
	lds r24,i
	lds r25,i+1
	adiw r24,34
	sts i+1,r25
	sts i,r24
/* #APP */
 ;  8 "add.c" 1
	loop: rjmp loop
 ;  0 "" 2
/* #NOAPP */
	ret
	.size	_start, .-_start
	.comm	i,2,1
	.ident	"GCC: (GNU) 5.4.0"
.global __do_clear_bss
