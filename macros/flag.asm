engine_flag_def: macro
	const \1
\1_ADDR EQUS "\2"
\1_BIT  EQU \3
endm

engine_flag: macro
	dwb \1_ADDR, (1 << \1_BIT)
endm

CheckFlag: macro
	ld a, [\1_ADDR]
	bit \1_BIT, a
endm

CheckFlagHL: macro
	ld hl, \1_ADDR
	bit \1_BIT, [hl]
endm

SetFlag: macro
	ld hl, \1_ADDR
	set \1_BIT, [hl]
endm

ClearFlag: macro
	ld hl, \1_ADDR
	res \1_BIT, [hl]
endm

CheckFlagForceReuseA: macro
	bit \1_BIT, a
endm

CheckFlagForceReuseHL: macro
	bit \1_BIT, [hl]
endm

SetFlagForceReuseHL: macro
	set \1_BIT, [hl]
endm

ClearFlagForceReuseHL: macro
	res \1_BIT, [hl]
endm
