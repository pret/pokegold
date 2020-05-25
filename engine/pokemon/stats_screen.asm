	const_def 1
	const PINK_PAGE  ; 1
	const GREEN_PAGE ; 2
	const BLUE_PAGE  ; 3
NUM_STAT_PAGES EQU const_value - 1

STAT_PAGE_MASK EQU %00000011

StatsScreenInit:
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a ; disable overworld tile animations
	ld c, 1
	call StatsScreen_CopyToTempMon

	; restore old values
	pop af
	ldh [hMapAnims], a
	ret

StatsScreen_CopyToTempMon:
	push bc
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .not_tempmon
	ld a, [wBufferMonSpecies]
	ld [wCurSpecies], a
	call GetBaseData
	ld hl, wBufferMon
	ld de, wTempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	jr .done

.not_tempmon
	call CopyMonToTempMon
	ld a, [wCurPartySpecies]

; skip CalcTempmonStats if egg or boxmon
	cp EGG
	jp z, .done
	ld a, [wMonType]
	cp BOXMON
	jr c, .done
	call CalcTempmonStats

.done
	call ClearBGPalettes
	call ClearTilemap
	call UpdateSprites
	callfar StatsScreen_LoadFont
	pop bc
	ld a, [wCurPartySpecies]
	cp EGG
	jp z, EggStatsInit

	call StatsScreen_InitUpperHalf
	ld b, 0
	jp StatsScreen_SetJumptableIndex

Function50c11:
	push bc
	ld de, Function50c17
	push de
	jp hl

Function50c17:
	pop bc
	ld b, 1

StatsScreen_GetJoypad:
.loop
	call GetJoypad
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .notbreedmon
	push hl
	push de
	push bc
	farcall StatsScreenDPad
	pop bc
	pop de
	pop hl
	ld a, [wMenuJoypad]
	and D_DOWN | D_UP
	jr nz, StatsScreen_CopyToTempMon
	ld a, [wMenuJoypad]
	jr .joypad_action

.notbreedmon
	ldh a, [hJoyPressed]

.joypad_action
	and D_DOWN | D_UP | D_LEFT | D_RIGHT | A_BUTTON | B_BUTTON
	jr z, .loop
	bit B_BUTTON_F, a
	jp nz, Function50cfc ; .b_button
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit D_UP_F, a
	jr nz, .d_up

;.d_down
	ld a, [wMonType]
	cp BOXMON
	jr nc, StatsScreen_GetJoypad
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]

.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, StatsScreen_GetJoypad
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr .load_mon

.d_up
	ld a, [wCurPartyMon]
	and a
	jr z, StatsScreen_GetJoypad
	dec a
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, .load_mon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
.load_mon
	jp StatsScreen_CopyToTempMon

.a_button:
	ld a, c
	cp BLUE_PAGE ; last page
	jr z, Function50cfc ; .b_button

.d_right:
	inc c
	ld a, BLUE_PAGE ; last page
	cp c
	jr nc, StatsScreen_SetJumptableIndex
	ld c, PINK_PAGE ; first page
	jr StatsScreen_SetJumptableIndex

.d_left:
	dec c
	jr nz, StatsScreen_SetJumptableIndex
	ld c, BLUE_PAGE ; last page

StatsScreen_SetJumptableIndex:
	ld hl, Jumptable_50d45
	push bc
	dec c
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	jp Function50c11

EggStatsInit:
	push bc
	call EggStatsScreen
	pop bc

EggStatsJoypad:
.loop
	call GetJoypad
	ld a, [wMonType]
	cp TEMPMON
	jr nz, .not_tempmon
	push hl
	push de
	push bc
	farcall StatsScreenDPad
	pop bc
	pop de
	pop hl
	ld a, [wMenuJoypad]
	and D_DOWN | D_UP
	jp nz, StatsScreen_CopyToTempMon
	ld a, [wMenuJoypad]
	jr .joypad_action

.not_tempmon
	ldh a, [hJoyPressed]

.joypad_action
	and D_DOWN | D_UP | A_BUTTON | B_BUTTON
	jr z, .loop
	bit A_BUTTON_F, a
	jr nz, Function50cfc
	bit B_BUTTON_F, a
	jr nz, Function50cfc
	bit D_UP_F, a
	jr nz, Function50d2c
	bit D_DOWN_F, a
	jp Function50d03

Function50cfc:
	dr $50cfc, $50d03

Function50d03:
	dr $50d03, $50d2c

Function50d2c:
	dr $50d2c, $50d45

Jumptable_50d45:
; entries correspond to *_PAGE constants
	dw PinkPage
	dw GreenPage
	dw BluePage

StatsScreen_InitUpperHalf:
	dr $50d4b, $50de1
PinkPage:
	dr $50de1, $50f84
GreenPage:
	dr $50f84, $5100b
BluePage:
	dr $5100b, $510ed
EggStatsScreen:
	dr $510ed, $5128f

PrintTempMonStats:
; Print wTempMon's stats at hl, with spacing bc.
	push bc
	push hl
	ld de, .StatNames
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld de, wTempMonAttack
	lb bc, 2, 3
	call .PrintStat
	ld de, wTempMonDefense
	call .PrintStat
	ld de, wTempMonSpclAtk
	call .PrintStat
	ld de, wTempMonSpclDef
	call .PrintStat
	ld de, wTempMonSpeed
	jp PrintNum

.PrintStat:
	push hl
	call PrintNum
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret

.StatNames:
	db   "ATTACK"
	next "DEFENSE"
	next "SPCL.ATK"
	next "SPCL.DEF"
	next "SPEED"
	next "@"
