	const_def $6a
	const DEBUGTEST_TICKS_1 ; $6a
	const DEBUGTEST_TICKS_2 ; $6b
	const DEBUGTEST_WHITE   ; $6c
	const DEBUGTEST_LIGHT   ; $6d
	const DEBUGTEST_DARK    ; $6e
	const DEBUGTEST_BLACK   ; $6f
	const DEBUGTEST_0       ; $70
	const DEBUGTEST_1       ; $71
	const DEBUGTEST_2       ; $72
	const DEBUGTEST_3       ; $73
	const DEBUGTEST_4       ; $74
	const DEBUGTEST_5       ; $75
	const DEBUGTEST_6       ; $76
	const DEBUGTEST_7       ; $77
	const DEBUGTEST_8       ; $78
	const DEBUGTEST_9       ; $79
	const DEBUGTEST_A       ; $7a
	const DEBUGTEST_B       ; $7b
	const DEBUGTEST_C       ; $7c
	const DEBUGTEST_D       ; $7d
	const DEBUGTEST_E       ; $7e
	const DEBUGTEST_F       ; $7f

ColorTest:
; A debug menu to test monster and trainer palettes at runtime.

	ldh a, [hCGB]
	and a
	jr nz, .asm_fd2d2
	ldh a, [hSGB]
	and a
	ret z

.asm_fd2d2
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	call DisableLCD
	call Functionfd365
	call Functionfd399
	call Functionfd3c4
	call Functionfd311
	call EnableLCD
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld [wJumptableIndex], a
	ld [wce66], a
	ld [wceee], a
.asm_fd2fb
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_fd30d
	call Functionfd487
	call Functionfd967
	call DelayFrame
	jr .asm_fd2fb

.asm_fd30d
	pop af
	ldh [hInMenu], a
	ret

Functionfd311:
	ld a, [wceed]
	and a
	jr nz, Functionfd32e
	ld hl, PokemonPalettes

Functionfd31a:
	ld de, wOverworldMapBlocks
	ld c, NUM_POKEMON + 1
.asm_fd31f
	push bc
	push hl
	call Functionfd345
	pop hl
	ld bc, 8
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_fd31f
	ret

Functionfd32e:
	ld hl, TrainerPalettes
	ld de, wOverworldMapBlocks
	ld c, NUM_TRAINER_CLASSES
.asm_fd336
	push bc
	push hl
	call Functionfd345
	pop hl
	ld bc, 4
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_fd336
	ret

Functionfd345:
	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, BANK(PokemonPalettes) ; aka BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	ret

Functionfd365:
	ld a, $1
	ldh [rVBK], a
	ld hl, vTiles0
	ld bc, sScratch - vTiles0
	xor a
	call ByteFill
	ld a, $0
	ldh [rVBK], a
	ld hl, vTiles0
	ld bc, sScratch - vTiles0
	xor a
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	call ClearSprites
	ret

Functionfd399:
	ld hl, DebugColorTestGFX
	ld de, vTiles2 tile DEBUGTEST_TICKS_1
	ld bc, 22 tiles
	call CopyBytes
	ld hl, DebugUpArrowGFX
	ld de, vTiles0
	ld bc, 1 tiles
	call CopyBytes
	call LoadStandardFont
	ld hl, vTiles1
	lb bc, 8, 0
.asm_fd3ba
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_fd3ba
	ret

Functionfd3c4:
	ldh a, [hCGB]
	and a
	ret z
	ld hl, Palette_DebugBG
	ld de, wBGPals2
	ld bc, 16 palettes
	call CopyBytes
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld hl, Palette_DebugBG
	ld c, 8 palettes
	xor a
.asm_fd3de
	ldh [rBGPD], a
	dec c
	jr nz, .asm_fd3de
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld hl, Palette_DebugOB
	ld c, 8 palettes
.asm_fd3ec
	ld a, [hli]
	ldh [rOBPD], a
	dec c
	jr nz, .asm_fd3ec
	ld a, $94
	ld [wc508], a
	ld a, $52
	ld [wc508 + 1], a
	ld a, $4a
	ld [wc508 + 2], a
	ld a, $29
	ld [wc508 + 3], a
	ret

