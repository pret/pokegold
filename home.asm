INCLUDE "includes.asm"

; rst vectors
INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

SECTION "start", ROM0
Start::
	nop
	jp _Start

SECTION "bank0", ROM0
INCLUDE "home/vblank.asm"
INCLUDE "home/delay.asm"
INCLUDE "home/rtc.asm"
INCLUDE "home/fade.asm"
INCLUDE "home/lcd.asm"
INCLUDE "home/time.asm"
INCLUDE "home/init.asm"
INCLUDE "home/serial.asm"
INCLUDE "home/joypad.asm"
INCLUDE "home/decompress.asm"
INCLUDE "home/palettes.asm"
INCLUDE "home/copy.asm"
INCLUDE "home/text.asm"
INCLUDE "home/video.asm"
INCLUDE "home/map_objects.asm"
INCLUDE "home/sine.asm"
INCLUDE "home/movement.asm"
INCLUDE "home/tilemap.asm"
INCLUDE "home/menu.asm"
INCLUDE "home/handshake.asm"
INCLUDE "home/game_time.asm"
INCLUDE "home/map.asm"

InexplicablyEmptyFunction:: ; 2e16
; Inexplicably empty.
; Seen in PredefPointers.
	rept 16
	nop
	endr
	ret

INCLUDE "home/farcall.asm"
INCLUDE "home/predef.asm"
INCLUDE "home/window.asm"
INCLUDE "home/flag.asm"

Function2f7b::
	ld a, [wMonStatusFlags]
	bit 1, a
	ret z
	ld a, [hJoyDown]
	bit 1, a
	ret

xor_a::
	xor a
	ret

xor_a_dec_a::
	xor a
	dec a
	ret

Function2f8b::
	push hl
	ld hl, wMonStatusFlags
	bit 1, [hl]
	pop hl
	ret

DisableSpriteUpdates:: ; 2f93 (0:2f93)
	xor a
	ld [hMapAnims], a
	ld a, [wVramState]
	res 0, a
	ld [wVramState], a
	ld a, $0
	ld [wRTCEnabled], a
	ret

EnableSpriteUpdates:: ; 2fa4 (0:2fa4)
	ld a, $1
	ld [wRTCEnabled], a
	ld a, [wVramState]
	set 0, a
	ld [wVramState], a
	ld a, $1
	ld [hMapAnims], a
	ret

INCLUDE "home/string.asm"

IsInJohto::
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation
	cp $5e
	jr z, .asm_2ff9
	cp $0
	jr nz, .asm_2ff5
	ld a, [wd9f6]
	ld b, a
	ld a, [wd9f7]
	ld c, a
	call GetWorldMapLocation
.asm_2ff5
	cp $2e
	jr nc, .asm_2ffb
.asm_2ff9
	xor a
	ret

.asm_2ffb
	ld a, $1
	ret

Function2ffe:: ; 2ffe (0:2ffe)
	push hl
	xor a
	ld hl, wd17c
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld a, [wd17a]
	ld l, a
	ld a, [wd17b]
	ld h, a
	or l
	jr z, .quit
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	ld a, [wPlayerStandingMapX]
	add $4
	ld d, a
	ld a, [wPlayerStandingMapY]
	ld a, $4 ; add $4
	ld e, a
	push bc
	ld c, $0
.loop
	ld a, [hl]
	cp $ff
	jr z, .done
	push hl
	ld a, d
	cp [hl]
	jr nz, .next
	inc hl
	ld a, e
	cp [hl]
	jr nz, .next
	ld hl, wd17c
	ld b, SET_FLAG
	push de
	push bc
	ld d, $0
	predef FlagPredef
	pop bc
	pop de
.next
	pop hl
	inc hl
	inc hl
	inc hl
	inc c
	ld a, c
	cp $20
	jr c, .loop
.done
	pop bc
	pop af
	rst Bankswitch
.quit
	pop hl
	ret

INCLUDE "home/item.asm"
INCLUDE "home/random.asm"
INCLUDE "home/sram.asm"

jp_hl::
	jp hl

jp_de::
	push de
	ret

ClearSprites:: ; 30ff (0:30ff)
	ld hl, wOAMBuffer
	ld b, $a0
	xor a
.asm_3105
	ld [hli], a
	dec b
	jr nz, .asm_3105
	ret

HideSprites::
	ld hl, wOAMBuffer
	ld de, $4
	ld b, $28
	ld a, $a0
.asm_3114
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_3114
	ret

INCLUDE "home/copy2.asm"

BackUpTilesToBuffer::
	hlcoord 0, 0
	decoord 0, 0, wTileMapBackup
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	jp CopyBytes

