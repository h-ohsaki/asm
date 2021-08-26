        .text
fact:
        pushq   %rbx                    # RSP ← <-> 8, [RSP] ← RBX
        movl    %edi, %ebx              # EBX ← EDI
	## if (n == 1)
        cmpl    $1, %edi                # 1 == EDI?
        jne     .L4                     # RIP ← .L4
.L2:
	## return
        movl    %ebx, %eax              # EAX ← EBX
        popq    %rbx                    # RBX ← [RSP], RSP ← <+> 8
        ret                             # RIP ← [RSP], RSP ← <+> 8
.L4:
	## n * fact(n - 1)
        leal    -1(%rdi), %edi          # EDI ← RDI - 1
        call    fact                    # RSP ← <-> 8, [RSP] ← RIP, RIP ← fact
        imull   %eax, %ebx		# EBX ← <*> EAX
        jmp     .L2                     # RIP ← .L2
main:
        subq    $8, %rsp                # RSP ← <-> 8
	## n = fact(3)
        movl    $3, %edi                # EDI ← 3
        call    fact                    # RSP ← <-> 8, [RSP] ← RIP, RIP ← fact
	## return 0
        movl    $0, %eax                # EAX ← 0
        addq    $8, %rsp                # RSP ← <+> 8
        ret                             # RIP ← [RSP], RSP ← <+> 8
