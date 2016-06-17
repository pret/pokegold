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

OpenSRAM::
	dr $30e1, $30f1

CloseSRAM::
	dr $30f1, $30ff

Function30ff::
	dr $30ff, $311a

CopyBytes::
	dr $311a, $3128

Function3128::
	dr $3128, $313c

GetFarHalfword::
	dr $313c, $314c

ByteFill::
	dr $314c, $3158

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

Function317b::
	dr $317b, $31a3

Function31a3::
	dr $31a3, $31b5

SimpleDivide::
	dr $31b5, $31e2

Function31e2::
	dr $31e2, $323d

PrintNum::
	dr $323d, $3449

Function3449::
	dr $3449, $344c

WaitBGMap::
	dr $344c, $3456

Function3456::
	dr $3456, $3472

ApplyTilemap::
	dr $3472, $348e

Function348e::
	dr $348e, $3564

Function3564::
	dr $3564, $3583

Function3583::
	dr $3583, $35b9

GetWeekday::
	dr $35b9, $3654

Function3654::
	dr $3654, $39f9

PlayCry::
	dr $39f9, $3ade

PrintBCDNumber::
	dr $3ade, $3d4f

INCLUDE "home/audio.asm"