ReloadTilesFromBuffer::
	xor a
	ld [hBGMapMode], a
	call ReloadTilesFromBuffer_
	ld a, $1
	ld [hBGMapMode], a
	ret

ReloadTilesFromBuffer_::
	hlcoord 0, 0, wTileMapBackup
	decoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	jp CopyBytes

Function317b:: ; 317b (0:317b)
	ld hl, wStringBuffer2
CopyName2::
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, CopyName2
	ret

IsInArray::
	ld b, $0
	ld c, a
.asm_3189
	ld a, [hl]
	cp $ff
	jr z, .asm_3195
	cp c
	jr z, .asm_3197
	inc b
	add hl, de
	jr .asm_3189
.asm_3195
	and a
	ret
.asm_3197
	scf
	ret

INCLUDE "home/math.asm"

Function31e2:: ; 31e2 (0:31e2)
	ld a, [wOptions]
	bit 4, a
	ret nz
	ld a, [wTextBoxFlags]
	bit 1, a
	ret z
	push hl
	push de
	push bc
	ld hl, hOAMUpdate
	ld a, [hl]
	push af
	ld [hl], a
	ld a, [wTextBoxFlags]
	bit 0, a
	jr z, .asm_3205
	ld a, [wOptions]
	and $7
	jr .asm_3207

.asm_3205
	ld a, $1
.asm_3207
	ld [wTextDelayFrames], a
.asm_320a
	call GetJoypad
	ld a, [wc1d6]
	and a
	jr nz, .asm_3224
	ld a, [hJoyDown]
	bit 0, a
	jr z, .asm_321b
	jr .asm_321f

.asm_321b
	bit 1, a
	jr z, .asm_3224
.asm_321f
	call DelayFrame
	jr .asm_322a

.asm_3224
	ld a, [wTextDelayFrames]
	and a
	jr nz, .asm_320a
.asm_322a
	pop af
	ld [hOAMUpdate], a
	pop bc
	pop de
	pop hl
	ret

Function3231::
.asm_3231
	ld a, [hli]
	ld [de], a
	inc de
	ld a, h
	cp b
	jr nz, .asm_3231
	ld a, l
	cp c
	jr nz, .asm_3231
	ret

PrintNum:: ; 323d (0:323d)
	push bc
	bit 5, b
	jr z, .asm_324f
	bit 7, b
	jr nz, .asm_324a
	bit 6, b
	jr z, .asm_324f
.asm_324a
	ld a, $f0
	ld [hli], a
	res 5, b
.asm_324f
	xor a
	ld [hPrintNum1], a
	ld [hMultiplicand], a
	ld [hStringCmpString2], a
	ld a, b
	and $f
	cp $1
	jr z, .asm_3277
	cp $2
	jr z, .asm_326e
	ld a, [de]
	ld [hQuotient], a
	inc de
	ld a, [de]
	ld [hPrintNum3], a
	inc de
	ld a, [de]
	ld [hPrintNum4], a
	jr .asm_327a

.asm_326e
	ld a, [de]
	ld [hStringCmpString2], a
	inc de
	ld a, [de]
	ld [hPrintNum4], a
	jr .asm_327a

.asm_3277
	ld a, [de]
	ld [hPrintNum4], a
.asm_327a
	push de
	ld d, b
	ld a, c
	swap a
	and $f
	ld e, a
	ld a, c
	and $f
	ld b, a
	ld c, $0
	cp $2
	jr z, .asm_32f2
	cp $3
	jr z, .asm_32e2
	cp $4
	jr z, .asm_32d1
	cp $5
	jr z, .asm_32c0
	cp $6
	jr z, .asm_32ae
	ld a, $f
	ld [hMultiplier], a
	ld a, $42
	ld [hPrintNum6], a
	ld a, $40
	ld [hPrintNum7], a
	call Function3341
	call Function33c0
.asm_32ae
	ld a, $1
	ld [hPrintNum5], a
	ld a, $86
	ld [hPrintNum6], a
	ld a, $a0
	ld [hPrintNum7], a
	call Function3341
	call Function33c0
.asm_32c0
	xor a
	ld [hRemainder], a
	ld a, $27
	ld [hMathBuffer], a
	ld a, $10
	ld [hPrintNum7], a
	call Function3341
	call Function33c0
.asm_32d1
	xor a
	ld [hMultiplier], a
	ld a, $3
	ld [hPrintNum6], a
	ld a, $e8
	ld [hPrintNum7], a
	call Function3341
	call Function33c0
