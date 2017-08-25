VBlank::
	push af
	push bc
	push de
	push hl
	ld a, [hVBlank]
	and $7
	ld e, a
	ld d, $0
	ld hl, .blanks
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .return
	push de
	jp hl
.return
	call GameTimer
	pop hl
	pop de
	pop bc
	pop af
	reti

.blanks
	dw VBlank0
	dw VBlank1
	dw VBlank2
	dw VBlank3
	dw VBlank4
	dw VBlank5
	dw VBlank0
	dw VBlank0 ; just in case
;180

VBlank0:: ; 180
; normal operation

; rng
; scx, scy, wy, wx
; bg map buffer
; palettes
; dma transfer
; bg map
; tiles
; oam
; joypad
; sound

	; inc frame counter
	ld hl, hVBlankCounter
	inc [hl]

	; advance random variables
	ld a, [rDIV]
	ld b, a
	ld a, [hRandomAdd]
	adc b
	ld [hRandomAdd], a

	ld a, [rDIV]
	ld b, a
	ld a, [hRandomSub]
	sbc b
	ld [hRandomSub], a

	ld a, [hROMBank]
	ld [wROMBankBackup], a

	ld a, [hSCX]
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a
	ld a, [hWY]
	ld [rWY], a
	ld a, [hWX]
	ld [rWX], a

	; There's only time to call one of these in one vblank.
	; Calls are in order of priority.

	call UpdateBGMapBuffer
	jr c, .done
	call UpdatePalsIfCGB
	jr c, .done
	call UpdateBGMap

	; These have their own timing checks.

	call Serve2bppRequest
	call Serve1bppRequest
	call AnimateTileset
	call Function1642

.done

	ld a, [hOAMUpdate]
	and a
	jr nz, .done_oam
	call hPushOAM
.done_oam


	; vblank-sensitive operations are done


	xor a
	ld [wVBlankOccurred], a

	ld a, [wOverworldDelay]
	and a
	jr z, .ok
	dec a
	ld [wOverworldDelay], a
.ok

	ld a, [wTextDelayFrames]
	and a
	jr z, .ok2
	dec a
	ld [wTextDelayFrames], a
.ok2

	call Joypad
	ld a, BANK(UpdateSound_)
	rst Bankswitch
	call UpdateSound_
	ld a, [wROMBankBackup]
	rst Bankswitch
	ld a, [hSeconds]
	ld [hSecondsBackup], a
	ret

VBlank1:: ; 1f4
; scx, scy
; palettes
; bg map
; tiles
; oam
; sound / lcd stat
	ld a, [hROMBank]
	ld [wROMBankBackup], a
	ld a, [hSCX]
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a
	call UpdatePals
	jr c, .done

	call UpdateBGMap
	call Serve2bppRequest

	call hPushOAM
.done
	ld a, [hLCDCPointer]
	or a
	jr z, .skip_lcd
	ld c, a
	ld a, [wc700]
	ld [$ff00+c], a
.skip_lcd
	xor a
	ld [wVBlankOccurred], a

	; get requested ints
	ld a, [rIF]
	ld b, a
	; discard requested ints
	xor a
	ld [rIF], a
	; enable lcd stat
	ld a, %10 ; lcd stat
	ld [rIE], a
	; rerequest serial int if applicable (still disabled)
	; request lcd stat
	ld a, b
	and %1000 ; serial
	or %10 ; lcd stat
	ld [rIF], a

	ei
	ld a, BANK(UpdateSound_)
	rst Bankswitch
	call UpdateSound_
	ld a, [wROMBankBackup]
	rst Bankswitch
	; enable ints
	ld a, %11111
	ld [rIE], a
	ret

UpdatePals:: ; 23e
; update pals for either dmg or cgb
	ld a, [hCGB]
	and a
	jp nz, UpdateCGBPals

	; update gb pals
	ld a, [wBGP]
	ld [rBGP], a
	ld a, [wOBP0]
	ld [rOBP0], a
	ld a, [wOPB1]
	ld [rOBP1], a
	and a
	ret

VBlank4:: ; 255
; bg map
; tiles
; oam
; joypad
; serial
; sound

	ld a, [hROMBank]
	ld [wROMBankBackup], a

	call UpdateBGMap
	call Serve2bppRequest

	call hPushOAM

	call Joypad

	xor a
	ld [wVBlankOccurred], a

	call AskSerial

	ld a, BANK(UpdateSound_)
	rst Bankswitch
	call UpdateSound_

	ld a, [wROMBankBackup]
	rst Bankswitch
	ret

VBlank5:: ; 278
; scx
; palettes
; bg map
; tiles
; joypad

	ld a, [hROMBank]
	ld [wROMBankBackup], a

	ld a, [hSCX]
	ld [rSCX], a

	call UpdatePalsIfCGB
	jr c, .done

	call UpdateBGMap
	call Serve2bppRequest
.done

	xor a
	ld [wVBlankOccurred], a

	call Joypad

	xor a
	ld [rIF], a
	ld a, %10 ; lcd stat
	ld [rIE], a
	; request lcd stat
	ld [rIF], a

	ei
	ld a, BANK(UpdateSound_)
	rst Bankswitch
	call UpdateSound_
	ld a, [wROMBankBackup]
	rst Bankswitch
	di

	xor a
	ld [rIF], a
	; enable ints
	ld a, %11111
	ld [rIE], a
	ret

VBlank2:: ; 2b0
; sound only

	ld a, [hROMBank]
	ld [wROMBankBackup], a

	ld a, BANK(UpdateSound_)
	rst Bankswitch
	call UpdateSound_

	ld a, [wROMBankBackup]
	rst Bankswitch

	xor a
	ld [wVBlankOccurred], a
	ret

VBlank3:: ; 2c4
; scx, scy
; palettes
; bg map
; tiles
; oam
; sound / lcd stat

	ld a, [hVBlankCounter]
	inc a
	ld [hVBlankCounter], a

	ld a, [rDIV]
	ld b, a
	ld a, [hRandomAdd]
	adc b
	ld [hRandomAdd], a

	ld a, [rDIV]
	ld b, a
	ld a, [hRandomSub]
	sbc b
	ld [hRandomSub], a

	call Joypad

	ld a, [hROMBank]
	ld [wROMBankBackup], a

	ld a, [hSCX]
	ld [rSCX], a
	ld a, [hSCY]
	ld [rSCY], a

	ld a, [hWY]
	ld [rWY], a
	ld a, [hWX]
	ld [rWX], a

	call UpdateBGMap
	call UpdateBGMapBuffer

	call Serve2bppRequest

	call Serve1bppRequest
	call AnimateTileset

	call hPushOAM

	xor a
	ld [wVBlankOccurred], a

	ld a, [wTextDelayFrames]
	and a
	jr z, .okay
	dec a
	ld [wTextDelayFrames], a
.okay

	xor a
	ld [rIF], a
	ld a, %10 ; lcd stat
	ld [rIE], a
	; request lcd stat
	ld [rIF], a

	ei
	ld a, BANK(UpdateSound_)
	rst Bankswitch
	call UpdateSound_
	ld a, [wROMBankBackup]
	rst Bankswitch
	di

	xor a
	ld [rIF], a
	; enable ints 
	ld a, %11111
	ld [rIE], a
	ret
