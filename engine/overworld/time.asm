InitializeStartDay_: ; 117f1 (4:57f1)
	call Function118c9
	ret

ClearDailyTimers:
	xor a
	ld [wLuckyNumberDayBuffer], a
	ld [wUnusedTwoDayTimer], a
	ld [wDailyResetTimer], a
	ret

InitCallReceiveDelay:
	xor a
	ld [wTimeCyclesSinceLastCall], a
Function11804: ; 11804 (4:5804)
	ld a, [wTimeCyclesSinceLastCall]
	cp $3
	jr c, .asm_1180d
	ld a, $3
.asm_1180d
	ld e, a
	ld d, $0
	ld hl, .ReceiveCallDelays
	add hl, de
	ld a, [hl]
	jp Function11849

.ReceiveCallDelays:
	db 20, 10, 5, 3

CheckReceiveCallTimer:
	call Function11857
	ret nc
	ld hl, wTimeCyclesSinceLastCall
	ld a, [hl]
	cp $3
	jr nc, .asm_11829
	inc [hl]
.asm_11829
	call Function11804
	scf
	ret

Function1182e: ; 1182e (4:582e)
	ld a, $1
Function11830:
	ld [hl], a
	push hl
	call UpdateTime
	pop hl
	inc hl
	call CopyDayToHL
	ret

Function1183b: ; 1183b (4:583b)
	inc hl
	push hl
	call CalcDaysSince
	call Function119b4
	pop hl
	dec hl
	call Function11972
	ret

Function11849: ; 11849 (4:5849)
	ld hl, wReceiveCallDelay_MinsRemaining
	ld [hl], a
	call UpdateTime
	ld hl, wReceiveCallDelay_StartTime
	call CopyDayHourMinToHL
	ret

Function11857: ; 11857 (4:5857)
	ld hl, wReceiveCallDelay_StartTime
	call CalcMinsHoursDaysSince
	call Function1199a
	ld hl, wReceiveCallDelay_MinsRemaining
	call Function11972
	ret

asm_11867
	ld hl, wDailyResetTimer
	jp Function1182e

CheckDailyResetTimer:
	ld hl, wDailyResetTimer
	call Function1183b
	ret nc
	xor a
	ld hl, wDailyFlags
	ld [hli], a
	ld [hl], a
	jr asm_11867

StartBugContestTimer:
	ld a, 20
	ld [wBugContestMinsRemaining], a
	ld a, 0
	ld [wBugContestSecsRemaining], a
	call UpdateTime
	ld hl, wBugContestStartTime
	call CopyDayHourMinSecToHL
	ret

CheckBugContestTimer:
	ld hl, wBugContestStartTime
	call CalcSecsMinsHoursDaysSince
	ld a, [wDaysSince]
	and a
	jr nz, .asm_118c0
	ld a, [wHoursSince]
	and a
	jr nz, .asm_118c0
	ld a, [wSecsSince]
	ld b, a
	ld a, [wBugContestSecsRemaining]
	sub b
	jr nc, .asm_118ae
	add 60
.asm_118ae
	ld [wBugContestSecsRemaining], a
	ld a, [wMinsSince]
	ld b, a
	ld a, [wBugContestMinsRemaining]
	sbc b
	ld [wBugContestMinsRemaining], a
	jr c, .asm_118c0
	and a
	ret

.asm_118c0
	xor a
	ld [wBugContestMinsRemaining], a
	ld [wBugContestSecsRemaining], a
	scf
	ret

Function118c9: ; 118c9 (4:58c9)
	call UpdateTime
	ld hl, wStartDay
	call CopyDayToHL
	ret

CheckPokerusTick:
	ld hl, wStartDay
	call CalcDaysSince
	call Function119b4
	and a
	jr z, .asm_118e6
	ld b, a
	farcall ApplyPokerusTick ; same bank
.asm_118e6
	xor a
	ret

SetUnusedTwoDayTimer:
	ld a, $2
	ld hl, wUnusedTwoDayTimer
	ld [hl], a
	call UpdateTime
	ld hl, wUnusedTwoDayTimerStartDate
	call CopyDayToHL
	ret

Function118f8: ; 118f8 (4:58f8)
	ld hl, wUnusedTwoDayTimerStartDate
	call CalcDaysSince
	call Function119b4
	ld hl, wUnusedTwoDayTimer
	call Function11972
	ret

	ld hl, wDailyFlags
	set 2, [hl]
	ret

	and a
	ld hl, wDailyFlags
	bit 2, [hl]
	ret nz
	scf
	ret

Function11917: ; 11917 (4:5917)
	call Function11920
	ld hl, wLuckyNumberDayBuffer
	jp Function11830

