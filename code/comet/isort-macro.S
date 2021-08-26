#define	i	GR1
#define	j	GR2
#define	j_min1	GR3
#define	tmp	GR0
#define	tmp2	GR4

; 挿入ソート	
; i: 外側のループインデックス
; j: 内側のループインデックス
; A: ソートする配列	
; N: 配列の要素数	
ISORT	START
	LAD	i, 1		; 外側のループインデックス i (1〜N-1 までループ)
	
OUTER	CPA	i, N		; i < N なら続ける
	JPL	DONE
	JZE	DONE

	LD	j, i		; 内側のループインデックス j (i〜1 までループ)
INNER	CPA	j, =0		; j > 0 なら続ける
	JMI	NEXT
	JZE	NEXT
	LAD	j_min1, -1, j	; j_min1 ← j - 1
	LD	tmp, A, j_min1	; tmp ← a[j-1]
	CPA	tmp, A, j	; A[j - 1] > a[j] なら続ける
	JMI	NEXT
	JZE	NEXT
	
	; A[j] と A[j-1] を交換する
	LD	tmp, A, j	; tmp = A[j]
	LAD	j_min1, -1, j	; j_min1 ← j - 1
	LD	tmp2, A, j_min1
	ST	tmp2, A, j	; A[j] = A[j - 1]
	ST	tmp, A, j_min1	; a[j - 1] = tmp
	LAD	j, -1, j	; 内側のループインデックス j を -1
	JUMP	INNER
		
NEXT	LAD	i, 1, i		; 外側のループインデックス i を +1
	JUMP	OUTER
	
DONE	RET		
		
A	DC	5,3,4,1,2
N	DC	5
	END