.asm_32e2
	xor a
	ld [hMultiplier], a
	xor a
	ld [hMathBuffer], a
	ld a, $64
	ld [hPrintNum7], a
	call Function3341
	call Function33c0
.asm_32f2
	dec e
	jr nz, .asm_32f9
	ld a, $f6
	ld [hPastLeadingZeroes], a
.asm_32f9
	ld c, $0
	ld a, [hPrintNum4]
.asm_32fd
	cp $a
	jr c, .asm_3306
	sub $a
	inc c
	jr .asm_32fd

.asm_3306
	ld b, a
	ld a, [hPrintNum1]
	or c
	jr nz, .asm_3311
	call Function33ba
	jr .asm_3323

.asm_3311
	call Function3330
	push af
	ld a, $f6
	add c
	ld [hl], a
	pop af
	ld [hDividend], a
	inc e
	dec e
	jr nz, .asm_3323
	inc hl
	ld [hl], $e8
.asm_3323
	call Function33c0
	call Function3330
	ld a, $f6
	add b
	ld [hli], a
	pop de
	pop bc
	ret

Function3330:: ; 3330 (0:3330)
	push af
	ld a, [hPastLeadingZeroes]
	and a
	jr nz, .asm_333f
	bit 5, d
	jr z, .asm_333f
	ld a, $f0
	ld [hli], a
	res 5, d
.asm_333f
	pop af
	ret

Function3341:: ; 3341 (0:3341)
	dec e
	jr nz, .asm_3348
	ld a, $f6
	ld [hProduct], a
.asm_3348
	ld c, $0
.asm_334a
	ld a, [hPrintNum5]
	ld b, a
	ld a, [hMultiplicand]
	ld [hPrintNum8], a
	cp b
	jr c, .asm_339a
	sub b
	ld [hPrintNum2], a
	ld a, [hPrintNum6]
	ld b, a
	ld a, [hPrintNum3]
	ld [hPrintNum9], a
	cp b
	jr nc, .asm_336c
	ld a, [hPrintNum2]
	or $0
	jr z, .asm_3396
	dec a
	ld [hPrintNum2], a
	ld a, [hStringCmpString2]
.asm_336c
	sub b
	ld [hPrintNum3], a
	ld a, [hPrintNum7]
	ld b, a
	ld a, [hPrintNum4]
	ld [hPrintNum10], a
	cp b
	jr nc, .asm_338c
	ld a, [hStringCmpString2]
	and a
	jr nz, .asm_3387
	ld a, [hQuotient]
	and a
	jr z, .asm_3392
	dec a
	ld [hMultiplicand], a
	xor a
.asm_3387
	dec a
	ld [hPrintNum3], a
	ld a, [hPrintNum4]
.asm_338c
	sub b
	ld [hPrintNum4], a
	inc c
	jr .asm_334a

.asm_3392
	ld a, [hPrintNum9]
	ld [hStringCmpString2], a
.asm_3396
	ld a, [hPrintNum8]
	ld [hPrintNum2], a
.asm_339a
	ld a, [hDividend]
	or c
	jr z, Function33ba
	ld a, [hPrintNum1]
	and a
	jr nz, .asm_33ad
	bit 5, d
	jr z, .asm_33ad
	ld a, $f0
	ld [hli], a
	res 5, d
.asm_33ad
	ld a, $f6
	add c
	ld [hl], a
	ld [hPrintNum1], a
	inc e
	dec e
	ret nz
	inc hl
	ld [hl], $e8
	ret

Function33ba:: ; 33ba (0:33ba)
	bit 7, d
	ret z
	ld [hl], $f6
	ret

Function33c0:: ; 33c0 (0:33c0)
	bit 7, d
	jr nz, .asm_33cc
	bit 6, d
	jr z, .asm_33cc
	ld a, [hProduct]
	and a
	ret z
.asm_33cc
	inc hl
	ret

Function33ce::
; Print c-digit hex number from de to hl
.asm_33ce
	push bc
	call Function33d7
	pop bc
	dec c
	jr nz, .asm_33ce
	ret

Function33d7:: ; 33d7 (0:33d7)
	ld a, [de]
	swap a
	and $f
	call Function33e9
	ld [hli], a
	ld a, [de]
	and $f
	call Function33e9
	ld [hli], a
	inc de
	ret

Function33e9:: ; 33e9 (0:33e9)
	ld bc, .digits
	add c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, [bc]
	ret

.digits db "0123456789ABCDEF"