Palette_DebugBG:
INCLUDE "gfx/debug/bg.pal"

Palette_DebugOB:
INCLUDE "gfx/debug/ob.pal"

Functionfd487:
	call JoyTextDelay
	ld a, [wJumptableIndex]
	cp $4
	jr nc, .asm_fd49e
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .asm_fd4ad
	ld a, [hl]
	and START
	jr nz, .asm_fd4be

.asm_fd49e
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_fd4e2
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.asm_fd4ad
	call Functionfd8d3
	call Functionfd4d6
	ld e, a
	ld a, [wce66]
	inc a
	cp e
	jr c, .asm_fd4cd
	xor a
	jr .asm_fd4cd

.asm_fd4be
	call Functionfd8d3
	ld a, [wce66]
	dec a
	cp $ff
	jr nz, .asm_fd4cd
	call Functionfd4d6
	dec a

.asm_fd4cd
	ld [wce66], a
	ld a, $0
	ld [wJumptableIndex], a
	ret

Functionfd4d6:
; Looping back around the pic set.
	ld a, [wceed]
	and a
	jr nz, .asm_fd4df
	ld a, NUM_POKEMON ; CELEBI
	ret

.asm_fd4df
	ld a, NUM_TRAINER_CLASSES - 1 ; MYSTICALMAN
	ret

Jumptable_fd4e2:
	dw Functionfd4ee
	dw Functionfd62b
	dw Functionfd646
	dw Functionfd6cb
	dw Functionfd797
	dw Functionfd7b8

Functionfd4ee:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, DEBUGTEST_BLACK
	call ByteFill
	hlcoord 1, 3
	lb bc, 7, 18
	ld a, DEBUGTEST_WHITE
	call Bank3f_FillBoxWithByte
	hlcoord 11, 0
	lb bc, 2, 3
	ld a, DEBUGTEST_LIGHT
	call Bank3f_FillBoxWithByte
	hlcoord 16, 0
	lb bc, 2, 3
	ld a, DEBUGTEST_DARK
	call Bank3f_FillBoxWithByte
	call Functionfd5d3
	call Functionfd607
	ld a, [wce66]
	inc a
	ld [wCurPartySpecies], a
	ld [wDeciramBuffer], a
	hlcoord 0, 1
	ld de, wDeciramBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ld a, [wceed]
	and a
	jr nz, .asm_fd58d
	ld a, $1
	ld [wUnownLetter], a
	call GetPokemonName
	hlcoord 4, 1
	call PlaceString
	xor a
	ld [wBoxAlignment], a
	hlcoord 2, 3
	call _PrepMonFrontpic
	ld de, vTiles2 tile $31
	predef GetMonBackpic
	ld a, $31
	ldh [hGraphicStartTile], a
	hlcoord 12, 4
	lb bc, 6, 6
	predef PlaceGraphic
	ld a, [wceee]
	and a
	jr z, .asm_fd579
	ld de, String_fd5c2
	jr .asm_fd57c

.asm_fd579
	ld de, String_fd5c7

.asm_fd57c
	hlcoord 7, 17
	call PlaceString
	hlcoord 0, 17
	ld de, String_fd5cc
	call PlaceString
	jr .asm_fd5bc

.asm_fd58d
	ld a, [wDeciramBuffer]
	ld [wTrainerClass], a
	callfar GetTrainerAttributes
	ld de, wStringBuffer1
	hlcoord 4, 1
	call PlaceString
	ld de, vTiles2
	callfar GetTrainerPic
	xor a
	ld [wTempEnemyMonSpecies], a
	ldh [hGraphicStartTile], a
	hlcoord 2, 3
	lb bc, 7, 7
	predef PlaceGraphic

.asm_fd5bc
	ld a, $1
	ld [wJumptableIndex], a
	ret

