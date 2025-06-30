	const_def 1
	const PINK_PAGE  ; 1
	const GREEN_PAGE ; 2
	const BLUE_PAGE  ; 3
DEF NUM_STAT_PAGES EQU const_value - 1

StatsScreenInit:
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a ; disable overworld tile animations

	ld c, PINK_PAGE ; first_page
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
	jr .got_stats

.not_tempmon
	call CopyMonToTempMon
	ld a, [wCurPartySpecies]
	cp EGG
	jp z, .got_stats
	ld a, [wMonType]
	cp BOXMON
	jr c, .got_stats
	call CalcTempmonStats

.got_stats
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
	jp StatsScreen_JumpToLoadPageFunction

StatsScreen_LoadPage:
	push bc
	ld de, .done_loading
	push de
	jp hl

.done_loading
	pop bc
	ld b, 1

.joypad_loop
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
	and PAD_DOWN | PAD_UP
	jr nz, StatsScreenMain
	ld a, [wMenuJoypad]
	jr .joypad_action

.not_tempmon
	ldh a, [hJoyPressed]

.joypad_action
	and PAD_CTRL_PAD | PAD_A | PAD_B
	jr z, .joypad_loop
	bit B_BUTTON_F, a
	jp nz, StatsScreen_Exit
	bit B_PAD_LEFT, a
	jr nz, .d_left
	bit B_PAD_RIGHT, a
	jr nz, .d_right
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit B_PAD_UP, a
	jr nz, .d_up

; down
	ld a, [wMonType]
	cp BOXMON
	jr nc, .joypad_loop
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]
.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, .joypad_loop
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
	jr z, .joypad_loop
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

.a_button
	ld a, c
	cp BLUE_PAGE ; last page
	jr z, StatsScreen_Exit

.d_right
	inc c
	ld a, BLUE_PAGE ; last page
	cp c
	jr nc, StatsScreen_JumpToLoadPageFunction
	ld c, PINK_PAGE ; first page
	jr StatsScreen_JumpToLoadPageFunction

.d_left
	dec c
	jr nz, StatsScreen_JumpToLoadPageFunction
	ld c, BLUE_PAGE ; last page
; fallthrough

StatsScreen_JumpToLoadPageFunction:
	ld hl, StatsScreen_LoadPageJumptable
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
; fallthrough

EggStats_JoypadLoop:
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
	and PAD_DOWN | PAD_UP
	jp nz, StatsScreenMain
	ld a, [wMenuJoypad]
	jr .joypad_action

.not_tempmon
	ldh a, [hJoyPressed]
.joypad_action
	and PAD_DOWN | PAD_UP | PAD_A | PAD_B
	jr z, EggStats_JoypadLoop
	bit A_BUTTON_F, a
	jr nz, StatsScreen_Exit
	bit B_BUTTON_F, a
	jr nz, StatsScreen_Exit
	bit B_PAD_UP, a
	jr nz, EggStats_UpAction
	bit B_PAD_DOWN, a
	jp EggStats_DownAction

StatsScreen_Exit:
	call ClearBGPalettes
	call ClearTilemap
	ret

EggStats_DownAction:
	ld a, [wMonType]
	cp BOXMON
	jr nc, EggStats_JoypadLoop
	and a
	ld a, [wPartyCount]
	jr z, .next_mon
	ld a, [wOTPartyCount]
.next_mon
	ld b, a
	ld a, [wCurPartyMon]
	inc a
	cp b
	jr z, EggStats_JoypadLoop
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
	jr z, EggStats_JoypadLoop
	dec a
	ld [wCurPartyMon], a
	ld b, a
	ld a, [wMonType]
	and a
	jr nz, EggStats_ScrollToLoadMon
	ld a, b
	inc a
	ld [wPartyMenuCursor], a
; fallthrough

EggStats_ScrollToLoadMon:
	jp StatsScreenMain

StatsScreen_LoadPageJumptable:
; entries correspond to *_PAGE constants
	table_width 2
	dw LoadPinkPage
	dw LoadGreenPage
	dw LoadBluePage
	assert_table_length NUM_STAT_PAGES

StatsScreen_InitUpperHalf:
	push bc
	xor a
	ldh [hBGMapMode], a
	ld a, [wBaseDexNo]
	ld [wTextDecimalByte], a
	ld [wCurSpecies], a
	hlcoord 8, 0
	ld [hl], "№"
	inc hl
	ld [hl], "."
	inc hl
	ld de, wTextDecimalByte
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 14, 0
	call PrintLevel
	ld hl, .NicknamePointers
	call GetNicknamePointer