Function11920: ; 11920 (4:5920)
	call GetWeekday
	ld c, a
	ld a, $5
	sub c
	jr z, .asm_1192b
	jr nc, .asm_1192d
.asm_1192b
	add $7
.asm_1192d
	ret

Function1192e: ; 1192e (4:592e)
	ld hl, wLuckyNumberDayBuffer
	jp Function1183b

Function11934: ; 11934 (4:5934)
	ld a, BANK(sMysteryGiftTimer)
	call OpenSRAM
	ld hl, sMysteryGiftTimer
	ld a, [hli]
	ld [wCurHPAnimMaxHP], a
	ld a, [hl]
	ld [wBuffer2], a
	call CloseSRAM
	ld hl, wCurHPAnimMaxHP
	call Function1183b
	jr nc, .asm_1195e
	ld hl, wCurHPAnimMaxHP
	call Function1182e
	call CloseSRAM
	farcall Function2a4f6
.asm_1195e
	ld a, BANK(sMysteryGiftTimer)
	call OpenSRAM
	ld hl, wBuffer1
	ld a, [hli]
	ld [sMysteryGiftTimer], a
	ld a, [hl]
	ld [sMysteryGiftTimer + 1], a
	call CloseSRAM
	ret

Function11972: ; 11972 (4:5972)
	cp $ff
	jr z, .asm_11981
	ld c, a
	ld a, [hl]
	sub c
	jr nc, .asm_1197c
	xor a
.asm_1197c
	ld [hl], a
	jr z, .asm_11981
	xor a
	ret

.asm_11981
	xor a
	ld [hl], a
	scf
	ret

GetSecondsSinceIfLessThan60:
	ld a, [wDaysSince]
	and a
	jr nz, asm_119b8
	ld a, [wHoursSince]
	and a
	jr nz, asm_119b8
	ld a, [wMinsSince]
	jr nz, asm_119b8
	ld a, [wSecsSince]
	ret

Function1199a: ; 1199a (4:599a)
	ld a, [wDaysSince]
	and a
	jr nz, asm_119b8
	ld a, [wHoursSince]
	and a
	jr nz, asm_119b8
	ld a, [wMinsSince]
	ret

GetHoursSinceIfLessThan24:
	ld a, [wDaysSince]
	and a
	jr nz, asm_119b8
	ld a, [wHoursSince]
	ret

Function119b4: ; 119b4 (4:59b4)
	ld a, [wDaysSince]
	ret

asm_119b8
	ld a, $ff
	ret

CalcDaysSince: ; 119bb (4:59bb)
	xor a
	jr CalcDaysSince_

CalcHoursDaysSince:
	inc hl
	xor a
	jr CalcHoursDaysSince_

CalcMinsHoursDaysSince: ; 119c2 (4:59c2)
	inc hl
	inc hl
	xor a
	jr CalcMinsHoursDaysSince_

CalcSecsMinsHoursDaysSince: ; 119c7 (4:59c7)
	inc hl
	inc hl
	inc hl
	ldh a, [hSeconds]
	ld c, a
	sub [hl]
	jr nc, .asm_119d2
	add 60
.asm_119d2
	ld [hl], c
	dec hl
	ld [wSecsSince], a
CalcMinsHoursDaysSince_
	ldh a, [hMinutes]
	ld c, a
	sbc [hl]
	jr nc, .asm_119df
	add 60
.asm_119df
	ld [hl], c
	dec hl
	ld [wMinsSince], a
CalcHoursDaysSince_
	ldh a, [hHours]
	ld c, a
	sbc [hl]
	jr nc, .asm_119ec
	add 24
.asm_119ec
	ld [hl], c
	dec hl
	ld [wHoursSince], a
CalcDaysSince_:
	ld a, [wCurDay]
	ld c, a
	sbc [hl]
	jr nc, .asm_119fa
	add 20 * 7
.asm_119fa
	ld [hl], c
	ld [wDaysSince], a
	ret

CopyDayHourMinSecToHL: ; 119ff (4:59ff)
	ld a, [wCurDay]
	ld [hli], a
	ldh a, [hHours]
	ld [hli], a
	ldh a, [hMinutes]
	ld [hli], a
	ldh a, [hSeconds]
	ld [hli], a
	ret

CopyDayToHL: ; 11a0d (4:5a0d)
	ld a, [wCurDay]
	ld [hl], a
	ret

CopyDayHourToHL:
	ld a, [wCurDay]
	ld [hli], a
	ldh a, [hHours]
	ld [hli], a
	ret

CopyDayHourMinToHL: ; 11a1a (4:5a1a)
	ld a, [wCurDay]
	ld [hli], a
	ldh a, [hHours]
	ld [hli], a
	ldh a, [hMinutes]
	ld [hli], a
	ret