String_fd5c2: db "レア", DEBUGTEST_BLACK, DEBUGTEST_BLACK, "@" ; rare (shiny)
String_fd5c7: db "ノーマル@" ; normal
String_fd5cc: db DEBUGTEST_A, "きりかえ▶@" ; (A) switches

Functionfd5d3:
	decoord 0, 11, wAttrmap
	hlcoord 2, 11
	ld a, $1
	call Functionfd5f1
	decoord 0, 13, wAttrmap
	hlcoord 2, 13
	ld a, $2
	call Functionfd5f1
	decoord 0, 15, wAttrmap
	hlcoord 2, 15
	ld a, $3

Functionfd5f1:
	push af
	ld a, DEBUGTEST_TICKS_1
	ld [hli], a
	ld bc, $f
	ld a, DEBUGTEST_TICKS_2
	call ByteFill
	ld l, e
	ld h, d
	pop af
	ld bc, $28
	call ByteFill
	ret

Functionfd607:
	ld a, [wce66]
	inc a
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOverworldMapBlocks
	add hl, de
	ld de, wc508
	ld bc, 4
	call CopyBytes
	xor a
	ld [wce64], a
	ld [wce65], a
	ld de, wc508
	call Functionfd8ae
	ret

Functionfd62b:
	ldh a, [hCGB]
	and a
	jr z, .asm_fd63d
	ld a, $2
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame

.asm_fd63d
	call WaitBGMap
	ld a, $2
	ld [wJumptableIndex], a
	ret

Functionfd646:
	ldh a, [hCGB]
	and a
	jr z, .asm_fd672
	ld hl, wBGPals2
	ld de, wc508
	ld c, $1
	call Functionfd8ec
	hlcoord 10, 2
	ld de, wc508
	call Functionfd6b0
	hlcoord 15, 2
	ld de, wc508 + 2
	call Functionfd6b0
	ld a, $1
	ldh [hCGBPalUpdate], a
	ld a, $3
	ld [wJumptableIndex], a
	ret

.asm_fd672
	ld hl, wSGBPals
	ld a, 1
	ld [hli], a
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	ld a, [wc508]
	ld [hli], a
	ld a, [wc508 + 1]
	ld [hli], a
	ld a, [wc508 + 2]
	ld [hli], a
	ld a, [wc508 + 3]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, wSGBPals
	call Functionfd915
	hlcoord 10, 2
	ld de, wc508
	call Functionfd6b0
	hlcoord 15, 2
	ld de, wc508 + 2
	call Functionfd6b0
	ld a, $3
	ld [wJumptableIndex], a
	ret

Functionfd6b0:
	inc hl
	inc hl
	inc hl
	ld a, [de]
	call Functionfd6c5
	ld a, [de]
	swap a
	call Functionfd6c5
	inc de
	ld a, [de]
	call Functionfd6c5
	ld a, [de]
	swap a

Functionfd6c5:
	and $f
	add DEBUGTEST_0
	ld [hld], a
	ret

Functionfd6cb:
	ldh a, [hJoyLast]
	and B_BUTTON
	jr nz, .asm_fd6e8
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .asm_fd6ee
	ld a, [wce64]
	and $3
	ld e, a
	ld d, 0
	ld hl, Jumptable_fd70b
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.asm_fd6e8
	ld a, $4
	ld [wJumptableIndex], a
	ret

.asm_fd6ee
	ld a, [wceed]
	and a
	ret nz
	ld a, [wceee]
	xor $4
	ld [wceee], a
	ld c, a
	ld b, 0
	ld hl, PokemonPalettes
	add hl, bc
	call Functionfd31a
	ld a, $0
	ld [wJumptableIndex], a
	ret

Jumptable_fd70b:
	dw Functionfd713
	dw Functionfd73d
	dw Functionfd74f
	dw Functionfd761

Functionfd713:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Functionfd792
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_fd726
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_fd731
	ret

.asm_fd726
	xor a
	ld [wce65], a
	ld de, wc508
	call Functionfd8ae
	ret

.asm_fd731
	ld a, $1
	ld [wce65], a
	ld de, wc508 + 2
	call Functionfd8ae
	ret

