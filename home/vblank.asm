; VBlank is the interrupt responsible for updating VRAM.

; In Pokemon Gold and Silver, VBlank has been hijacked to act as the
; main loop. After time-sensitive graphics operations have been
; performed, joypad input and sound functions are executed.

; This prevents the display and audio output from lagging.

VBlank::
	push af
	push bc
	push de
	push hl

	ldh a, [hVBlank]
	maskbits NUM_VBLANK_HANDLERS

	ld e, a
	ld d, 0
	ld hl, VBlankHandlers
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, .return
	push de
	jp hl

.return:
	call GameTimer

	pop hl
	pop de
	pop bc
	pop af
	reti

VBlankHandlers:
; entries correspond to VBLANK_* constants (see constants/wram_constants.asm)
	table_width 2, VBlankHandlers
	dw VBlank_Normal
	dw VBlank_Cutscene
	dw VBlank_SoundOnly
	dw VBlank_Unused
	dw VBlank_Serial
	dw VBlank_Credits
	dw VBlank_Normal ; unused
	dw VBlank_Normal ; unused
	assert_table_length NUM_VBLANK_HANDLERS

VBlank_Normal::
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
	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandomAdd]
	adc b
	ldh [hRandomAdd], a

	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandomSub]
	sbc b
	ldh [hRandomSub], a

	ldh a, [hROMBank]
	ld [wROMBankBackup], a

	ldh a, [hSCX]
	ldh [rSCX], a
	ldh a, [hSCY]
	ldh [rSCY], a
	ldh a, [hWY]
	ldh [rWY], a
	ldh a, [hWX]
	ldh [rWX], a

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
	call FillBGMap0WithBlack

.done

	ldh a, [hOAMUpdate]
	and a
	jr nz, .done_oam
	call hTransferShadowOAM
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

	call UpdateJoypad

	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound
	ld a, [wROMBankBackup]
	rst Bankswitch

	ldh a, [hSeconds]
	ldh [hUnusedBackup], a

	ret

VBlank_Cutscene::
; scx, scy
; palettes
; bg map
; tiles
; oam
; sound / lcd stat

	ldh a, [hROMBank]
	ld [wROMBankBackup], a
	ldh a, [hSCX]
	ldh [rSCX], a
	ldh a, [hSCY]
	ldh [rSCY], a
	call UpdatePals
	jr c, .done

	call UpdateBGMap
	call Serve2bppRequest

	call hTransferShadowOAM

.done
	ldh a, [hLCDCPointer]
	or a
	jr z, .skip_lcd
	ld c, a
	ld a, [wLYOverrides]
	ldh [c], a

.skip_lcd
	xor a
	ld [wVBlankOccurred], a

	; get requested ints
	ldh a, [rIF]
	ld b, a
	; discard requested ints
	xor a
	ldh [rIF], a
	; enable lcd stat
	ld a, 1 << LCD_STAT
	ldh [rIE], a
	; rerequest serial int if applicable (still disabled)
	; request lcd stat
	ld a, b
	and 1 << SERIAL
	or 1 << LCD_STAT
	ldh [rIF], a

	ei
	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound
	ld a, [wROMBankBackup]
	rst Bankswitch
	; enable ints
	ld a, IE_DEFAULT
	ldh [rIE], a
	ret

UpdatePals::
; update pals for either dmg or cgb

	ldh a, [hCGB]
	and a
	jp nz, UpdateCGBPals

	; update gb pals
	ld a, [wBGP]
	ldh [rBGP], a
	ld a, [wOBP0]
	ldh [rOBP0], a
	ld a, [wOBP1]
	ldh [rOBP1], a

	and a
	ret

VBlank_Serial::
; bg map
; tiles
; oam
; joypad
; serial
; sound

	ldh a, [hROMBank]
	ld [wROMBankBackup], a

	call UpdateBGMap
	call Serve2bppRequest

	call hTransferShadowOAM

	call UpdateJoypad

	xor a
	ld [wVBlankOccurred], a

	call AskSerial

	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound

	ld a, [wROMBankBackup]
	rst Bankswitch
	ret

VBlank_Credits::
; scx
; palettes
; bg map
; tiles
; joypad

	ldh a, [hROMBank]
	ld [wROMBankBackup], a

	ldh a, [hSCX]
	ldh [rSCX], a

	call UpdatePalsIfCGB
	jr c, .done

	call UpdateBGMap
	call Serve2bppRequest
.done

	xor a
	ld [wVBlankOccurred], a

	call UpdateJoypad

	xor a
	ldh [rIF], a
	ld a, 1 << LCD_STAT
	ldh [rIE], a
	; request lcd stat
	ldh [rIF], a

	ei
	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound
	ld a, [wROMBankBackup]
	rst Bankswitch
	di

	xor a
	ldh [rIF], a
	; enable ints
	ld a, IE_DEFAULT
	ldh [rIE], a
	ret

VBlank_SoundOnly::
; sound only

	ldh a, [hROMBank]
	ld [wROMBankBackup], a

	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound

	ld a, [wROMBankBackup]
	rst Bankswitch

	xor a
	ld [wVBlankOccurred], a
	ret

VBlank_Unused::
; scx, scy
; palettes
; bg map
; tiles
; oam
; sound / lcd stat

	ldh a, [hVBlankCounter]
	inc a
	ldh [hVBlankCounter], a

	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandomAdd]
	adc b
	ldh [hRandomAdd], a

	ldh a, [rDIV]
	ld b, a
	ldh a, [hRandomSub]
	sbc b
	ldh [hRandomSub], a

	call UpdateJoypad

	ldh a, [hROMBank]
	ld [wROMBankBackup], a

	ldh a, [hSCX]
	ldh [rSCX], a
	ldh a, [hSCY]
	ldh [rSCY], a

	ldh a, [hWY]
	ldh [rWY], a
	ldh a, [hWX]
	ldh [rWX], a

	call UpdateBGMap
	call UpdateBGMapBuffer

	call Serve2bppRequest
	call Serve1bppRequest
	call AnimateTileset
	call hTransferShadowOAM

	xor a
	ld [wVBlankOccurred], a

	ld a, [wTextDelayFrames]
	and a
	jr z, .okay
	dec a
	ld [wTextDelayFrames], a

.okay
	; discard requested ints
	xor a
	ldh [rIF], a
	; enable lcd stat
	ld a, 1 << LCD_STAT
	ldh [rIE], a
	; request lcd stat
	ldh [rIF], a

	ei
	ld a, BANK(_UpdateSound)
	rst Bankswitch
	call _UpdateSound
	ld a, [wROMBankBackup]
	rst Bankswitch
	di

	; discard requested ints
	xor a
	ldh [rIF], a
	; enable ints
	ld a, IE_DEFAULT
	ldh [rIE], a
	ret