FarPrintText::
	ld [wBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [wBuffer]
	rst Bankswitch
	call PrintText
	pop af
	rst Bankswitch
	ret

Function3414::
	ld a, [hROMBank]
	push af
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call jp_hl
	pop hl
	ld a, h
	rst Bankswitch
	ret

QueueScript::
	ld a, [hROMBank]
Function3425::
	ld [wcfd8], a
	ld a, l
	ld [wcfd9], a
	ld a, h
	ld [wcfda], a
	ret

Function3431::
.asm_3431
	ld a, [de]
	cp [hl]
	ret nz
	inc de
	inc hl
	dec c
	jr nz, .asm_3431
	ret

Function343a::
.asm_343a
	ld a, [de]
	cp [hl]
	jr nz, .asm_3447
	inc de
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .asm_343a
	scf
	ret

.asm_3447
	and a
	ret

ClearBGPalettes::
	call ClearPalettes
WaitBGMap:: ; 344c (0:344c)
	ld a, $1
	ld [hBGMapMode], a
	ld c, $4
	call DelayFrames
	ret

Function3456:: ; 3456 (0:3456)
	ld a, [hCGB]
	and a
	jr z, .asm_3464
	ld a, $2
	ld [hBGMapMode], a
	ld c, $4
	call DelayFrames
.asm_3464
	ld a, $1
	ld [hBGMapMode], a
	ld c, $4
	call DelayFrames
	ret

CheckCGB::
	ld a, [hCGB]
	and a
	ret

ApplyTilemap:: ; 3472 (0:3472)
	ld a, [hCGB]
	and a
	jr z, .asm_3484
	ld a, [wRTCEnabled]
	cp $0
	jr z, .asm_3484
	ld a, $1
	ld [hBGMapMode], a
	jr LoadEDTile

.asm_3484
	ld a, $1
	ld [hBGMapMode], a
	ld c, $4
	call DelayFrames
	ret

CGBOnly_LoadEDTile:: ; 348e (0:348e)
	ld a, [hCGB]
	and a
	jr z, WaitBGMap
LoadEDTile::
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
.asm_349f
	ld a, [rLY]
	cp $7f
	jr c, .asm_349f
	di
	ld a, $1
	ld [rVBK], a
	ld hl, wAttrMap
	call Function34c8
	ld a, $0
	ld [rVBK], a
	ld hl, wTileMap
	call Function34c8
.asm_34ba
	ld a, [rLY]
	cp $7f
	jr c, .asm_34ba
	ei
	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret

Function34c8:: ; 34c8 (0:34c8)
	ld [hSPBuffer], sp
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, $0
	ld a, $12
	ld [hTilesPerCycle], a
	ld b, $2
	ld c, rSTAT % $100
.asm_34d9
rept 10
	pop de
.loop_\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop_\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr
	ld de, $c
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .asm_34d9
	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

SetPalettes::
	ld a, [hCGB]
	and a
	jr nz, .asm_3556
	ld a, $e4
	ld [rBGP], a
	ld a, $d0
	ld [rOBP0], a
	ld [rOBP1], a
	ret

.asm_3556
	push de
	ld a, $e4
	call DmgToCgbBGPals
	ld de, $e4e4
	call DmgToCgbObjPals
	pop de
	ret

ClearPalettes:: ; 3564 (0:3564)
	ld a, [hCGB]
	and a
	jr nz, .asm_3571
	xor a
	ld [rBGP], a
	ld [rOBP0], a
	ld [rOBP1], a
	ret

.asm_3571
	ld hl, wBGPals
	ld bc, $80
	ld a, $ff
	call ByteFill
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

GetMemSGBLayout::
	ld b, $ff
GetSGBLayout:: ; 3583 (0:3583)
	ld a, [hCGB]
	and a
	jr nz, .asm_358c
	ld a, [hSGB]
	and a
	ret z
.asm_358c
	predef_jump Predef_LoadSGBLayout

SetHPPal::
	call GetHPPal
	ld [hl], d
	ret

GetHPPal:: ; 3596 (0:3596)
	ld d, $0
	ld a, e
	cp $18
	ret nc
	inc d
	cp $a
	ret nc
	inc d
	ret

CountSetBits::
	ld c, $0
.asm_35a4
	ld a, [hli]
	ld e, a
	ld d, $8
.asm_35a8
	srl e
	ld a, $0
	adc c
	ld c, a
	dec d
	jr nz, .asm_35a8
	dec b
	jr nz, .asm_35a4
	ld a, c
	ld [wd151], a
	ret

GetWeekday::
	ld a, [wCurDay]
.mod
	sub 7
	jr nc, .mod
	add 7
	ret

INCLUDE "home/pokedex_flags.asm"

NamesPointers:: ; 35ee (0:35ee)
	dba PokemonNames
	dba MoveNames
	dbw 0, 0
	dba ItemNames
	dbw 0, wPartyMonOT
	dbw 0, $de7d
	dba TrainerClassNames
	dba DoPlayerMovement

GetName:: ; 3606
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de
	ld a, [wce61]
	cp $1
	jr nz, .asm_3624
	ld a, [wCurSpecies]
	ld [wd151], a
	call GetPokemonName
	ld hl, $b
	add hl, de
	ld e, l
	ld d, h
	jr .asm_3646
.asm_3624
	ld a, [wce61]
	dec a
	ld e, a
	ld d, $0
	ld hl, NamesPointers
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurSpecies]
	dec a
	call GetNthString
	ld de, wStringBuffer1
	ld bc, $d
	call CopyBytes
