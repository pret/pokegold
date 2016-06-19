GetVarAction_::
	ld a, c
	cp NUM_VARS
	jr c, .valid
	xor a
.valid
	ld c, a
	ld b, 0
	ld hl, .VarActionTable
	add hl, bc
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld b, [hl]
	ld a, b
	and RETVAR_EXECUTE
	jr nz, .call
	ld a, b
	and RETVAR_ADDR_DE
	ret nz
	ld a, [de]
	jr .loadstringbuffer2

.call
	call jp_de
	ret

.loadstringbuffer2
	ld de, wStringBuffer2
	ld [de], a
	ret

.VarActionTable:
	dwb wStringBuffer2, RETVAR_STRBUF2
	dwb $da22, RETVAR_STRBUF2
	dwb .BattleResult, RETVAR_EXECUTE
	dwb $d119, RETVAR_ADDR_DE
	dwb $d157, RETVAR_STRBUF2
	dwb .CountCaughtMons, RETVAR_EXECUTE
	dwb .CountSeenMons, RETVAR_EXECUTE
	dwb .CountBadges, RETVAR_EXECUTE
	dwb $d682, RETVAR_ADDR_DE
	dwb .PlayerFacing, RETVAR_EXECUTE
	dwb $ff96, RETVAR_STRBUF2
	dwb .DayOfWeek, RETVAR_EXECUTE
	dwb $da00, RETVAR_STRBUF2
	dwb $da01, RETVAR_STRBUF2
	dwb .UnownCaught, RETVAR_EXECUTE
	dwb $d083, RETVAR_STRBUF2
	dwb .BoxFreeSpace, RETVAR_EXECUTE
	dwb $d193, RETVAR_STRBUF2
	dwb $da03, RETVAR_STRBUF2
	dwb $da02, RETVAR_STRBUF2
	dwb $d97b, RETVAR_STRBUF2
    dwb     0, 0

.CountCaughtMons: ; 41cf
; Caught mons.
	ld hl, wPokedexCaught
	ld b, $20
	call CountSetBits
	ld a, [wd151]
	jp .loadstringbuffer2

.CountSeenMons: ; 41dd
; Seen mons.
	ld hl, wPokedexSeen
	ld b, $20
	call CountSetBits
	ld a, [wd151]
	jp .loadstringbuffer2

.CountBadges: ; 41eb
; Number of owned badges.
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	ld a, [wd151]
	jp .loadstringbuffer2

.PlayerFacing: ; 41f9
; The direction the player is facing.
	ld a, [wPlayerDirection]
	and $c
	rrca
	rrca
	jp .loadstringbuffer2

.DayOfWeek: ; 4203
; The day of the week.
	call GetWeekday
	jp .loadstringbuffer2

.UnownCaught: ; 4209
; Number of unique Unown caught.
	call CountUnown ; gold: c5ac | silver: c5aa
	ld a, b
	jp .loadstringbuffer2

.BoxFreeSpace: ; 4210
; Remaining slots in the current box.
	ld a, BANK(sBoxCount)
	call OpenSRAM
	ld hl, sBoxCount
	ld a, MONS_PER_BOX
	sub [hl]
	ld b, a
	call CloseSRAM
	ld a, b
	jp .loadstringbuffer2

.BattleResult: ; 4223
	ld a, [wBattleResult]
	and $7f
	jp .loadstringbuffer2
; 422b
