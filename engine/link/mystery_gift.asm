DoMysteryGift:
	call ClearTilemap
	call ClearSprites
	call WaitBGMap
	farcall InitMysteryGiftLayout
	hlcoord 3, 8
	ld de, .String_PressAToLink_BToCancel
	call PlaceString
	call WaitBGMap
	farcall PrepMysteryGiftDataToSend
	call MysteryGift_ClearTrainerData
	ld a, $2
	ld [wc901], a
	ld a, $14
	ld [wc902], a
	ldh a, [rIE]
	push af

	call Function29fc9

	ld d, a
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	push de
	call ClearTilemap
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	pop de
	hlcoord 2, 8
	ld a, d
	ld de, .MysteryGiftCanceledText ; Link has been canceled
	cp $10
	jp z, .LinkCanceled
	cp $6c
	jp nz, .CommunicationError
	ld a, [wc800]
	cp 3
	jr z, .skip_checks
	call .CheckAlreadyGotFiveGiftsToday
	ld hl, .MysteryGiftFiveADayText ; Only 5 gifts a day
	jp nc, .PrintTextAndExit
	call .CheckAlreadyGotAGiftFromThatPerson
	ld hl, .MysteryGiftOneADayText ; Only one gift a day per person
	jp c, .PrintTextAndExit
.skip_checks
	ld a, [wMysteryGiftPlayerBackupItem]
	and a
	jr nz, .GiftWaiting
	ld a, [wMysteryGiftPartnerBackupItem]
	and a
	jr nz, .FriendNotReady
	ld a, [wc800]
	cp 3
	jr z, .skip_append_save
	call .AddMysteryGiftPartnerID
	ld a, [wc800]
	cp 4
	jr z, .skip_append_save
	call .SaveMysteryGiftTrainerName
.skip_append_save
	ld a, [wMysteryGiftPartnerSentDeco]
	and a
	jr z, .item
	ld a, [wMysteryGiftPartnerWhichDeco]
	ld c, a
	farcall MysteryGiftGetDecoration
	push bc
	call MysteryGift_CheckAndSetDecorationAlreadyReceived
	pop bc
	jr nz, .item
	callfar GetDecorationName_c
	ld h, d
	ld l, e
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	ld hl, .MysteryGiftSentHomeText ; sent decoration to home
	jr .PrintTextAndExit

.item
	call GetMysteryGiftBank
	ld a, [wMysteryGiftPartnerWhichItem]
	ld c, a
	farcall MysteryGiftGetItemHeldEffect
	ld a, c
	ld [sBackupMysteryGiftItem], a
	ld [wNamedObjectIndexBuffer], a
	call CloseSRAM
	call GetItemName
	ld hl, .MysteryGiftSentText ; sent item
	jr .PrintTextAndExit

.LinkCanceled:
	ld hl, .MysteryGiftCanceledText ; Link has been canceled
	jr .PrintTextAndExit

.CommunicationError:
	ld hl, .MysteryGiftCommErrorText ; Communication error
	call PrintText
	jp DoMysteryGift

.GiftWaiting:
	ld hl, .RetrieveMysteryGiftText ; receive gift at counter
	jr .PrintTextAndExit

.FriendNotReady:
	ld hl, .YourFriendIsNotReadyText ; friend not ready

.PrintTextAndExit:
	call PrintText
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ret

.String_PressAToLink_BToCancel:
	db   "Press A to"
	next "link IR-Device"
	next "Press B to"
	next "cancel it."
	db   "@"

.MysteryGiftCanceledText:
	text_far _MysteryGiftCanceledText
	text_end

.MysteryGiftCommErrorText:
	text_far _MysteryGiftCommErrorText
	text_end

.RetrieveMysteryGiftText:
	text_far _RetrieveMysteryGiftText
	text_end

.YourFriendIsNotReadyText:
	text_far _YourFriendIsNotReadyText
	text_end

.MysteryGiftFiveADayText:
	text_far _MysteryGiftFiveADayText
	text_end

.MysteryGiftOneADayText:
	text_far _MysteryGiftOneADayText
	text_end

.MysteryGiftSentText:
	text_far _MysteryGiftSentText
	text_end