.asm_3646
	ld a, e
	ld [wcffe], a
	ld a, d
	ld [wcfff], a
	pop de
	pop bc
	pop hl
	pop af
	rst Bankswitch
	ret

GetNthString:: ; 3654 (0:3654)
	and a
	ret z
	push bc
	ld b, a
	ld c, "@"
.asm_365a
	ld a, [hli]
	cp c
	jr nz, .asm_365a
	dec b
	jr nz, .asm_365a
	pop bc
	ret

GetBasePokemonName::
	push hl
	call GetPokemonName
	ld hl, wStringBuffer1
.loop
	ld a, [hl]
	cp "@"
	jr z, .quit
	cp "♂"
	jr z, .end
	cp "♀"
	jr z, .end
	inc hl
	jr .loop
.end
	ld [hl], "@"
.quit
	pop hl
	ret

GetPokemonName:: ; 367e (0:367e)
	ld a, [hROMBank]
	push af
	push hl
	ld a, BANK(PokemonNames)
	rst Bankswitch
	ld a, [wd151]
	dec a
	ld hl, PokemonNames
	ld e, a
	ld d, $0
rept PKMN_NAME_LENGTH +- 1
	add hl, de
endr
	ld de, wStringBuffer1
	push de
	ld bc, PKMN_NAME_LENGTH - 1
	call CopyBytes
	ld hl, wStringBuffer1 + PKMN_NAME_LENGTH - 1
	ld [hl], "@"
	pop de
	pop hl
	pop af
	rst Bankswitch
	ret

GetItemName::
	push hl
	push bc
	ld a, [wd151]
	cp TM01
	jr nc, .TM
	ld [wCurSpecies], a
	ld a, $4
	ld [wce61], a
	call GetName
	jr .copied

.TM
	call GetTMHMName
.copied
	ld de, wStringBuffer1
	pop bc
	pop hl
	ret

GetTMHMName:: ; 36cc (0:36cc)
	push hl
	push de
	push bc
	ld a, [wd151]
	push af
	cp HM01
	push af
	jr c, .TM
	ld hl, .HMText ; $3721
	ld bc, $2
	jr .copy

.TM
	ld hl, .TMText ; $371e
	ld bc, $2
.copy
	ld de, wStringBuffer1
	call CopyBytes
	push de
	ld a, [wd151]
	ld c, a
	callab GetTMHMNumber
	pop de
	pop af
	ld a, c
	jr c, .not_hm
	sub NUM_TMS
.not_hm
	ld b, "0"
.mod10
	sub 10
	jr c, .done_mod
	inc b
	jr .mod10

.done_mod
	add 10
	push af
	ld a, b
	ld [de], a
	inc de
	pop af
	ld b, "0"
	add b
	ld [de], a
	inc de
	ld a, "@"
	ld [de], a
	pop af
	ld [wd151], a
	pop bc
	pop de
	pop hl
	ret

.TMText db "TM@"
.HMText db "HM@"

IsHM::
	cp HM01
	jr c, .not_HM
	scf
	ret

.not_HM
	and a
	ret

IsHMMove::
	ld hl, .HMMoves
	ld de, $1
	jp IsInArray

.HMMoves
	db CUT, FLY, SURF, STRENGTH, FLASH, WATERFALL, WHIRLPOOL, $FF

GetMoveName::
	push hl
	ld a, $2
	ld [wce61], a
	ld a, [wd151]
	ld [wCurSpecies], a
	call GetName
	ld de, wStringBuffer1
	pop hl
	ret

ScrollingMenu::
	call CopyMenuData2
	ld a, [hROMBank]
	push af
	ld a, BANK(ScrollingMenu_)
	rst Bankswitch
	call InitScrollingMenu
	call ScrollingMenuUpdatePalettes
	call ScrollingMenu_
	pop af
	rst Bankswitch
	ld a, [wMenuJoypad]
	ret

