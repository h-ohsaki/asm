        .text
main:
	## dist = sqrt(x * x + y * y)
        movsd   x(%rip), %xmm0          # XMM0 ← [x]
        mulsd   %xmm0, %xmm0		# XMM0 ← <*> XMM0
        movsd   y(%rip), %xmm1          # XMM1 ← [y]
        mulsd   %xmm1, %xmm1		# XMM1 ← <*> XMM1
        addsd   %xmm1, %xmm0            # XMM0 ← <+> XMM1
        sqrtsd  %xmm0, %xmm0		# XMM0 ← sqrt(XMM0)
        movsd   %xmm0, -8(%rsp)         # [RSP - 8] ← XMM0
	## return 0
        movl    $0, %eax                # EAX ← 0
        ret                             # RIP ← [RSP], RSP ← <+> 8
        .data
y:	## double y = -4.56
        .long   -1546188227
        .long   -1072546448
x:	## double x = 1.23
        .long   2061584302
        .long   1072934420
