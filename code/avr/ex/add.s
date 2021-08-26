; 12 + 34 の計算	
	.global	_start
	.text
_start:
	ldi	r16, 12		; R16 ← 12
	; 即値の加算命令がないため、-34 の減算によって実現
	subi	r16, -34	; R16 ← <-> -34
done:
	rjmp	done		; PC ← done