ScrollingMenuUpdatePalettes:: ; 3769 (0:3769)
	ld hl, wVramState
	bit 0, [hl]
	jp nz, UpdateTimePals
	jp SetPalettes

DrawScrollingMenu::
	ld a, [wMenuBorderTopCoord]
	dec a
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	sub b
	ld d, a
	ld a, [wMenuBorderLeftCoord]
	dec a
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	ld e, a
	push de
	call Coord2Tile
	pop bc
	jp TextBox

ScrollingMenuJoyTextDelay::
	call DelayFrame
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call JoyTextDelay
	pop af
	ld [hInMenu], a
	ld a, [hJoyLast]
	and $f0
	ld c, a
	ld a, [hJoyPressed]
	and $f
	or c
	ld c, a
	ret

HandleStoneQueue::
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call StoneQueueWarpAction
	pop bc
	ld a, b
	rst Bankswitch
	ret

StoneQueueWarpAction:: ; 37b9 (0:37b9)
	ld hl, $1
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .asm_37dc
	ld l, a
	push hl
	call IsAnyMapObjectOnAWarp
	pop hl
	jr nc, .asm_37dc
	ld d, a
	ld e, l
	call IsThisObjectInTheStoneTable
	jr nc, .asm_37dc
	call CallMapScript
	callba EnableScriptMode
	scf
	ret

.asm_37dc
	and a
	ret

IsAnyMapObjectOnAWarp:: ; 37de (0:37de)
	push de
	ld hl, $10
	add hl, de
	ld a, [hl]
	ld hl, $11
	add hl, de
	ld e, [hl]
	sub $4
	ld d, a
	ld a, e
	sub $4
	ld e, a
	call IsThisMapObjectOnAWarp
	pop de
	ret

IsThisMapObjectOnAWarp:: ; 37f5 (0:37f5)
	ld hl, wCurrMapWarpHeaderPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurrMapWarpCount]
	and a
	jr z, .no_warps
.find_warp_loop
	push af
	ld a, [hl]
	cp e
	jr nz, .next
	inc hl
	ld a, [hld]
	cp d
	jr nz, .next
	jr .yes

.next
	ld a, $5
	add l
	ld l, a
	jr nc, .asm_3814
	inc h
.asm_3814
	pop af
	dec a
	jr nz, .find_warp_loop
.no_warps
	and a
	ret

.yes
	pop af
	ld d, a
	ld a, [wCurrMapWarpCount]
	sub d
	inc a
	scf
	ret

IsThisObjectInTheStoneTable:: ; 3823 (0:3823)
	ld hl, $1
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_382a
	ld a, [hli]
	cp $ff
	jr z, .asm_3840
	cp d
	jr nz, .asm_383b
	ld a, [hli]
	cp e
	jr nz, .asm_383c
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jr .asm_3842

.asm_383b
	inc hl
.asm_383c
	inc hl
	inc hl
	jr .asm_382a

.asm_3840
	and a
	ret

.asm_3842
	scf
	ret

CheckTrainerBattle2::
	ld a, [hROMBank]
	push af
	call SwitchToMapScriptHeaderBank
	call CheckTrainerBattle
	pop bc
	ld a, b
	rst Bankswitch
	ret

CheckTrainerBattle:: ; 3851 (0:3851)
	ld a, $2
	ld de, wMap2Object
.asm_3856
	push af
	push de
	ld hl, $1
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_389b
	ld hl, $8
	add hl, de
	ld a, [hl]
	and $f
	cp $2
	jr nz, .asm_389b
	ld hl, MBC3SRamEnable
	add hl, de
	ld a, [hl]
	cp $ff
	jr z, .asm_389b
	call GetObjectStruct
	call FacingPlayerDistance_bc
	jr nc, .asm_389b
	ld hl, $9
	add hl, de
	ld a, [hl]
	cp b
	jr c, .asm_389b
	push bc
	push de
	ld hl, $a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld b, $2
	call EventFlagAction
	ld a, c
	pop de
	pop bc
	and a
	jr z, .asm_38aa
.asm_389b
	pop de
	ld hl, $10
	add hl, de
	ld d, h
	ld e, l
	pop af
	inc a
	cp $10
	jr nz, .asm_3856
	xor a
	ret

.asm_38aa
	pop de
	pop af
	ld [hLastTalked], a
	ld a, b
	ld [wcf2a], a
	ld a, c
	ld [wcf2b], a
	jr continue_trainer_function

TalkToTrainer::
	ld a, $1
	ld [wcf2a], a
	ld a, $ff
	ld [wcf2b], a