Functionfd73d:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Functionfd792
	ld a, [hl]
	and D_UP
	jr nz, Functionfd78d
	ld hl, wc508 + 10
	jr Functionfd76c

Functionfd74f:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Functionfd792
	ld a, [hl]
	and D_UP
	jr nz, Functionfd78d
	ld hl, wc508 + 11
	jr Functionfd76c

Functionfd761:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Functionfd78d
	ld hl, wc508 + 12

Functionfd76c:
	ldh a, [hJoyLast]
	and D_RIGHT
	jr nz, Functionfd779
	ldh a, [hJoyLast]
	and D_LEFT
	jr nz, Functionfd780
	ret

Functionfd779:
	ld a, [hl]
	cp $1f
	ret nc
	inc [hl]
	jr Functionfd784

Functionfd780:
	ld a, [hl]
	and a
	ret z
	dec [hl]

Functionfd784:
	call Functionfd870
	ld a, $2
	ld [wJumptableIndex], a
	ret

Functionfd78d:
	ld hl, wce64
	dec [hl]
	ret

Functionfd792:
	ld hl, wce64
	inc [hl]
	ret

Functionfd797:
	hlcoord 0, 10
	ld bc, $a0
	ld a, DEBUGTEST_BLACK
	call ByteFill
	hlcoord 2, 12
	ld de, String_fd9d6
	call PlaceString
	xor a
	ld [wceef], a
	call Functionfd7fd
	ld a, $5
	ld [wJumptableIndex], a
	ret

Functionfd7b8:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_fd7b8
	call Functionfd7d0
	ret

.asm_fd7b8
	ld a, $0
	ld [wJumptableIndex], a
	ret

Functionfd7ca:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Functionfd7d0:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_fd7de
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_fd7eb
	ret

.asm_fd7de
	ld a, [wceef]
	cp $38
	jr z, .asm_fd7e8
	inc a
	jr .asm_fd7f6

.asm_fd7e8
	xor a
	jr .asm_fd7f6

.asm_fd7eb
	ld a, [wceef]
	and a
	jr z, .asm_fd7f4
	dec a
	jr .asm_fd7f6

.asm_fd7f4
	ld a, $38

.asm_fd7f6
	ld [wceef], a
	call Functionfd7fd
	ret

Functionfd7fd:
	hlcoord 10, 11
	call Functionfd867
	hlcoord 10, 12
	call Functionfd867
	hlcoord 10, 13
	call Functionfd867
	hlcoord 10, 14
	call Functionfd867
	ld a, [wceef]
	inc a
	ld [wTempTMHM], a
	predef GetTMHMMove
	ld a, [wTempTMHM]
	ld [wPutativeTMHMMove], a
	call GetMoveName
	hlcoord 10, 12
	call PlaceString
	ld a, [wceef]
	call Functionfd85e
	ld [wCurItem], a
	predef CanLearnTMHMMove
	ld a, c
	and a
	ld de, String_fd84f
	jr nz, .asm_fd848
	ld de, String_fd856

.asm_fd848
	hlcoord 10, 14
	call PlaceString
	ret

String_fd84f: db "おぼえられる@" ; can be taught
String_fd856: db "おぼえられない@" ; cannot be taught

Functionfd85e:
	cp $32
	jr c, .asm_fd864
	inc a
	inc a

.asm_fd864
	add $bf
	ret

Functionfd867:
	ld bc, 10
	ld a, DEBUGTEST_BLACK
	call ByteFill
	ret

Functionfd870:
	ld a, [wc508 + 10]
	and $1f
	ld e, a
	ld a, [wc508 + 11]
	and $7
	sla a
	swap a
	or e
	ld e, a
	ld a, [wc508 + 11]
	and $18
	sla a
	swap a
	ld d, a
	ld a, [wc508 + 12]
	and $1f
	sla a
	sla a
	or d
	ld d, a
	ld a, [wce65]
	and a
	jr z, .asm_fd8a5
	ld a, e
	ld [wc508 + 2], a
	ld a, d
	ld [wc508 + 3], a
	ret

