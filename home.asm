; rst vectors
INCLUDE "constants.asm"

INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

SECTION "start", HOME[$100]
Start::
	nop
	jp Start_

SECTION "bank0", HOME[$150]
INCLUDE "home/vblank.asm"
INCLUDE "home/delay.asm"
INCLUDE "home/rtc.asm"
INCLUDE "home/fade.asm"

LCD::
	dr $41b, $467

UpdateTime::
	dr $467, $5c6

Start_::
	dr $5c6, $6aa

Serial::
	dr $6aa, $8df

JoypadInt::
	dr $8df, $8e6

Joypad::
	dr $8e6, $bdf

UpdatePalsIfCGB::
	ld a, [hCGB]
	and a
	ret z
UpdateCGBPals::
	dr $be3, $c61

Functionc61::
	dr $c61, $c83

Functionc83::
	dr $c83, $1458

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
	dr $1642, $1ebf

AskSerial::
	dr $1ebf, $1efa

Function1efa::
	dr $1efa, $2e27

FarCall_hl::
	dr $2e27, $3fee
