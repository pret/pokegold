SetSeenAndCaughtMon::
	push af
	ld c, a
	ld hl, wPokedexCaught
	ld b, SET_FLAG
	call PokedexFlagAction
	pop af
SetSeenMon::
	ld c, a
	ld hl, wPokedexSeen
	ld b, SET_FLAG
	jr PokedexFlagAction

CheckCaughtMon::
	ld c, a
	ld hl, wPokedexCaught
	ld b, CHECK_FLAG
	jr PokedexFlagAction

CheckSeenMon::
	ld c, a
	ld hl, wPokedexSeen
	ld b, CHECK_FLAG
PokedexFlagAction:: ; 35e4 (0:35e4)
	ld d, 0
	predef SmallFarFlagAction
	ld a, c
	and a
	ret

