        .text
main:
        pushl   %ebp                    # ESP ← <-> 4, [ESP] ← EBP
        movl    %esp, %ebp              # EBP ← ESP
        andl    $-8, %esp               # ESP ← <&> 0xfffffff8
        subl    $16, %esp               # ESP ← <-> 16
	## dist = sqrt(x * x + y * y)
        fldl    x			# [x] をプッシュ
        fmul    %st(0), %st		# ST(0) ← <*> ST(0)
        fldl    y			# [y] をプッシュ
        fmul    %st(0), %st		# ST(0) ← <*> ST(0)
        faddp   %st, %st(1)		# ST(1) ← <+> ST(0); トップを捨てる
        fsqrt				# ST(0) ← sqrt(ST(0))
        fstpl   8(%esp)			# [ESP + 8] ← ST(0); トップを捨てる
	## return 0
        movl    $0, %eax                # EAX ← 0
        leave                           # ESP ← EBP, EBP ← [ESP], ESP ← <+> 4
        ret                             # EIP ← [ESP], ESP ← <+> 4
        .data
y:	## y = -4.56
        .long   -1546188227
        .long   -1072546448
x:	## x = 1.23
        .long   2061584302
        .long   1072934420
