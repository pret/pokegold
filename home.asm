INCLUDE "constants.asm"

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

UpdateBGMapBuffer::
	dr $1458, $14bb

UpdateBGMap::
	dr $14bb, $1579

Function1579::
	dr $1579, $15d0

Serve2bppRequest::
	dr $15d0, $162b

Function162b::
	dr $162b, $1642

Function1642::
	dr $1642, $196f

UpdateSprites::
	dr $196f, $1eb3

PrinterReceive::
	dr $1eb3, $1ebf

AskSerial::
	dr $1ebf, $1efa

Function1efa::
	dr $1efa, $2e27

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
	dr $311a, $313c

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
	dr $317b, $31e2

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
