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

SetMenuAttributes:: ; 1a4e
	dr $1a4e, $1eb3

PrinterReceive::
	dr $1eb3, $1ebf

AskSerial::
	dr $1ebf, $1efa

Function1efa::
	dr $1efa, $2835

Function2835::
	dr $2835, $2841

Function2841::
	dr $2841, $2e27

FarCall_hl::
	dr $2e27, $2e49

Predef::
	dr $2e49, $30e1

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
	dr $323d, $344c

WaitBGMap::
	dr $344c, $3472

ApplyTilemap::
	dr $3472, $3564

Function3564::
	dr $3564, $35b9

GetWeekday::
	dr $35b9, $39f9

PlayCry::
	dr $39f9, $3ade

PrintBCDNumber::
	dr $3ade, $3d4f

INCLUDE "home/audio.asm"
