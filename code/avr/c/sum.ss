__zero_reg__ = 1
.global	main
main:
	ldi r24,lo8(1)
	ldi r25,0
.L2:
	lds r18,sum
	lds r19,sum+1
	add r18,r24
	adc r19,r25
	sts sum+1,r19
	sts sum,r18
	adiw r24,1
	cpi r24,101
	cpc r25,__zero_reg__
	brne .L2
	ldi r24,0
	ldi r25,0
	ret
.global	sum
sum:
	.zero	2