.MysteryGiftSentHomeText:
	text_far _MysteryGiftSentHomeText
	text_end

.CheckAlreadyGotFiveGiftsToday:
	call GetMysteryGiftBank
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	cp $5
	jp CloseSRAM

.CheckAlreadyGotAGiftFromThatPerson:
	call GetMysteryGiftBank
	ld a, [wMysteryGiftPartnerID]
	ld b, a
	ld a, [wMysteryGiftPartnerID + 1]
	ld c, a
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	ld d, a
	ld hl, sDailyMysteryGiftPartnerIDs
.loop
	ld a, d
	and a
	jr z, .No
	ld a, [hli]
	cp b
	jr nz, .skip
	ld a, [hl]
	cp c
	jr z, .Yes
.skip
	inc hl
	dec d
	jr .loop
.Yes:
	scf
.No:
	jp CloseSRAM

.AddMysteryGiftPartnerID:
	call GetMysteryGiftBank
	ld hl, sNumDailyMysteryGiftPartnerIDs
	ld a, [hl]
	inc [hl]
	ld hl, sDailyMysteryGiftPartnerIDs ; inc hl
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [wMysteryGiftPartnerID]
	ld [hli], a
	ld a, [wMysteryGiftPartnerID + 1]
	ld [hl], a
	jp CloseSRAM

