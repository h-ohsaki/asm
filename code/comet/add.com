COMET 0000
CASL LISTING add.cas
   2 0000 1010		LD	GR1, V		; GR1 ← [V] (アドレス V から読み込み)
   2      0008
   3 0002 1220		LAD	GR2, 456	; GR2 ← 456 (実効アドレスによる読み込み)
   3      01c8
   4 0004 2412		ADDA	GR1, GR2	; GR1 ← <+> GR2
   5 0005 1110		ST	GR1, V		; [V] ← GR1 (アドレス V に書き込み)
   5      0008
   6 0007 8100		RET
   7 0008 007b	V	DC	123		; 定数 123 を確保

DEFINED LABELS
               add.cas:1	0000 MAIN
               add.cas:7	0008 V
