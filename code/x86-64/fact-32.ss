        .text
fact:
        pushl   %ebx                    # ESP ← <-> 4, [ESP] ← EBX
        subl    $8, %esp                # ESP ← <-> 8
        movl    16(%esp), %ebx          # EBX ← [ESP + 16]
	## if (n == 1)
        cmpl    $1, %ebx                # EBX == 1?
        jne     .L4                     # EIP ← .L4
.L2:
	## return
        movl    %ebx, %eax              # EAX ← EBX
        addl    $8, %esp                # ESP ← <+> 8
        popl    %ebx                    # EBX ← [ESP], ESP ← <+> 4
        ret                             # EIP ← [ESP], ESP ← <+> 4
.L4:
	## n * fact(n - 1)
        subl    $12, %esp               # ESP ← <-> 12
        leal    -1(%ebx), %eax          # EAX ← EBX - 1
        pushl   %eax                    # ESP ← <-> 4, [ESP] ← EAX
        call    fact                    # ESP ← <-> 4, [ESP] ← EIP, EIP ← fact
        addl    $16, %esp               # ESP ← <+> 16
        imull   %eax, %ebx		# EBX ← <*> EAX
        jmp     .L2                     # EIP ← .L2
main:
        leal    4(%esp), %ecx           # ECX ← ESP + 4
        andl    $-16, %esp              # ESP ← <&> 0xfffffff0
        pushl   -4(%ecx)                # ESP ← <-> 4, [ESP] ← [ECX - 4]
        pushl   %ebp                    # ESP ← <-> 4, [ESP] ← EBP
        movl    %esp, %ebp              # EBP ← ESP
        pushl   %ecx                    # ESP ← <-> 4, [ESP] ← ECX
        subl    $16, %esp               # ESP ← <-> 16
	## n = fact(3)
        pushl   $3                      # ESP ← <-> 4, [ESP] ← 3
        call    fact                    # ESP ← <-> 4, [ESP] ← EIP, EIP ← fact
        addl    $16, %esp               # ESP ← <+> 16
	## return 0
        movl    $0, %eax                # EAX ← 0
        movl    -4(%ebp), %ecx          # ECX ← [EBP - 4]
        leave                           # ESP ← EBP, EBP ← [ESP], ESP ← <+> 4
        leal    -4(%ecx), %esp          # ESP ← ECX - 4
        ret                             # EIP ← [ESP], ESP ← <+> 4