.asm_fd8a5
	ld a, e
	ld [wc508], a
	ld a, d
	ld [wc508 + 1], a
	ret

Functionfd8ae:
	ld a, [de]
	and $1f
	ld [wc508 + 10], a
	ld a, [de]
	and $e0
	swap a
	srl a
	ld b, a
	inc de
	ld a, [de]
	and $3
	swap a
	srl a
	or b
	ld [wc508 + 11], a
	ld a, [de]
	and $7c
	srl a
	srl a
	ld [wc508 + 12], a
	ret

Functionfd8d3:
	ld a, [wce66]
	inc a
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	ld de, wOverworldMapBlocks
	add hl, de
	ld e, l
	ld d, h
	ld hl, wc508
	ld bc, 4
	call CopyBytes
	ret

Functionfd8ec:
.asm_fd8ec
	ld a, LOW(PALRGB_WHITE)
	ld [hli], a
	ld a, HIGH(PALRGB_WHITE)
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	dec c
	jr nz, .asm_fd8ec
	ret

Bank3f_FillBoxWithByte:
; For some reason, we have another copy of FillBoxWithByte here
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

Functionfd915:
	ld a, [wd8ba]
	push af
	set 7, a
	ld [wd8ba], a
	call Functionfd926
	pop af
	ld [wd8ba], a
	ret

Functionfd926:
	ld a, [hl]
	and $7
	ret z
	ld b, a
.asm_fd92b
	push bc
	xor a
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld b, $10
.asm_fd935
	ld e, $8
	ld a, [hli]
	ld d, a
.asm_fd939
	bit 0, d
	ld a, $10
	jr nz, .asm_fd941
	ld a, $20

.asm_fd941
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	rr d
	dec e
	jr nz, .asm_fd939
	dec b
	jr nz, .asm_fd935
	ld a, $20
	ldh [rJOYP], a
	ld a, $30
	ldh [rJOYP], a
	ld de, 7000
.asm_fd95a
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_fd95a
	pop bc
	dec b
	jr nz, .asm_fd92b
	ret

Functionfd967:
	ld a, DEBUGTEST_BLACK
	hlcoord 10, 0
	ld [hl], a
	hlcoord 15, 0
	ld [hl], a
	hlcoord 1, 11
	ld [hl], a
	hlcoord 1, 13
	ld [hl], a
	hlcoord 1, 15
	ld [hl], a
	ld a, [wJumptableIndex]
	cp $3
	jr nz, .asm_fd9d2
	ld a, [wce64]
	and a
	jr z, .asm_fd996
	dec a
	hlcoord 1, 11
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], $ed

.asm_fd996
	ld a, [wce65]
	and a
	jr z, .asm_fd9a1
	hlcoord 15, 0
	jr .asm_fd9a4

.asm_fd9a1
	hlcoord 10, 0

.asm_fd9a4
	ld [hl], $ed
	ld b, $70
	ld c, $5
	ld hl, wVirtualOAM
	ld de, wc508 + 10
	call .asm_fd9c0
	ld de, wc508 + 11
	call .asm_fd9c0
	ld de, wc508 + 12
	call .asm_fd9c0
	ret

.asm_fd9c0
	ld a, b
	ld [hli], a ; y
	ld a, [de]
	add a
	add a
	add 3 * TILE_WIDTH
	ld [hli], a ; x
	xor a
	ld [hli], a ; tile id
	ld a, c
	ld [hli], a ; attributes
	ld a, 2 * TILE_WIDTH
	add b
	ld b, a
	inc c
	ret

.asm_fd9d2
	call ClearSprites
	ret

String_fd9d6:
	db   "おわりますか？" ; Are you finished?
	next "はい<DOT><DOT><DOT>", DEBUGTEST_A ; YES...(A)
	next "いいえ<DOT><DOT>", DEBUGTEST_B ; NO..(B)
	db   "@"