continue_trainer_function
	call GetMapScriptHeaderBank
	ld [wcf29], a
	ld a, [hLastTalked]
	call GetMapObject
	ld hl, $a
	add hl, bc
	ld a, [wcf29]
	call GetFarHalfword
	ld de, wcf2c
	ld bc, $d
	ld a, [wcf29]
	call FarCopyBytes
	xor a
	ld [wcf38], a
	scf
	ret

FacingPlayerDistance_bc:: ; 38e9 (0:38e9)
	push de
	call FacingPlayerDistance
	ld b, d
	ld c, e
	pop de
	ret

FacingPlayerDistance:: ; 38f1 (0:38f1)
	ld hl, $10
	add hl, bc
	ld d, [hl]
	ld hl, $11
	add hl, bc
	ld e, [hl]
	ld a, [wPlayerStandingMapX]
	cp d
	jr z, .asm_3909
	ld a, [wPlayerStandingMapY]
	cp e
	jr z, .asm_391d
	and a
	ret

.asm_3909
	ld a, [wPlayerStandingMapY]
	sub e
	jr z, .asm_3937
	jr nc, .asm_3918
	cpl
	inc a
	ld d, a
	ld e, $4
	jr .asm_392f

.asm_3918
	ld d, a
	ld e, $0
	jr .asm_392f

.asm_391d
	ld a, [wPlayerStandingMapX]
	sub d
	jr z, .asm_3937
	jr nc, .asm_392c
	cpl
	inc a
	ld d, a
	ld e, $8
	jr .asm_392f

.asm_392c
	ld d, a
	ld e, $c
.asm_392f
	call GetSpriteDirection
	cp e
	jr nz, .asm_3937
	scf
	ret

.asm_3937
	and a
	ret

CheckTrainerFlag::
	push bc
	ld hl, $1
	add hl, bc
	ld a, [hl]
	call GetMapObject
	ld hl, $a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call GetFarHalfword
	ld d, h
	ld e, l
	push de
	ld b, $2
	call EventFlagAction
	pop de
	ld a, c
	and a
	pop bc
	ret

PrintWinLossText::
	ld a, [wBattleType]
	cp $1
	jr which_battle_end_text

PrintWinText::
	ld hl, wWinTextPointer
	jr continue_battle_end_text

which_battle_end_text
	ld a, [wBattleResult]
	ld hl, wWinTextPointer
	and a
	jr z, continue_battle_end_text
	ld hl, wLossTextPointer
continue_battle_end_text
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call GetMapScriptHeaderBank
	call FarPrintText
	call WaitBGMap
	call WaitPressAorB_BlinkCursor
	ret

DrawBattleHPBar::
	push hl
	push de
	push bc
	ld a, $60
	ld [hli], a
	ld a, $61
	ld [hli], a
	push hl
	ld a, $62
.asm_3990
	ld [hli], a
	dec d
	jr nz, .asm_3990
	ld a, $6b
	add b
	ld [hl], a
	pop hl
	ld a, e
	and a
	jr nz, .asm_39a3
	ld a, c
	and a
	jr z, .asm_39b6
	ld e, $1
.asm_39a3
	ld a, e
	sub $8
	jr c, .asm_39b2
	ld e, a
	ld a, $6a
	ld [hli], a
	ld a, e
	and a
	jr z, .asm_39b6
	jr .asm_39a3

.asm_39b2
	ld a, $62
	add e
	ld [hl], a
.asm_39b6
	pop bc
	pop de
	pop hl
	ret

PrepMonFrontpic::
	ld a, $1
	ld [wcf3b], a
PrepMonFrontpic_::
	ld a, [wd004]
	and a
	jr z, .not_pokemon
	cp EGG
	jr z, .egg
	cp NUM_POKEMON + 1
	jr nc, .not_pokemon
.egg
	push hl
	ld de, $9000
	predef GetFrontpic
	pop hl
	xor a
	ld [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	xor a
	ld [wcf3b], a
	ret

.not_pokemon
	xor a
	ld [wcf3b], a
	inc a
	ld [wd004], a
	ret

INCLUDE "home/cry.asm"

PrintLevel:: ; 3a50
	ld a, [wTempMonLevel]
	ld [hl], $6e
	inc hl
	ld c, $2
	cp MAX_LEVEL
	jr c, Print8BitNumRightAlign
	dec hl
	inc c
	jr Print8BitNumRightAlign

PrintLevel_Force3Digits::
	ld [hl], $6e
	inc hl
	ld c, $3
Print8BitNumRightAlign::
	ld [wd151], a
	ld de, wd151
	ld b, PRINTNUM_RIGHTALIGN | 1
	jp PrintNum

Function3a70::
	ld hl, wd149
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ret

GetBaseData::
	push bc
	push de
	push hl
	ld a, [hROMBank]
	push af
	ld a, BANK(BaseData) ; $14
	rst Bankswitch
	ld a, [wCurSpecies]
	cp EGG
	jr z, .egg
	dec a
	ld bc, $20
	ld hl, BaseData ; $5b0b
	call AddNTimes
	ld de, wd120
	ld bc, $20
	call CopyBytes
	jr .asm_3ab3

.egg
	ld de, UnknownEggPic ; $7a83
	ln b, 5, 5
	ld hl, wd131
	ld [hl], b
	ld hl, wd132
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], d
	jr .asm_3ab3

