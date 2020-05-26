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
	call StatsScreenMain

	; restore old values
	pop af
	ldh [hMapAnims], a
	ret

StatsScreenMain:
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
	jr .ok

.not_tempmon
	call CopyMonToTempMon
	ld a, [wCurPartySpecies]
; skip CalcTempmonStats if egg or boxmon
	cp EGG
	jp z, .ok
	ld a, [wMonType]
	cp BOXMON
	jr c, .ok
	call CalcTempmonStats

.ok
	call ClearBGPalettes
	call ClearTilemap
	call UpdateSprites
	callfar StatsScreen_LoadFont

	pop bc
	ld a, [wCurPartySpecies]
	cp EGG
	jp z, EggStatsInit

;MonStatsScreen ; ?
	call StatsScreen_InitUpperHalf
	ld b, 0
	jp StatsScreen_SetJumptableIndex

StatsScreen_LoadPage: ; ?
	push bc
	ld de, MonStatsInit
	push de
	jp hl

MonStatsInit: ; ?
	pop bc
	ld b, 1
; fall through
MonStatsJoypadLoop:
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
	jr nz, StatsScreenMain
	ld a, [wMenuJoypad]
	jr .joypad_action

.not_tempmon
	ldh a, [hJoyPressed]

.joypad_action
	and D_DOWN | D_UP | D_LEFT | D_RIGHT | A_BUTTON | B_BUTTON
	jr z, MonStatsJoypadLoop
	bit B_BUTTON_F, a
	jp nz, StatsScreen_Exit
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
	jr nc, MonStatsJoypadLoop
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]

.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, MonStatsJoypadLoop
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
	jr z, MonStatsJoypadLoop
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
	jp StatsScreenMain

.a_button:
	ld a, c
	cp BLUE_PAGE ; last page
	jr z, StatsScreen_Exit

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

StatsScreen_SetJumptableIndex: ; ?
	ld hl, StatsScreen_PageJumptable
	push bc
	dec c
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	jp StatsScreen_LoadPage

EggStatsInit:
	push bc
	call EggStatsScreen
	pop bc

EggStatsJoypadLoop:
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
	jp nz, StatsScreenMain
	ld a, [wMenuJoypad]
	jr .joypad_action

.not_tempmon
	ldh a, [hJoyPressed]

.joypad_action
	and D_DOWN | D_UP | A_BUTTON | B_BUTTON
	jr z, EggStatsJoypadLoop
	bit A_BUTTON_F, a
	jr nz, StatsScreen_Exit
	bit B_BUTTON_F, a
	jr nz, StatsScreen_Exit
	bit D_UP_F, a
	jr nz, EggStats_UpAction
	bit D_DOWN_F, a
	jp EggStats_DownAction

StatsScreen_Exit:
	call ClearBGPalettes
	call ClearTilemap
	ret

EggStats_DownAction:
	ld a, [wMonType]
	cp BOXMON
	jr nc, EggStatsJoypadLoop
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]
.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, EggStatsJoypadLoop
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, EggStats_ScrollToLoadMon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
	jr EggStats_ScrollToLoadMon

EggStats_UpAction:
	ld a, [wCurPartyMon]
	and a
	jr z, EggStatsJoypadLoop
	dec a
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, EggStats_ScrollToLoadMon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
; fall through
EggStats_ScrollToLoadMon:
	jp StatsScreenMain

StatsScreen_PageJumptable:
; entries correspond to *_PAGE constants
	dw PinkPage
	dw GreenPage
	dw BluePage

StatsScreen_InitUpperHalf:
	push bc
	xor a
	ldh [hBGMapMode], a
	ld a, [wBaseDexNo]
	ld [wDeciramBuffer], a
	ld [wCurSpecies], a
	hlcoord 8, 0
	ld [hl], "№"
	inc hl
	ld [hl], "."
	inc hl
	ld de, wDeciramBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 14, 0
	call PrintLevel
	ld hl, .NicknamePointers
	call GetNicknamePointer

;.copy_nickname
	ld a, [wMonType]
	cp BOXMON
	ld a, BANK(sBoxMonNicknames)
	call z, OpenSRAM
	ld d, h
	ld e, l
	hlcoord 8, 2
	call PlaceString
	ld a, [wMonType]
	cp BOXMON
	call z, CloseSRAM
	call GetGender
	jr c, .next
	ld a, "♂"
	jr nz, .place_gender_char
	ld a, "♀"
.place_gender_char
	hlcoord 18, 0
	ld [hl], a
