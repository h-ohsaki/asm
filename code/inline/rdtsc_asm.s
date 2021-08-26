	.global rdtsc 	# シンボル sum_asm を外部から参照可能に
	.text		# .text セクション開始
rdtsc:	
	rdtscp		# CPU の TSC (Time Stamp Counter) を取得する (EDX:EAX に格納される)
	ret		# 下位 32 ビットを返り値として返す