; Nickname
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
; Gender character
	call GetGender
	jr c, .next
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"
.got_gender
	hlcoord 18, 0
	ld [hl], a
.next
	hlcoord 9, 4
	ld a, "/"
	ld [hli], a
	ld a, [wBaseDexNo]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	call PlaceString
	call StatsScreen_PlaceHorizontalDivider
	call StatsScreen_PlacePageSwitchArrows
	call StatsScreen_PlaceShinyIcon
; Place HP bar
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
	dw wBufferMonNickname

LoadPinkPage:
	push bc
	push bc
	xor a
	ldh [hBGMapMode], a
	ld a, [wBaseDexNo]
	ld [wTextDecimalByte], a
	ld [wCurSpecies], a
	ld b, PINK_PAGE
	call StatsScreen_LoadPageIndicators

; Load graphics
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
	hlcoord 0, 9
	ld b, $0
	call DrawPlayerHP
	hlcoord 8, 9
	ld [hl], $41 ; right HP/exp bar end cap
	hlcoord 0, 12
	ld de, .Status_Type
	call PlaceString
	ld a, [wTempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .HasPokerus
	ld a, b
	and $f0
	jr z, .NotImmuneToPkrs
	hlcoord 8, 8
	ld [hl], "." ; Pokérus immunity dot
.NotImmuneToPkrs:
	ld a, [wMonType]
	cp BOXMON
	jr z, .StatusOK
	hlcoord 6, 13
	push hl
	ld de, wTempMonStatus
	call PlaceStatusString
	pop hl
	jr .StatusOK
.HasPokerus:
	ld de, .PkrsStr
	hlcoord 1, 13
	call PlaceString
	jr .done_status
.StatusOK:
	ld de, .OK_str
	call z, PlaceString
.done_status
	hlcoord 1, 15
	call PrintMonTypes
	ld bc, 9
	decoord 0, 16
	hlcoord 0, 17
	call CopyBytes
	ld a, " "
	ld bc, 9
	hlcoord 0, 17
	call ByteFill
	hlcoord 9, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	hlcoord 10, 9
	ld de, .ExpPointStr
	call PlaceString
; print next level
	ld a, [wTempMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .got_level
	inc a
	ld [wTempMonLevel], a
.got_level
	hlcoord 17, 14
	call PrintLevel
	pop af
	ld [wTempMonLevel], a
	ld de, wTempMonExp
	hlcoord 13, 10
	lb bc, 3, 7
	call PrintNum
; level-up graphics and strings
	call .CalcExpToNextLevel
	ld de, wExpToNextLevel
	hlcoord 13, 13
	lb bc, 3, 7
	call PrintNum
	hlcoord 10, 12
	ld de, .LevelUpStr
	call PlaceString
	hlcoord 14, 14
	ld de, .ToStr
	call PlaceString
	ld a, [wTempMonLevel]
	ld b, a
	ld de, wTempMonExp + 2
	hlcoord 11, 16
	predef FillInExpBar
	hlcoord 10, 16
	ld [hl], $40 ; left exp bar end cap
	hlcoord 19, 16
	ld [hl], $41 ; right exp bar end cap

; Load palettes / place frontpic
	pop bc
	farcall LoadStatsScreenPals
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	pop bc
	ld a, b
	and a
	jp z, StatsScreen_PlaceFrontpic
	ret

.CalcExpToNextLevel:
	ld a, [wTempMonLevel]
	cp MAX_LEVEL
	jr z, .AlreadyAtMaxLevel
	inc a
	ld d, a
	call CalcExpAtLevel
	ld hl, wTempMonExp + 2
	ld hl, wTempMonExp + 2
	ldh a, [hQuotient + 3]
	sub [hl]
	dec hl
	ld [wExpToNextLevel + 2], a
	ldh a, [hQuotient + 2]
	sbc [hl]
	dec hl
	ld [wExpToNextLevel + 1], a
	ldh a, [hQuotient + 1]
	sbc [hl]
	ld [wExpToNextLevel], a
	ret

.AlreadyAtMaxLevel:
	ld hl, wExpToNextLevel
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

.Status_Type:
	db   "STATUS/"
	next "TYPE/@"

.OK_str:
	db "OK @"

.ExpPointStr:
	db "EXP POINTS@"

.LevelUpStr:
	db "LEVEL UP@"

.ToStr:
	db "TO@"

.PkrsStr:
	db "#RUS@"

StatsScreen_PlaceVerticalDivider: ; unreferenced
; The Japanese stats screen has a vertical divider.
	hlcoord 7, 0
	ld bc, SCREEN_WIDTH
	ld d, SCREEN_HEIGHT
.loop
	ld a, $31 ; vertical divider
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	ret

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

LoadGreenPage:
	push bc
	push bc
	xor a
	ldh [hBGMapMode], a
	ld b, GREEN_PAGE
	call StatsScreen_LoadPageIndicators

; Load graphics
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
; item info
	hlcoord 0, 8
	ld de, .Item
	call PlaceString
	ld a, [wTempMonItem]
	and a
	ld de, .ThreeDashes
	jr z, .got_item_name
	ld b, a
	farcall TimeCapsule_ReplaceTeruSama
	ld a, b
	ld [wNamedObjectIndex], a
	call GetItemName
.got_item_name
	hlcoord 6, 8
	call PlaceString
; move info
	ld hl, wTempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	hlcoord 0, 10
	ld de, .Move
	call PlaceString
	hlcoord 8, 10
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	call ListMoves
	hlcoord 12, 11
	ld a, SCREEN_WIDTH * 2
	ld [wListMovesLineSpacing], a
	call ListMovePP

; Load palettes / place frontpic
	pop bc
	farcall LoadStatsScreenPals
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	pop bc
	ld a, b
	and a
	jp z, StatsScreen_PlaceFrontpic
	ret

.Item:
	db "ITEM@"

.ThreeDashes:
	db "---@"

.Move:
	db "MOVE@"

LoadBluePage:
	push bc
	push bc
	xor a
	ldh [hBGMapMode], a
	ld b, BLUE_PAGE
	call StatsScreen_LoadPageIndicators

; Load graphics
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
	call .PlaceOTInfo
	hlcoord 10, 8
	ld de, SCREEN_WIDTH
	ld b, 10
	ld a, $31 ; vertical divider
.vertical_divider
	ld [hl], a
	add hl, de
	dec b
	jr nz, .vertical_divider
	hlcoord 11, 8
	ld bc, 6
	call PrintTempMonStats

; Load palettes / place frontpic
	pop bc
	farcall LoadStatsScreenPals
	call WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	pop bc
	ld a, b
	and a
	jp z, StatsScreen_PlaceFrontpic
	ret

.PlaceOTInfo:
	hlcoord 0, 9
	ld de, IDNoString
	call PlaceString
	hlcoord 0, 12
	ld de, OTString
	call PlaceString
	hlcoord 2, 10
	ld de, wTempMonID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld hl, .OTNamePointers
	call GetNicknamePointer
; OT name
	ld a, [wMonType]
	cp BOXMON
	ld a, BANK(sBoxMonOTs)
	call z, OpenSRAM
	ld de, wStringBuffer1
	push de
	ld bc, NAME_LENGTH
	call CopyBytes
	pop de
	ld a, [wMonType]
	cp BOXMON
	call z, CloseSRAM
	callfar CorrectNickErrors
	push de

; Adjust coordinate of OT name based on index of nickname terminator
	lb bc, 0, -1
.loop
	inc c
	ld a, [de]
	inc de
	cp "@"
	jr nz, .loop
; remove left padding if name was 8-10 chars (somehow?)
	ld a, NAME_LENGTH - 1
	sub c
	cp NAME_LENGTH - PLAYER_NAME_LENGTH
; otherwise, use 2 spaces of left padding
	jr c, .ok
	ld a, NAME_LENGTH - PLAYER_NAME_LENGTH - 1
.ok
	ld c, a
	hlcoord 0, 13
	add hl, bc
; that's finally over ... place string, quit forever
	pop de
	call PlaceString
	ret

.OTNamePointers:
	dw wPartyMonOTs
	dw wOTPartyMonOTs
	dw sBoxMonOTs
	dw wBufferMonOT

IDNoString:
	db "<ID>№.@"

OTString:
	db "OT/@"

StatsScreen_PlaceFrontpic:
	push bc
	call SetDefaultBGPAndOBP
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
	call SetDefaultBGPAndOBP
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