.asm_3ab3
	ld a, [wCurSpecies]
	ld [wd120], a
	pop af
	rst Bankswitch
	pop hl
	pop de
	pop bc
	ret

GetCurNick::
	ld a, [wd005]
	ld hl, wPartyMon1Nickname
GetNick::
	push hl
	push bc
	call SkipNames
	ld de, wStringBuffer1
	push de
	ld bc, $b
	call CopyBytes
	pop de
	callab CheckNickErrors
	pop bc
	pop hl
	ret

PrintBCDNumber:: ; 3ade (0:3ade)
	ld b, c
	res 7, c
	res 6, c
	res 5, c
	bit 5, b
	jr z, .asm_3af0
	bit 7, b
	jr nz, .asm_3af0
	ld [hl], $f0
	inc hl
.asm_3af0
	ld a, [de]
	swap a
	call Function3b15
	ld a, [de]
	call Function3b15
	inc de
	dec c
	jr nz, .asm_3af0
	bit 7, b
	jr z, .asm_3b14
	bit 6, b
	jr nz, .asm_3b07
	dec hl
.asm_3b07
	bit 5, b
	jr z, .asm_3b0e
	ld [hl], $f0
	inc hl
.asm_3b0e
	ld [hl], $f6
	call Function31e2
	inc hl
.asm_3b14
	ret

Function3b15:: ; 3b15 (0:3b15)
	and $f
	and a
	jr z, .asm_3b2f
	bit 7, b
	jr z, .asm_3b29
	bit 5, b
	jr z, .asm_3b27
	ld [hl], $f0
	inc hl
	res 5, b
.asm_3b27
	res 7, b
.asm_3b29
	add $f6
	ld [hli], a
	jp Function31e2

.asm_3b2f
	bit 7, b
	jr z, .asm_3b29
	bit 6, b
	ret nz
	ld a, $7f
	ld [hli], a
	ret

GetPartyParamLocation::
	push bc
	ld hl, wPartyMons
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wd005]
	call GetPartyLocation
	pop bc
	ret

GetPartyLocation:: ; 3b4a (0:3b4a)
	ld bc, $30
	jp AddNTimes

Function3b51::
	push hl
	ld a, b
	dec a
	ld b, $0
	add hl, bc
	ld hl, BaseData + 0
	ld bc, $20
	call AddNTimes
	pop bc
	ld a, BANK(BaseData)
	call GetFarHalfword
	ld b, l
	ld c, h
	pop hl
	ret

INCLUDE "home/battle.asm"

PushLYOverrides:: ; 3d0d
	ld a, [hLCDCPointer]
	and a
	ret z
	ld a, wLYOverridesBuffer % $100
	ld [wRequested2bppSource], a
	ld a, wLYOverridesBuffer / $100
	ld [wRequested2bppSource + 1], a
	ld a, wLYOverrides % $100
	ld [wRequested2bppDest], a
	ld a, wLYOverrides / $100
	ld [wRequested2bppDest + 1], a
	ld a, $9
	ld [wRequested2bpp], a
	ret

InitAnimatedObjectStruct::
	ld [wAnimatedObjectStructIDBuffer], a
	ld a, [hROMBank]
	push af
	ld a, BANK(InitAnimatedObjectStruct_) ; $23
	rst Bankswitch
	ld a, [wAnimatedObjectStructIDBuffer]
	call InitAnimatedObjectStruct_ ; $51f7
	pop af
	rst Bankswitch
	ret

ReinitAnimatedObjectFrame::
	ld [wAnimatedObjectStructIDBuffer], a
	ld a, [hROMBank]
	push af
	ld a, BANK(ReinitAnimatedObjectFrame_) ; $23
	rst Bankswitch
	ld a, [wAnimatedObjectStructIDBuffer]
	call ReinitAnimatedObjectFrame_ ; $5332
	pop af
	rst Bankswitch
	ret

INCLUDE "home/audio.asm"
