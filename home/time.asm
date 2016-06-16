AskTimer:: ; 45b (0:045b)
	reti

LatchClock:: ; 45c (0:045c)
	ld a, $0
	ld [MBC3LatchClock], a
	ld a, $1
	ld [MBC3LatchClock], a
	ret

UpdateTime:: ; 467 (0:0467)
	call GetClock
	call FixDays
	call FixTime
	callba Function14032
	ret

GetClock:: ; 477 (0:0477)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	call LatchClock
	ld hl, MBC3SRamBank
	ld de, MBC3RTC
	ld [hl], RTC_S
	ld a, [de]
	and $3f
	ld [hRTCSeconds], a
	ld [hl], RTC_M
	ld a, [de]
	and $3f
	ld [hRTCMinutes], a
	ld [hl], RTC_H
	ld a, [de]
	and $1f
	ld [hRTCHours], a
	ld [hl], RTC_DL
	ld a, [de]
	ld [hRTCDayLo], a
	ld [hl], RTC_DH
	ld a, [de]
	ld [hRTCDayHi], a
	call CloseSRAM
	ret

FixDays:: ; 4a8 (0:04a8)
	ld a, [hRTCDayHi]
	bit 0, a
	jr z, .daylo
	res 0, a
	ld [hRTCDayHi], a
	ld a, [hRTCDayLo]
.modh
	sub 140
	jr nc, .modh
.modl
	sub 140
	jr nc, .modl
	add 140
	ld [hRTCDayLo], a
	ld a, $40
	jr .set
.daylo
	ld a, [hRTCDayLo]
	cp 140
	jr c, .quit
.mod
	sub 140
	jr nc, .mod
	add 140
	ld [hRTCDayLo], a
	ld a, $20
.set
	push af
	call SetClock
	pop af
	scf
	ret
.quit
	ccf
	xor a
	ret

FixTime:: ; 4de (0:04de)
	ld a, [hRTCSeconds]
	ld c, a
	ld a, [wd1df]
	add c
	sub 60
	jr nc, .asm_4eb
	add 60
.asm_4eb
	ld [hSeconds], a
	ccf
	ld a, [hRTCMinutes]
	ld c, a
	ld a, [wd1de]
	adc c
	sub 60
	jr nc, .asm_4fb
	add 60
.asm_4fb
	ld [hMinutes], a
	ccf
	ld a, [hRTCHours]
	ld c, a
	ld a, [wd1dd]
	adc c
	sub 24
	jr nc, .asm_50b
	add 24
.asm_50b
	ld [hHours], a
	ccf
	ld a, [hRTCDayLo]
	ld c, a
	ld a, [wd1dc]
	adc c
	ld [wd1f2], a
	ret

SetTimeOfDay::
	xor a
	ld [wStringBuffer2], a
	ld a, $0
	ld [wStringBuffer2 + 3], a
	jr InitTime

SetDayOfWeek::
	call UpdateTime
	ld a, [hHours]
	ld [wStringBuffer2 + 1], a
	ld a, [hMinutes]
	ld [wStringBuffer2 + 2], a
	ld a, [hSeconds]
	ld [wStringBuffer2 + 3], a
	jr InitTime

InitTime::
	callba Function140ff
	ret

PanicResetClock::
	call ClearhRTC
	call SetClock
	ret

ClearhRTC:: ; 546 (0:0546)
	xor a
	ld [hRTCSeconds], a
	ld [hRTCMinutes], a
	ld [hRTCHours], a
	ld [hRTCDayLo], a
	ld [hRTCDayHi], a
	ret

SetClock:: ; 552 (0:0552)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	call LatchClock
	ld hl, MBC3SRamBank
	ld de, MBC3RTC
	ld [hl], RTC_DH
	ld a, [de]
	bit 6, a
	ld [de], a
	ld [hl], RTC_S
	ld a, [hRTCSeconds]
	ld [de], a
	ld [hl], RTC_M
	ld a, [hRTCMinutes]
	ld [de], a
	ld [hl], RTC_H
	ld a, [hRTCHours]
	ld [de], a
	ld [hl], RTC_DL
	ld a, [hRTCDayLo]
	ld [de], a
	ld [hl], RTC_DH
	ld a, [hRTCDayHi]
	res 6, a
	ld [de], a
	call CloseSRAM
	ret

ClearRTCStatus::
	xor a
	push af
	ld a, BANK(s0_ac60)
	call OpenSRAM
	pop af
	ld [s0_ac60], a
	call CloseSRAM
	ret

RecordRTCStatus::
	ld hl, s0_ac60
	push af
	ld a, BANK(s0_ac60)
	call OpenSRAM
	pop af
	or [hl]
	ld [hl], a
	call CloseSRAM
	ret

CheckRTCStatus::
	ld a, BANK(s0_ac60)
	call OpenSRAM
	ld a, [s0_ac60]
	call CloseSRAM
	ret