.SaveMysteryGiftTrainerName:
	call GetMysteryGiftBank
	ld a, $1
	ld [sMysteryGiftTrainerHouseFlag], a
	ld hl, wMysteryGiftPartnerName
	ld de, sMysteryGiftPartnerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, $1
	ld [de], a
	inc de
	ld hl, wMysteryGiftTrainerData
	ld bc, (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 2
	call CopyBytes
	jp CloseSRAM

Function29fc9:
	farcall ClearChannels
	call Function2a18c

.loop2
	call Function2a1c4
	call Function2a20b
	ldh a, [hMGStatusFlags]
	cp $10
	jp z, Function2a103
	cp $6c
	jr nz, .loop2

	ldh a, [hPrintNumBuffer + 8]
	cp $2
	jr z, Function2a055
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function2a184
	jr nz, .ly_loop
	call Function2a07c
	jp nz, Function2a103
	jr Function2a03d
	; Delay frame
.ly_loop
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .ly_loop
	ld c, LOW(rRP)
	ld a, $c0
	ldh [c], a
	ld b, 240 ; This might have been intended as a 4-second timeout buffer.
	          ; However, it is reset with each frame.
.loop3
	push bc
	call MysteryGift_ReadJoypad

	ld b, $2
	ld c, LOW(rRP)
	; Delay frame
.ly_loop2
	ldh a, [c]
	and b
	ld b, a
	ldh a, [rLY]
	cp LY_VBLANK
	jr nc, .ly_loop2
.ly_loop3
	ldh a, [c]
	and b
	ld b, a
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .ly_loop3

	ld a, b
	pop bc
	dec b
	jr z, .loop2 ; we never jump here
	or a
	jr nz, .loop2
	; Check if we've pressed the B button
	ldh a, [hMGJoypadReleased]
	bit B_BUTTON_F, a
	jr z, .loop3
	ld a, $10
	ldh [hMGStatusFlags], a
	jp Function2a103

Function2a037:
	call Function2a073
	jp nz, Function2a103
; fallthrough
Function2a03d:
	call Function2a166
	jp nz, Function2a103
	call Function2a0bb
	jp nz, Function2a103
	call Function2a171
	jp nz, Function2a103
	call Function2a461
	jp Function2a103

Function2a055:
	call Function2a0bb
	jp nz, Function2a103
	call Function2a171
	jp nz, Function2a103
	call Function2a073
	jp nz, Function2a103
	call Function2a166
	jp nz, Function2a103
	call Function2a45c
	jp Function2a103

Function2a073:
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function2a184
	ret nz
; fallthrough
Function2a07c:
	call Function2a461
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	ldh a, [hPrintNumBuffer]
	cp $96
	jp nz, Function2a160
	ld a, $90
	ldh [hPrintNumBuffer], a
	call Function2a166
	ret nz
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function2a17c
	ret nz
	call Function2a45c
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	call Function2a171
	ret nz
	ld hl, wMysteryGiftTrainerData
	ld a, [wc902]
	ld b, a
	call Function2a184
	ret nz
	call Function2a461
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function2a0bb:
	ld a, $96
	ldh [hPrintNumBuffer], a
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function2a17c
	ret nz
	call Function2a45c
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	call Function2a171
	ret nz
	ld hl, hPrintNumBuffer
	ld b, $1
	call Function2a184
	ret nz
	call Function2a461
	ldh a, [hMGStatusFlags]
	cp $6c
	ret nz
	ldh a, [hPrintNumBuffer]
	cp $90
	jp nz, Function2a160
	call Function2a166
	ret nz
	ld hl, wLinkData
	ld a, [wc902]
	ld b, a
	call Function2a17c
	ret nz
	call Function2a45c
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function2a103:
	nop
	ldh a, [hMGStatusFlags]
	cp $10
	jr z, .quit
	cp $6c
	jr nz, .quit
	ld hl, wc901
	dec [hl]
	jr z, .quit
	ld hl, wMysteryGiftTrainerData
	ld de, wMysteryGiftPartnerData
	ld bc, wMysteryGiftPartnerDataEnd - wMysteryGiftPartnerData
	call CopyBytes
	ld a, [wMysteryGiftTrainerData]
	cp $3
	jr nc, .quit
	farcall StagePartyDataForMysteryGift
	call MysteryGift_ClearTrainerData
	ld a, $26
	ld [wc902], a
	ldh a, [hPrintNumBuffer + 8]
	cp $2
	jr z, .asm_2a143
	call Function2a171
	jr nz, Function2a103
	jp Function2a037

.asm_2a143
	call Function2a166
	jr nz, Function2a103
	jp Function2a055

.quit:
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	or 1 << VBLANK
	ldh [rIE], a
	ei
	call DelayFrame
	ldh a, [hMGStatusFlags]
	push af
	call Function2a1ce
	pop af
	ret

Function2a160:
	ld a, $80
	ldh [hMGStatusFlags], a
	and a
	ret

Function2a166:
	call Function2a1c4
	call Function2a274
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function2a171:
	call Function2a1c4
	call Function2a22c
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function2a17c:
	call Function2a2c1
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function2a184:
	call Function2a385
	ldh a, [hMGStatusFlags]
	cp $6c
	ret

Function2a18c:
	call Function2a1a2
	ld a, 1 << TIMER
	ldh [rIE], a
	xor a
	ldh [rIF], a
	call Function2a1c4
	xor a
	ld b, a
.asm_2a19b
	inc a
	jr nz, .asm_2a19b
	inc b
	jr nz, .asm_2a19b
	ret

Function2a1a2:
	xor a
	ldh [rTAC], a
	ld a, $fe
	ldh [rTMA], a
	ldh [rTIMA], a
	ld a, $2
	ldh [rTAC], a
	or $4
	ldh [rTAC], a
	ret

Function2a1b4:
	xor a
	ldh [rTAC], a
	ldh [rTMA], a
	ldh [rTIMA], a
	ld a, $2
	ldh [rTAC], a
	or $4
	ldh [rTAC], a
	ret

Function2a1c4:
	ld a, $c0
	call Function2a2ba
	ld a, $1
	ldh [hPrintNumBuffer + 8], a
	ret

Function2a1ce:
	xor a
	call Function2a2ba
	ld a, $2
	ldh [rTAC], a
	ret

Function2a1d7:
	inc d
	ret z
	xor a
	ldh [rIF], a
	halt
	ldh a, [c]
	bit 1, a
	jr z, Function2a1d7
	or a
	ret

Function2a1e5:
	inc d
	ret z
	xor a
	ldh [rIF], a
	halt
	ldh a, [c]
	bit 1, a
	jr nz, Function2a1e5
	or a
	ret

Function2a1f3:
	ld a, $c1
	ldh [c], a
.wait
	dec d
	ret z
	xor a
	ldh [rIF], a
	halt
	jr .wait

Function2a1ff:
	ld a, $c0
	ldh [c], a
.wait
	dec d
	ret z
	xor a
	ldh [rIF], a
	halt
	jr .wait

Function2a20b:
	ld d, $0
	ld e, d
	ld a, $1
	ldh [hPrintNumBuffer + 8], a
.loop
	call MysteryGift_ReadJoypad
	ld b, $2
	ld c, LOW(rRP)
	ldh a, [hMGJoypadReleased]
	bit B_BUTTON_F, a
	jr z, .next
	ld a, $10
	ldh [hMGStatusFlags], a
	ret

.next
	bit 0, a
	jr nz, Function2a268
	ldh a, [c]
	and b
	jr nz, .loop

Function2a22c:
	ld c, LOW(rRP)
	ld d, $0
	ld e, d
	call Function2a1e5
	jp z, Function2a370
	ld d, e
	call Function2a1d7
	jp z, Function2a370
	call Function2a1e5
	jp z, Function2a370
	call Function2a1d7
	jp z, Function2a370
	ld a, $6c
	ldh [hMGStatusFlags], a
	ld d, $3d
	call Function2a1ff
	ld d, $5
	call Function2a1f3
	ld d, $15
	call Function2a1ff
	ld d, $5
	call Function2a1f3
	ld d, $5
	call Function2a1ff
	ret

Function2a268:
	; Wait a random amount of time
	call Random
	ld e, a
	and $f
	ld d, a
.loop
	dec de
	ld a, d
	or e
	jr nz, .loop
Function2a274:
	ld a, $2
	ldh [hPrintNumBuffer + 8], a
	ld c, LOW(rRP)
	ld d, $0
	ld e, d
	ld d, $3d
	call Function2a1ff
	ld d, $5
	call Function2a1f3
	ld d, $15
	call Function2a1ff
	ld d, $5
	call Function2a1f3
	ld d, $5
	call Function2a1ff
	ld d, e
	call Function2a1e5
	jp z, Function2a370
	ld d, e
	call Function2a1d7
	jp z, Function2a370
	call Function2a1e5
	jp z, Function2a370
	call Function2a1d7
	jp z, Function2a370
	ld d, $3d
	call Function2a1ff
	ld a, $6c
	ldh [hMGStatusFlags], a
	ret

Function2a2ba:
	ldh [rRP], a
	ld a, $ff
	ldh [hMGStatusFlags], a
	ret

Function2a2c1:
	xor a
	ldh [hPrintNumBuffer + 4], a
	ldh [hPrintNumBuffer + 5], a
	push hl
	push bc
	ld c, LOW(rRP)
	ld d, $3d
	call Function2a1ff
	ld hl, hPrintNumBuffer + 1
	ld a, $5a
	ld [hli], a
	ld [hl], b
	dec hl
	ld b, $2
	call Function2a304
	pop bc
	pop hl
	call Function2a304
	ldh a, [hPrintNumBuffer + 4]
	ldh [hPrintNumBuffer + 1], a
	ldh a, [hPrintNumBuffer + 5]
	ldh [hPrintNumBuffer + 2], a
	push hl
	ld hl, hPrintNumBuffer + 1
	ld b, $2
	call Function2a304
	ld hl, hMGStatusFlags
	ld b, $1
	call Function2a3dd
	ldh a, [hPrintNumBuffer + 1]
	ldh [hPrintNumBuffer + 4], a
	ldh a, [hPrintNumBuffer + 2]
	ldh [hPrintNumBuffer + 5], a
	pop hl
	ret

Function2a304:
	ld c, LOW(rRP)
	ld d, $5
	call Function2a1ff
	ld d, $5
	call Function2a1f3
	ld d, $15
	call Function2a1ff
	ld a, b
	cpl
	ld b, a
	ld a, $f4
	ldh [rTMA], a
.asm_2a31c
	inc b
	jr z, .asm_2a35c
	ld a, $8
	ldh [hPrintNumBuffer + 3], a
	ld a, [hli]
	ld e, a
	ldh a, [hPrintNumBuffer + 4]
	add e
	ldh [hPrintNumBuffer + 4], a
	ldh a, [hPrintNumBuffer + 5]
	adc 0
	ldh [hPrintNumBuffer + 5], a
.asm_2a330
	xor a
	ldh [rIF], a
	halt
	ld a, $c1
	ldh [rRP], a
	ld d, $1
	ld a, e
	rlca
	ld e, a
	jr nc, .asm_2a341
	inc d
.asm_2a341
	ldh a, [rTIMA]
	cp $f8
	jr c, .asm_2a341
	ld a, $c0
	ldh [rRP], a
	dec d
	jr z, .asm_2a353
	xor a
	ldh [rIF], a
	halt
.asm_2a353
	ldh a, [hPrintNumBuffer + 3]
	dec a
	jr z, .asm_2a31c
	ldh [hPrintNumBuffer + 3], a
	jr .asm_2a330
.asm_2a35c
	ld a, $fe
	ldh [rTMA], a
	xor a
	ldh [rIF], a
	halt
	ld d, $5
	call Function2a1f3
	ld d, $11
	call Function2a1ff
	ret

Function2a370:
	ldh a, [hMGStatusFlags]
	or $2
	ldh [hMGStatusFlags], a
	ret

Function2a377:
	ldh a, [hMGStatusFlags]
	or $1
	ldh [hMGStatusFlags], a
	ret

Function2a37e:
	ldh a, [hMGStatusFlags]
	or $80
	ldh [hMGStatusFlags], a
	ret

Function2a385:
	xor a
	ldh [hPrintNumBuffer + 4], a
	ldh [hPrintNumBuffer + 5], a
	push bc
	push hl
	ld hl, hPrintNumBuffer + 1
	ld b, $2
	call Function2a3dd
	ldh a, [hPrintNumBuffer + 2]
	ldh [hPrintNumBuffer + 7], a
	ld b, a
	pop hl
	pop af
	cp b
	jp c, Function2a37e
	ldh a, [hPrintNumBuffer + 1]
	cp $5a
	jp nz, Function2a37e
	call Function2a3dd
	ldh a, [hPrintNumBuffer + 4]
	ld d, a
	ldh a, [hPrintNumBuffer + 5]
	ld e, a
	push hl
	push de
	ld hl, hPrintNumBuffer + 1
	ld b, $2
	call Function2a3dd
	pop de
	ld hl, hPrintNumBuffer + 1
	ld a, [hli]
	xor d
	ld b, a
	ld a, [hl]
	xor e
	or b
	call nz, Function2a377
	push de
	ld d, $3d
	call Function2a1ff
	ld hl, hMGStatusFlags
	ld b, $1
	call Function2a304
	pop de
	pop hl
	ld a, d
	ldh [hPrintNumBuffer + 4], a
	ld a, e
	ldh [hPrintNumBuffer + 5], a
	ret

Function2a3dd:
	ld c, LOW(rRP)
	ld d, $0
	call Function2a1e5
	jp z, Function2a370
	ld d, $0
	call Function2a1d7
	jp z, Function2a370
	ld d, $0
	call Function2a1e5
	jp z, Function2a370
	ld a, b
	cpl
	ld b, a
	xor a
	ldh [hMGPrevTIMA], a
	call Function2a1b4
.asm_2a400
	inc b
	jr z, .asm_2a448
	ld a, $8
	ldh [hPrintNumBuffer + 3], a
.asm_2a407
	ld d, $0
.asm_2a409
	inc d
	jr z, .asm_2a413
	ldh a, [c]
	bit 1, a
	jr z, .asm_2a409
	ld d, $0
.asm_2a413
	inc d
	jr z, .asm_2a41b
	ldh a, [c]
	bit 1, a
	jr nz, .asm_2a413
.asm_2a41b
	ldh a, [hMGPrevTIMA]
	ld d, a
	ldh a, [rTIMA]
	ldh [hMGPrevTIMA], a
	sub d
	cp $12
	jr c, .asm_2a42b
	set 0, e
	jr .asm_2a42d
.asm_2a42b
	res 0, e
.asm_2a42d
	ldh a, [hPrintNumBuffer + 3]
	dec a
	ldh [hPrintNumBuffer + 3], a
	jr z, .asm_2a439
	ld a, e
	rlca
	ld e, a
	jr .asm_2a407
.asm_2a439
	ld a, e
	ld [hli], a
	ldh a, [hPrintNumBuffer + 4]
	add e
	ldh [hPrintNumBuffer + 4], a
	ldh a, [hPrintNumBuffer + 5]
	adc 0
	ldh [hPrintNumBuffer + 5], a
	jr .asm_2a400
.asm_2a448
	call Function2a1a2
	xor a
	ldh [rIF], a
	ld d, $0
	call Function2a1d7
	jp z, Function2a370
	ld d, $10
	call Function2a1ff
	ret

Function2a45c:
	ld b, $0
	jp Function2a2c1

Function2a461:
	ld b, $0
	jp Function2a385

MysteryGift_ReadJoypad:
; We can only get four inputs at a time.
; We take d-pad first for no particular reason.
	ld a, R_DPAD
	ldh [rJOYP], a
; Read twice to give the request time to take.
	ldh a, [rJOYP]
	ldh a, [rJOYP]

; The Joypad register output is in the lo nybble (inversed).
; We make the hi nybble of our new container d-pad input.
	cpl
	and $f
	swap a

; We'll keep this in b for now.
	ld b, a

; Buttons make 8 total inputs (A, B, Select, Start).
; We can fit this into one byte.
	ld a, R_BUTTONS
	ldh [rJOYP], a
; Wait for input to stabilize.
rept 6
	ldh a, [rJOYP]
endr
; Buttons take the lo nybble.
	cpl
	and $f
	or b
	ld c, a
; To get the delta we xor the last frame's input with the new one.
	ldh a, [hMGJoypadPressed]
	xor c
; Released this frame:
	and c
	ldh [hMGJoypadReleased], a
; Pressed this frame:
	ld a, c
	ldh [hMGJoypadPressed], a
	ld a, $30
; Reset the joypad register since we're done with it.
	ldh [rJOYP], a
	ret

MysteryGift_CheckAndSetDecorationAlreadyReceived:
	call GetMysteryGiftBank
	ld d, $0
	ld b, CHECK_FLAG
	ld hl, sMysteryGiftDecorationsReceived
	lda_predef SmallFarFlagAction
	push hl
	push bc
	call Predef
	call CloseSRAM
	ld a, c
	and a
	pop bc
	pop hl
	ret nz
	call GetMysteryGiftBank
	ld b, SET_FLAG
	predef SmallFarFlagAction
	call CloseSRAM
	xor a
	ret

MysteryGift_CopyReceivedDecosToPC:
	call GetMysteryGiftBank
	ld c, $0
.loop
	push bc
	ld d, $0
	ld b, CHECK_FLAG
	ld hl, sMysteryGiftDecorationsReceived
	predef SmallFarFlagAction
	ld a, c
	and a
	pop bc
	jr z, .skip
	push bc
	callfar SetSpecificDecorationFlag
	pop bc
.skip
	inc c
	ld a, c
	cp TrophyIDs - DecorationIDs
	jr c, .loop
	jp CloseSRAM

UnlockMysteryGift:
	call GetMysteryGiftBank
	ld hl, sMysteryGiftUnlocked
	ld a, [hl]
	inc a
	jr nz, .ok
	ld [hld], a
	ld [hl], a
.ok
	jp CloseSRAM

Function2a4f6:
	call GetMysteryGiftBank
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	cp $ff
	jr z, .okay
	xor a
	ld [sNumDailyMysteryGiftPartnerIDs], a
.okay
	jp CloseSRAM

BackupMysteryGift:
	call GetMysteryGiftBank
	ld hl, sMysteryGiftItem
	ld de, sBackupMysteryGiftItem
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp CloseSRAM

RestoreMysteryGift:
	call GetMysteryGiftBank
	ld hl, sBackupMysteryGiftItem
	ld de, sMysteryGiftItem
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp CloseSRAM

MysteryGift_ClearTrainerData:
	ld hl, wMysteryGiftTrainerData
	xor a
	ld b, wMysteryGiftTrainerDataEnd - wMysteryGiftTrainerData
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

GetMysteryGiftBank:
	ld a, BANK(sBackupMysteryGiftItem)
	jp OpenSRAM