.next
	hlcoord 9, 4
	ld a, "/"
	ld [hli], a
	ld a, [wBaseDexNo]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	call PlaceString
	call StatsScreen_PlaceHorizontalDivider
	call StatsScreen_PlacePageSwitchArrows
	call StatsScreen_PlaceShinyIcon
;.place_hp_bar
	ld hl, wTempMonHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wTempMonMaxHP
	ld a, [hli]
	ld d, a
	ld e, [hl]
	callfar ComputeHPBarPixels
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	pop bc
	ret

.NicknamePointers:
	dw wPartyMonNicknames
	dw wOTPartyMonNicknames
	dw sBoxMonNicknames
	dw wBufferMonNick

PinkPage:
	dr $50de1, $50f5d

StatsScreen_PlaceHorizontalDivider:
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, $62 ; horizontal divider (empty HP/exp bar)
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

StatsScreen_PlacePageSwitchArrows:
	hlcoord 12, 6
	ld [hl], "◀"
	hlcoord 19, 6
	ld [hl], "▶"
	ret

StatsScreen_PlaceShinyIcon:
	ld bc, wTempMonDVs
	callfar CheckShininess
	ret nc
	hlcoord 19, 0
	ld [hl], "⁂"
	ret

GreenPage:
	dr $50f84, $5100b

BluePage:
	dr $5100b, $510bb

IDNoString:
	db "<ID>№.@"

OTString:
	db "OT/@"

StatsScreen_PlaceFrontpic:
	push bc
	call SetPalettes
	ld hl, wTempMonDVs
	call GetUnownLetter
	hlcoord 0, 0
	ld a, [wCurPartySpecies]
	cp UNOWN
	jr z, .unown

	call PrepMonFrontpic
	jr .play_cry

.unown
	xor a
	ld [wBoxAlignment], a
	call _PrepMonFrontpic

.play_cry
	ld a, [wCurPartySpecies]
	call PlayMonCry
	pop bc
	ld b, 1
	ret

EggStatsScreen:
	ld hl, wCurHPPal
	call SetHPPal
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call StatsScreen_PlaceHorizontalDivider
	hlcoord 8, 1
	ld de, EggString
	call PlaceString
	hlcoord 8, 3
	ld de, IDNoString
	call PlaceString
	hlcoord 8, 5
	ld de, OTString
	call PlaceString
	hlcoord 11, 3
	ld de, FiveQMarkString
	call PlaceString
	hlcoord 11, 5
	ld de, FiveQMarkString
	call PlaceString
	ld a, [wTempMonHappiness] ; egg status
	ld de, EggSoonString
	cp $6
	jr c, .picked
	ld de, EggCloseString
	cp $b
	jr c, .picked
	ld de, EggMoreTimeString
	cp $29
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 9
	call PlaceString
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	call SetPalettes ; pals
	hlcoord 0, 0
	call PrepMonFrontpic
	ld a, [wTempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	call PlaySFX
	call WaitSFX
	ret

EggString:
	db "EGG@"

FiveQMarkString:
	db "?????@"

EggSoonString:
	db   "It's making sounds"
	next "inside. It's going"
	next "to hatch soon!@"

EggCloseString:
	db   "It moves around"
	next "inside sometimes."
	next "It must be close"
	next "to hatching.@"

EggMoreTimeString:
	db   "Wonder what's"
	next "inside? It needs"
	next "more time, though.@"

EggALotMoreTimeString:
	db   "This EGG needs a"
	next "lot more time to"
	next "hatch.@"

StatsScreen_LoadPageIndicators:
	hlcoord 13, 5
	ld a, $36 ; first of 4 small square tiles
	call .load_square
	hlcoord 15, 5
	ld a, $36 ; " " " "
	call .load_square
	hlcoord 17, 5
	ld a, $36 ; " " " "
	call .load_square
	ld a, b
	cp GREEN_PAGE
	ld a, $3a ; first of 4 large square tiles
	hlcoord 13, 5 ; PINK_PAGE (< GREEN_PAGE)
	jr c, .load_square
	hlcoord 15, 5 ; GREEN_PAGE (= GREEN_PAGE)
	jr z, .load_square
	hlcoord 17, 5 ; BLUE_PAGE (> GREEN_PAGE)
.load_square
	ld [hli], a
	inc a
	ld [hld], a
	push bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret

GetNicknamePointer:
	ld a, [wMonType]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMonType]
	cp TEMPMON
	ret z
	ld a, [wCurPartyMon]
	jp SkipNames

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