DebugUpArrowGFX:
INCBIN "gfx/debug/up_arrow.2bpp"

DebugColorTestGFX:
INCBIN "gfx/debug/color_test.2bpp"

TilesetColorTest:
	ret
	xor a
	ld [wJumptableIndex], a
	ld [wce64], a
	ld [wce65], a
	ld [wce66], a
	ldh [hMapAnims], a
	call ClearSprites
	call OverworldTextModeSwitch
	call WaitBGMap2
	xor a
	ldh [hBGMapMode], a
	ld de, DebugColorTestGFX
	ld hl, vTiles2 tile DEBUGTEST_TICKS_1
	lb bc, BANK(DebugColorTestGFX), 22
	call Request2bpp
	ld de, DebugUpArrowGFX
	ld hl, vTiles1
	lb bc, BANK(DebugUpArrowGFX), 1
	call Request2bpp
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, DEBUGTEST_BLACK
	call ByteFill
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $7
	call ByteFill
	ld de, $15
	ld a, DEBUGTEST_WHITE
	call Functionfdbdb
	ld de, $1a
	ld a, DEBUGTEST_LIGHT
	call Functionfdbdb
	ld de, $1f
	ld a, DEBUGTEST_DARK
	call Functionfdbdb
	ld de, $24
	ld a, DEBUGTEST_BLACK
	call Functionfdbdb
	call Functionfdbfd
	call Functionfdc18
	call WaitBGMap2
	ld [wJumptableIndex], a
	ld a, $40
	ldh [hWY], a
	ret

Functionfdbdb:
	hlcoord 0, 0
	call Functionfdbe7

Functionfdbe1:
	ld a, [wce64]
	hlcoord 0, 0, wAttrmap

Functionfdbe7:
	add hl, de
rept 4
	ld [hli], a
endr
	ld bc, $10
	add hl, bc
rept 4
	ld [hli], a
endr
	ld bc, $10
	add hl, bc
rept 4
	ld [hli], a
endr
	ret

Functionfdbfd:
	hlcoord 2, 4
	call Functionfdc0c
	hlcoord 2, 6
	call Functionfdc0c
	hlcoord 2, 8

Functionfdc0c:
	ld a, DEBUGTEST_TICKS_1
	ld [hli], a
	ld bc, $10 - 1
	ld a, DEBUGTEST_TICKS_2
	call ByteFill
	ret

Functionfdc18:
	ld a, [wce64]
	ld l, a
	ld h, $0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, wBGPals1
	add hl, de
	ld de, wc508
	ld bc, 8
	call CopyBytes
	ld de, wc508
	call Functionfd8ae
	ret

Functionfdc35:
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .loop7
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_fdc8e
	call Functionfdcdb
	ret

.loop7
	ld hl, wce64
	ld a, [hl]
	inc a
	and $7
	cp $7
	jr nz, .asm_fdc52
	xor a

.asm_fdc52
	ld [hl], a
	ld de, $15
	call Functionfdbe1
	ld de, $1a
	call Functionfdbe1
	ld de, $1f
	call Functionfdbe1
	ld de, $24
	call Functionfdbe1
	ld hl, wBGPals2
	ld a, [wce64]
	ld bc, 1 palettes
	call AddNTimes
	ld de, wc508
	ld bc, 1 palettes
	call CopyBytes
	ld a, $2
	ldh [hBGMapMode], a
	ld c, 3
	call DelayFrames
	ld a, $1
	ldh [hBGMapMode], a
	ret

.asm_fdc8e
	call ClearSprites
	ldh a, [hWY]
	xor $d0
	ldh [hWY], a
	ret

Functionfdc98:
	ld hl, wBGPals2
	ld a, [wce64]
	ld bc, 1 palettes
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wc508
	ld bc, 1 palettes
	call CopyBytes
	hlcoord 1, 0
	ld de, wc508
	call Functionfd6b0
	hlcoord 6, 0
	ld de, wc508 + 2
	call Functionfd6b0
	hlcoord 11, 0
	ld de, wc508 + 4
	call Functionfd6b0
	hlcoord 16, 0
	ld de, wc508 + 6
	call Functionfd6b0
	ld a, $1
	ldh [hCGBPalUpdate], a
	call DelayFrame
	ret

