INCLUDE "includes.asm"

; rst vectors
INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

SECTION "start", HOME[$100]
Start::
	nop
	jp _Start

SECTION "bank0", HOME[$150]
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
	jp [hl]

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
.asm_317e
	ld a, [de]
	inc de
	ld [hli], a
	cp $50
	jr nz, .asm_317e
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
	ld a, [wd199]
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
	ld a, [wd199]
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

Function3404::
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

Function3423::
	ld a, [hROMBank]
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

Function3449::
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
	dba Function10000

GetName:: ; 3606
	ld a, [hROMBank]
	push af
	push hl
	push bc
	push de
	ld a, [wce61]
	cp $1
	jr nz, .asm_3624
	ld a, [wce60]
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
	ld a, [wce60]
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

GetPokemonName::
	dr $367e, $39f9

PlayCry::
	dr $39f9, $3ade

PrintBCDNumber::
	dr $3ade, $3d4f

INCLUDE "home/audio.asm"
