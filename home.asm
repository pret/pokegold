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

Function343::
	dr $343, $41b

LCD::
	dr $41b, $5c6

Start_::
	dr $5c6, $6aa

Serial::
	dr $6aa, $8df

JoypadInt::
	dr $8df, $8e6

Function8e6::
	dr $8e6, $bdf

Functionbdf::
	dr $bdf, $be3

Functionbe3::
	dr $be3, $1458

Function1458::
	dr $1458, $14bb

Function14bb::
	dr $14bb, $1579

Function1579::
	dr $1579, $15d0

Function15d0::
	dr $15d0, $162b

Function162b::
	dr $162b, $1642

Function1642::
	dr $1642, $1ebf

Function1ebf::
	dr $1ebf, $1efa

Function1efa::
	dr $1efa, $2e27

FarCall_hl::
	dr $2e27, $3fee