Functionfdcdb:
	ld a, [wce65]
	and 3
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.dw
	dw Functionfdcf4
	dw Functionfdd24
	dw Functionfdd36
	dw Functionfdd48

Functionfdcf4:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Functionfdd77
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_fdd07
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_fdd0d
	ret

.asm_fdd07
	ld a, [wce66]
	dec a
	jr .asm_fdd11

.asm_fdd0d
	ld a, [wce66]
	inc a

.asm_fdd11
	and $3
	ld [wce66], a
	ld e, a
	ld d, $0
	ld hl, wc508
	add hl, de
	add hl, de
	ld e, l
	ld d, h
	call Functionfd8ae
	ret

Functionfdd24:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Functionfdd77
	ld a, [hl]
	and D_UP
	jr nz, Functionfdd72
	ld hl, wc508 + 10
	jr Functionfdd53

Functionfdd36:
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Functionfdd77
	ld a, [hl]
	and D_UP
	jr nz, Functionfdd72
	ld hl, wc508 + 11
	jr Functionfdd53

Functionfdd48:
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Functionfdd72
	ld hl, wc508 + 12

Functionfdd53:
	ldh a, [hJoyLast]
	and D_RIGHT
	jr nz, .asm_fdd60
	ldh a, [hJoyLast]
	and D_LEFT
	jr nz, .asm_fdd67
	ret

.asm_fdd60
	ld a, [hl]
	cp $1f
	ret nc
	inc [hl]
	jr .asm_fdd6b

.asm_fdd67
	ld a, [hl]
	and a
	ret z
	dec [hl]

.asm_fdd6b
	call Functionfdd7c
	call Functionfdc98
	ret

Functionfdd72:
	ld hl, wce65
	dec [hl]
	ret

Functionfdd77:
	ld hl, wce65
	inc [hl]
	ret

Functionfdd7c:
	ld a, [wc508 + 10]
	and $1f
	ld e, a
	ld a, [wc508 + 11]
	and $7
	sla a
	swap a
	or e
	ld e, a
	ld a, [wc508 + 11]
	and $18
	sla a
	swap a
	ld d, a
	ld a, [wc508 + 12]
	and $1f
	sla a
	sla a
	or d
	ld d, a
	ld a, [wce66]
	ld c, a
	ld b, $0
	ld hl, wc508
	add hl, bc
	add hl, bc
	ld a, e
	ld [hli], a
	ld [hl], d
	ret

Functionfddb1:
	ld a, DEBUGTEST_BLACK
	hlcoord 0, 4
	ld [hl], a
	hlcoord 0, 6
	ld [hl], a
	hlcoord 0, 8
	ld [hl], a
	hlcoord 0, 2
	ld [hl], a
	hlcoord 5, 2
	ld [hl], a
	hlcoord 10, 2
	ld [hl], a
	hlcoord 15, 2
	ld [hl], a
	ld a, [wce65]
	and a
	jr z, .asm_fdde1
	dec a
	hlcoord 0, 4
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], $ed

.asm_fdde1
	ld a, [wce66]
	hlcoord 0, 2
	ld bc, $5
	call AddNTimes
	ld [hl], $ed
	ld b, $78
	ld hl, wVirtualOAM
	ld de, wc508 + 10
	call .asm_fde07
	ld de, wc508 + 11
	call .asm_fde07
	ld de, wc508 + 12
	call .asm_fde07
	ret

.asm_fde07
	ld a, b
	ld [hli], a
	ld a, [de]
	add a
	add a
	add 3 * TILE_WIDTH
	ld [hli], a
	ld a, 16 * TILE_WIDTH
	ld [hli], a
	ld a, $5
	ld [hli], a
	ld a, 2 * TILE_WIDTH
	add b
	ld b, a
	inc c
	ret

; unused
	call ClearSprites
	ret

; unused
	ret
