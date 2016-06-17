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

Function2e16:: ; 2e16
; Inexplicably blank
; Seen in predef pointers
rept 16
	nop
endr
	ret

INCLUDE "home/farcall.asm"
INCLUDE "home/predef.asm"

Function2e80:: ; 2e6c (0:2e6c)
	dr $2e80, $2ef1

Function2ef1::
	dr $2ef1, $2f10

Function2f10::
	dr $2f10, $2f16

Function2f16::
	dr $2f16, $2f1d

Function2f1d::
	dr $2f1d, $2f93

Function2f93::
	dr $2f93, $2fa4

Function2fa4::
	dr $2fa4, $30e1

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
	dr $31a3, $31e2

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
	dr $3472, $3564

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
