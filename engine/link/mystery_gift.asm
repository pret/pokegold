; hMGRole values
IR_RECEIVER EQU 1
IR_SENDER   EQU 2

; hMGStatusFlags error bits
MG_WRONG_CHECKSUM_F EQU 0
MG_TIMED_OUT_F      EQU 1
MG_CANCELED_F       EQU 4
MG_WRONG_PREFIX_F   EQU 7

; hMGStatusFlags values
MG_WRONG_CHECKSUM EQU 1 << MG_WRONG_CHECKSUM_F
MG_TIMED_OUT      EQU 1 << MG_TIMED_OUT_F
MG_CANCELED       EQU 1 << MG_CANCELED_F
MG_WRONG_PREFIX   EQU 1 << MG_WRONG_PREFIX_F
MG_NOT_OKAY       EQU MG_WRONG_CHECKSUM | MG_TIMED_OUT | MG_CANCELED | MG_WRONG_PREFIX
MG_OKAY           EQU ~MG_NOT_OKAY
MG_START_END      EQU %11111111

REGION_PREFIX EQU $96
REGION_CODE   EQU $90 ; USA

MESSAGE_PREFIX EQU $5a

DoMysteryGift:
	call ClearTilemap
	call ClearSprites
	call WaitBGMap
	farcall InitMysteryGiftLayout
	hlcoord 3, 8
	ld de, .String_PressAToLink_BToCancel
	call PlaceString
	call WaitBGMap

	; Prepare the first of two messages for wMysteryGiftPartnerData
	farcall StageDataForMysteryGift
	call ClearMysteryGiftTrainer
	ld a, 2
	ld [wMysteryGiftMessageCount], a
	ld a, wMysteryGiftPartnerDataEnd - wMysteryGiftPartnerData
	ld [wMysteryGiftStagedDataLength], a

	ldh a, [rIE]
	push af
	call ExchangeMysteryGiftData
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
	cp MG_CANCELED
	jp z, .LinkCanceled
	cp MG_OKAY
	jp nz, .CommunicationError
	ld a, [wMysteryGiftGameVersion]
	cp POKEMON_PIKACHU_2_VERSION
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
	ld a, [wMysteryGiftGameVersion]
	cp POKEMON_PIKACHU_2_VERSION
	jr z, .skip_append_save
	call .AddMysteryGiftPartnerID
	ld a, [wMysteryGiftGameVersion]
	cp RESERVED_GAME_VERSION
	jr z, .skip_append_save
	call .SaveMysteryGiftTrainerName
.skip_append_save
	ld a, [wMysteryGiftPartnerSentDeco]
	and a
	jr z, .SentItem
; sent decoration
	ld a, [wMysteryGiftPartnerWhichDeco]
	ld c, a
	farcall MysteryGiftGetDecoration
	push bc
	call CheckAndSetMysteryGiftDecorationAlreadyReceived
	pop bc
	jr nz, .SentItem
; keep the decoration if it wasn't already received
	callfar GetDecorationName_c
	ld h, d
	ld l, e
	ld de, wStringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	ld hl, .MysteryGiftSentHomeText ; sent decoration to home
	jr .PrintTextAndExit

.SentItem:
	call GetMysteryGiftBank
	ld a, [wMysteryGiftPartnerWhichItem]
	ld c, a
	farcall MysteryGiftGetItem
	ld a, c
	ld [sBackupMysteryGiftItem], a
	ld [wNamedObjectIndex], a
	call CloseSRAM
	call GetItemName
	ld hl, .MysteryGiftSentText ; sent item/decoration
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
	; fallthrough

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
	cp MAX_MYSTERY_GIFT_PARTNERS
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
	ld hl, sDailyMysteryGiftPartnerIDs ; could have done "inc hl" instead
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [wMysteryGiftPartnerID]
	ld [hli], a
	ld a, [wMysteryGiftPartnerID + 1]
	ld [hl], a
	jp CloseSRAM

.SaveMysteryGiftTrainerName:
	call GetMysteryGiftBank
	ld a, TRUE
	ld [sMysteryGiftTrainerHouseFlag], a
	ld hl, wMysteryGiftPartnerName
	ld de, sMysteryGiftPartnerName
	ld bc, NAME_LENGTH
	call CopyBytes
	assert sMysteryGiftPartnerName + NAME_LENGTH == sMysteryGiftUnusedFlag
	ld a, TRUE
	ld [de], a
	inc de
	assert sMysteryGiftUnusedFlag + 1 == sMysteryGiftTrainer
	ld hl, wMysteryGiftTrainer
	ld bc, wMysteryGiftTrainerEnd - wMysteryGiftTrainer
	call CopyBytes
	jp CloseSRAM

ExchangeMysteryGiftData:
	farcall ClearChannels
	call InitializeIRCommunicationInterrupts

.restart
	call BeginIRCommunication
	call InitializeIRCommunicationRoles
	ldh a, [hMGStatusFlags]
	cp MG_CANCELED
	jp z, EndOrContinueMysteryGiftIRCommunication
	cp MG_OKAY
	jr nz, .restart

	ldh a, [hMGRole]
	cp IR_SENDER
	jr z, SenderExchangeMysteryGiftDataPayloads
; receiver
	ld hl, hMGExchangedByte
	ld b, 1
	call TryReceivingIRDataBlock
	jr nz, .failed
	call ReceiveMysteryGiftDataPayload_GotRegionPrefix
	jp nz, EndOrContinueMysteryGiftIRCommunication
	jr ReceiverExchangeMysteryGiftDataPayloads_GotPayload

.failed
	; Delay frame
.wait_frame
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .wait_frame

	ld c, LOW(rRP)
	ld a, rRP_ENABLE_READ_MASK
	ldh [c], a

	ld b, 60 * 4 ; 4 seconds
.continue
	push bc
	call MysteryGift_UpdateJoypad
	ld b, 1 << rRP_RECEIVING
	ld c, LOW(rRP)
.in_vblank
	ldh a, [c]
	and b
	ld b, a
	ldh a, [rLY]
	cp LY_VBLANK
	jr nc, .in_vblank
.wait_vblank
	ldh a, [c]
	and b
	ld b, a
	ldh a, [rLY]
	cp LY_VBLANK
	jr c, .wait_vblank
	ld a, b
	pop bc
	; Restart if the 4-second timeout has elapsed
	dec b
	jr z, .restart
	; Restart if rRP is not receiving data
	or a
	jr nz, .restart
	; Check if we've pressed the B button to cancel
	ldh a, [hMGJoypadReleased]
	bit B_BUTTON_F, a
	jr z, .continue
	ld a, MG_CANCELED
	ldh [hMGStatusFlags], a
	jp EndOrContinueMysteryGiftIRCommunication

ReceiverExchangeMysteryGiftDataPayloads:
	; Receive the data payload
	call ReceiveMysteryGiftDataPayload
	jp nz, EndOrContinueMysteryGiftIRCommunication
	; fallthrough
ReceiverExchangeMysteryGiftDataPayloads_GotPayload:
	; Switch roles
	call BeginSendingIRCommunication
	jp nz, EndOrContinueMysteryGiftIRCommunication
	; Send the data payload
	call SendMysteryGiftDataPayload
	jp nz, EndOrContinueMysteryGiftIRCommunication
	; Switch roles
	call BeginReceivingIRCommunication
	jp nz, EndOrContinueMysteryGiftIRCommunication
	; Receive an empty block
	call ReceiveEmptyIRDataBlock
	jp EndOrContinueMysteryGiftIRCommunication

SenderExchangeMysteryGiftDataPayloads:
	; Send the data payload
	call SendMysteryGiftDataPayload
	jp nz, EndOrContinueMysteryGiftIRCommunication
	; Switch roles
	call BeginReceivingIRCommunication
	jp nz, EndOrContinueMysteryGiftIRCommunication
	; Receive the data payload
	call ReceiveMysteryGiftDataPayload
	jp nz, EndOrContinueMysteryGiftIRCommunication
	; Switch roles
	call BeginSendingIRCommunication
	jp nz, EndOrContinueMysteryGiftIRCommunication
	; Send an empty block
	call SendEmptyIRDataBlock
	jp EndOrContinueMysteryGiftIRCommunication

ReceiveMysteryGiftDataPayload:
	; Receive the region prefix
	ld hl, hMGExchangedByte
	ld b, 1
	call TryReceivingIRDataBlock
	ret nz
	; fallthrough
ReceiveMysteryGiftDataPayload_GotRegionPrefix:
	; Receive an empty block
	call ReceiveEmptyIRDataBlock
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret nz
	; Verify the received region prefix
	ldh a, [hMGExchangedByte]
	cp REGION_PREFIX
	jp nz, WrongMysteryGiftRegion
	ld a, REGION_CODE
	ldh [hMGExchangedByte], a
	; Switch roles
	call BeginSendingIRCommunication
	ret nz
	; Send the region code
	ld hl, hMGExchangedByte
	ld b, 1
	call TrySendingIRDataBlock
	ret nz
	; Send an empty block
	call SendEmptyIRDataBlock
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret nz
	; Switch roles
	call BeginReceivingIRCommunication
	ret nz
	; Receive the staged data
	ld hl, wMysteryGiftTrainer
	ld a, [wMysteryGiftStagedDataLength]
	ld b, a
	call TryReceivingIRDataBlock
	ret nz
	; Receive an empty block
	call ReceiveEmptyIRDataBlock
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret

SendMysteryGiftDataPayload:
	; Send the region prefix
	ld a, REGION_PREFIX
	ldh [hMGExchangedByte], a
	ld hl, hMGExchangedByte
	ld b, 1
	call TrySendingIRDataBlock
	ret nz
	; Send an empty block
	call SendEmptyIRDataBlock
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret nz
	; Switch roles
	call BeginReceivingIRCommunication
	ret nz
	; Receive the region code
	ld hl, hMGExchangedByte
	ld b, 1
	call TryReceivingIRDataBlock
	ret nz
	; Receive an empty block
	call ReceiveEmptyIRDataBlock
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret nz
	; Verify the received region code
	ldh a, [hMGExchangedByte]
	cp REGION_CODE
	jp nz, WrongMysteryGiftRegion
	; Switch roles
	call BeginSendingIRCommunication
	ret nz
	; Send the staged data
	ld hl, wMysteryGiftStaging
	ld a, [wMysteryGiftStagedDataLength]
	ld b, a
	call TrySendingIRDataBlock
	ret nz
	; Send an empty block
	call SendEmptyIRDataBlock
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret

EndOrContinueMysteryGiftIRCommunication:
	nop
	ldh a, [hMGStatusFlags]
	; Quit if player canceled
	cp MG_CANCELED
	jr z, .quit
	; Quit if there was a communication error
	cp MG_OKAY
	jr nz, .quit
	; Quit if all messages are sent/received
	ld hl, wMysteryGiftMessageCount
	dec [hl]
	jr z, .quit
	; Quit if communicating with Pokémon Pikachu 2 device
	ld hl, wMysteryGiftTrainer
	ld de, wMysteryGiftPartnerData
	ld bc, wMysteryGiftPartnerDataEnd - wMysteryGiftPartnerData
	call CopyBytes
	ld a, [wMysteryGiftTrainer] ; first byte is the version
	cp POKEMON_PIKACHU_2_VERSION
	jr nc, .quit

	; Prepare the second message for wMysteryGiftTrainer
	farcall StagePartyDataForMysteryGift
	call ClearMysteryGiftTrainer
	ld a, wMysteryGiftTrainerEnd - wMysteryGiftTrainer
	ld [wMysteryGiftStagedDataLength], a

	ldh a, [hMGRole]
	cp IR_SENDER
	jr z, .sender
; receiver
	call BeginReceivingIRCommunication
	jr nz, EndOrContinueMysteryGiftIRCommunication
	jp ReceiverExchangeMysteryGiftDataPayloads

.sender
	call BeginSendingIRCommunication
	jr nz, EndOrContinueMysteryGiftIRCommunication
	jp SenderExchangeMysteryGiftDataPayloads

.quit
	xor a
	ldh [rIF], a
	ldh a, [rIE]
	or 1 << VBLANK
	ldh [rIE], a
	ei
	call DelayFrame
	ldh a, [hMGStatusFlags]
	push af
	call EndIRCommunication
	pop af
	ret

WrongMysteryGiftRegion:
	ld a, MG_WRONG_PREFIX
	ldh [hMGStatusFlags], a
	and a
	ret

BeginSendingIRCommunication:
	call BeginIRCommunication
	call SendIRHelloMessage
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret

BeginReceivingIRCommunication:
	call BeginIRCommunication
	call ReceiveIRHelloMessage
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret

TrySendingIRDataBlock:
	call SendIRDataBlock
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret

TryReceivingIRDataBlock:
	call ReceiveIRDataBlock
	ldh a, [hMGStatusFlags]
	cp MG_OKAY
	ret

InitializeIRCommunicationInterrupts:
	call StartFastIRTimer
	ld a, 1 << TIMER
	ldh [rIE], a
	xor a
	ldh [rIF], a
	call BeginIRCommunication
; waits for ~$40400 cycles = ~0.25 seconds
	xor a
	ld b, a
.busy_wait
	inc a
	jr nz, .busy_wait
	inc b
	jr nz, .busy_wait
	ret

StartFastIRTimer:
; Starts a 65,536 Hz timer that interrupts every 3 increments (21,845 Hz).
	xor a
	ldh [rTAC], a
	ld a, -2
	ldh [rTMA], a
	ldh [rTIMA], a
	ld a, rTAC_65536_HZ
	ldh [rTAC], a
	or 1 << rTAC_ON
	ldh [rTAC], a
	ret

StartSlowIRTimer:
; Starts a 65,536 Hz timer that interrupts every 256 increments (256 Hz).
	xor a
	ldh [rTAC], a
	ldh [rTMA], a
	ldh [rTIMA], a
	ld a, rTAC_65536_HZ
	ldh [rTAC], a
	or 1 << rTAC_ON
	ldh [rTAC], a
	ret

BeginIRCommunication:
	ld a, rRP_ENABLE_READ_MASK
	call ToggleIRCommunication
	ld a, IR_RECEIVER
	ldh [hMGRole], a
	ret

EndIRCommunication:
	xor a
	call ToggleIRCommunication
	ld a, rTAC_65536_HZ
	ldh [rTAC], a
	ret

ReceiveInfraredLEDOn:
; Count interrupts of the partner's IR LED on; quit after 256-d interrupts.
.recv_loop
	inc d
	ret z
	xor a
	ldh [rIF], a
	halt
	ldh a, [c]
	bit rRP_RECEIVING, a
	jr z, .recv_loop
	or a
	ret

ReceiveInfraredLEDOff:
; Count interrupts of the partner's IR LED off; quit after 256-d interrupts.
.no_recv_loop
	inc d
	ret z
	xor a
	ldh [rIF], a
	halt
	ldh a, [c]
	bit rRP_RECEIVING, a
	jr nz, .no_recv_loop
	or a
	ret

SendInfraredLEDOn:
; Holds the IR LED on for d-1 interrupts.
	ld a, rRP_ENABLE_READ_MASK | (1 << rRP_LED_ON)
	ldh [c], a
.wait
	dec d
	ret z
	xor a
	ldh [rIF], a
	halt
	jr .wait

SendInfraredLEDOff:
; Holds the IR LED off for d-1 interrupts.
	ld a, rRP_ENABLE_READ_MASK
	ldh [c], a
.wait
	dec d
	ret z
	xor a
	ldh [rIF], a
	halt
	jr .wait

InitializeIRCommunicationRoles:
	ld d, 0
	ld e, d

	ld a, IR_RECEIVER
	ldh [hMGRole], a
.loop
	call MysteryGift_UpdateJoypad
	ld b, 1 << rRP_RECEIVING
	ld c, LOW(rRP)
	; Check if we've pressed the B button to cancel
	ldh a, [hMGJoypadReleased]
	bit B_BUTTON_F, a
	jr z, .not_canceled
	ld a, MG_CANCELED
	ldh [hMGStatusFlags], a
	ret

.not_canceled
	; Check if we've pressed the A button to start sending
	bit A_BUTTON_F, a
	jr nz, SendIRHelloMessageAfterDelay
	; If rRP is not receiving data, keep checking for input
	ldh a, [c]
	and b
	jr nz, .loop
	; fallthrough

ReceiveIRHelloMessage:
	ld c, LOW(rRP)
	ld d, 0
	ld e, d

	call ReceiveInfraredLEDOff
	jp z, InfraredLEDReceiveTimedOut
	ld d, e
	call ReceiveInfraredLEDOn
	jp z, InfraredLEDReceiveTimedOut
	call ReceiveInfraredLEDOff
	jp z, InfraredLEDReceiveTimedOut
	call ReceiveInfraredLEDOn
	jp z, InfraredLEDReceiveTimedOut

	ld a, MG_OKAY
	ldh [hMGStatusFlags], a

	ld d, 61
	call SendInfraredLEDOff
	ld d, 5
	call SendInfraredLEDOn
	ld d, 21
	call SendInfraredLEDOff
	ld d, 5
	call SendInfraredLEDOn
	ld d, 5
	call SendInfraredLEDOff
	ret

SendIRHelloMessageAfterDelay:
	; Wait a random amount of time
	call Random
	ld e, a
	and $f
	ld d, a
.wait_loop
	dec de
	ld a, d
	or e
	jr nz, .wait_loop
	; fallthrough

SendIRHelloMessage:
	ld a, IR_SENDER
	ldh [hMGRole], a

	ld c, LOW(rRP)
	ld d, 0
	ld e, d

	ld d, 61
	call SendInfraredLEDOff
	ld d, 5
	call SendInfraredLEDOn
	ld d, 21
	call SendInfraredLEDOff
	ld d, 5
	call SendInfraredLEDOn
	ld d, 5
	call SendInfraredLEDOff

	ld d, e
	call ReceiveInfraredLEDOff
	jp z, InfraredLEDReceiveTimedOut
	ld d, e
	call ReceiveInfraredLEDOn
	jp z, InfraredLEDReceiveTimedOut
	call ReceiveInfraredLEDOff
	jp z, InfraredLEDReceiveTimedOut
	call ReceiveInfraredLEDOn
	jp z, InfraredLEDReceiveTimedOut

	ld d, 61
	call SendInfraredLEDOff

	ld a, MG_OKAY
	ldh [hMGStatusFlags], a
	ret

ToggleIRCommunication:
	ldh [rRP], a
	ld a, MG_START_END
	ldh [hMGStatusFlags], a
	ret

SendIRDataBlock:
; Send b bytes of data in three messages:
; 1. two bytes: MESSAGE_PREFIX and the length b
; 2. b bytes: the actual data
; 3. two bytes: a little-endian checksum
; Then receive a one-byte acknowledgement message: the status.
	xor a
	ldh [hMGChecksum + 0], a
	ldh [hMGChecksum + 1], a
	push hl
	push bc
	ld c, LOW(rRP)
	ld d, 61
	call SendInfraredLEDOff
	ld hl, hMGExchangedWord
	ld a, MESSAGE_PREFIX
	ld [hli], a
	ld [hl], b
	dec hl
	ld b, 2
	call SendIRDataMessage
	pop bc
	pop hl
	call SendIRDataMessage
	ldh a, [hMGChecksum + 0]
	ldh [hMGExchangedWord + 0], a
	ldh a, [hMGChecksum + 1]
	ldh [hMGExchangedWord + 1], a
	push hl
	ld hl, hMGExchangedWord
	ld b, 2
	call SendIRDataMessage
	ld hl, hMGStatusFlags
	ld b, 1
	call ReceiveIRDataMessage
	ldh a, [hMGExchangedWord + 0]
	ldh [hMGChecksum + 0], a
	ldh a, [hMGExchangedWord + 1]
	ldh [hMGChecksum + 1], a
	pop hl
	ret

SendIRDataMessage:
; Send b bytes of data one bit at a time, and update the checksum.
	ld c, LOW(rRP)

	ld d, 5
	call SendInfraredLEDOff
	ld d, 5
	call SendInfraredLEDOn
	ld d, 21
	call SendInfraredLEDOff

	; b = -b - 1; then count up to 0
	ld a, b
	cpl
	ld b, a

	ld a, -12
	ldh [rTMA], a
.byte_loop
	inc b
	jr z, .done
	ld a, 8
	ldh [hMGNumBits], a
	; Get the next data byte
	ld a, [hli]
	ld e, a
	; Add the next data byte to the checksum
	ldh a, [hMGChecksum + 0]
	add e
	ldh [hMGChecksum + 0], a
	ldh a, [hMGChecksum + 1]
	adc 0
	ldh [hMGChecksum + 1], a
	; Send each bit of the byte
.bit_loop
	xor a
	ldh [rIF], a
	halt
	ld a, rRP_ENABLE_READ_MASK | (1 << rRP_LED_ON)
	ldh [rRP], a
	; Turn the LED off for longer if the bit is 1
	ld d, 1
	ld a, e
	rlca
	ld e, a
	jr nc, .wait
	inc d
.wait
	ldh a, [rTIMA]
	cp -8
	jr c, .wait
	ld a, rRP_ENABLE_READ_MASK
	ldh [rRP], a
	dec d
	jr z, .no_halt
	xor a
	ldh [rIF], a
	halt
.no_halt
	ldh a, [hMGNumBits]
	dec a
	jr z, .byte_loop
	ldh [hMGNumBits], a
	jr .bit_loop

.done
	ld a, -2
	ldh [rTMA], a
	xor a
	ldh [rIF], a
	halt

	ld d, 5
	call SendInfraredLEDOn
	ld d, 17
	call SendInfraredLEDOff
	ret

InfraredLEDReceiveTimedOut:
	ldh a, [hMGStatusFlags]
	or MG_TIMED_OUT
	ldh [hMGStatusFlags], a
	ret

ReceivedWrongIRChecksum:
	ldh a, [hMGStatusFlags]
	or MG_WRONG_CHECKSUM
	ldh [hMGStatusFlags], a
	ret

ReceivedWrongIRMessagePrefix:
	ldh a, [hMGStatusFlags]
	or MG_WRONG_PREFIX
	ldh [hMGStatusFlags], a
	ret

ReceiveIRDataBlock:
; Receive b bytes of data in three messages:
; 1. two bytes: MESSAGE_PREFIX and the length b
; 2. b bytes: the actual data
; 3. two bytes: a little-endian checksum
; Then send a one-byte acknowledgement message: the status.
	xor a
	ldh [hMGChecksum + 0], a
	ldh [hMGChecksum + 1], a
	push bc
	push hl
	ld hl, hMGExchangedWord
	ld b, 2
	call ReceiveIRDataMessage
	ldh a, [hMGExchangedWord + 1]
	ldh [hMGUnusedMsgLength], a
	ld b, a
	pop hl
	pop af
	cp b
	jp c, ReceivedWrongIRMessagePrefix
	ldh a, [hMGExchangedWord + 0]
	cp MESSAGE_PREFIX
	jp nz, ReceivedWrongIRMessagePrefix
	call ReceiveIRDataMessage
	ldh a, [hMGChecksum + 0]
	ld d, a
	ldh a, [hMGChecksum + 1]
	ld e, a
	push hl
	push de
	ld hl, hMGExchangedWord
	ld b, 2
	call ReceiveIRDataMessage
	pop de
	ld hl, hMGExchangedWord
	ld a, [hli]
	xor d
	ld b, a
	ld a, [hl]
	xor e
	or b
	call nz, ReceivedWrongIRChecksum
	push de

	ld d, 61
	call SendInfraredLEDOff

	ld hl, hMGStatusFlags
	ld b, 1
	call SendIRDataMessage

	pop de
	pop hl
	ld a, d
	ldh [hMGChecksum + 0], a
	ld a, e
	ldh [hMGChecksum + 1], a
	ret

ReceiveIRDataMessage:
	ld c, LOW(rRP)

	ld d, 0
	call ReceiveInfraredLEDOff
	jp z, InfraredLEDReceiveTimedOut
	ld d, 0
	call ReceiveInfraredLEDOn
	jp z, InfraredLEDReceiveTimedOut
	ld d, 0
	call ReceiveInfraredLEDOff
	jp z, InfraredLEDReceiveTimedOut

	ld a, b
	cpl
	ld b, a
	xor a
	ldh [hMGPrevTIMA], a

	call StartSlowIRTimer
.main_loop
	inc b
	jr z, .done
	ld a, 8
	ldh [hMGNumBits], a
.inner_loop
	ld d, 0
.recv_loop
	inc d
	jr z, .recv_done
	ldh a, [c]
	bit rRP_RECEIVING, a
	jr z, .recv_loop
	ld d, 0
.recv_done
.send_loop
	inc d
	jr z, .send_done
	ldh a, [c]
	bit rRP_RECEIVING, a
	jr nz, .send_loop
.send_done
	ldh a, [hMGPrevTIMA]
	ld d, a
	ldh a, [rTIMA]
	ldh [hMGPrevTIMA], a
	sub d
	cp $12
	jr c, .zero
	set 0, e
	jr .ok
.zero
	res 0, e
.ok
	ldh a, [hMGNumBits]
	dec a
	ldh [hMGNumBits], a
	jr z, .continue
	ld a, e
	rlca
	ld e, a
	jr .inner_loop

.continue
	ld a, e
	ld [hli], a
	ldh a, [hMGChecksum + 0]
	add e
	ldh [hMGChecksum + 0], a
	ldh a, [hMGChecksum + 1]
	adc 0
	ldh [hMGChecksum + 1], a
	jr .main_loop

.done
	call StartFastIRTimer
	xor a
	ldh [rIF], a
	ld d, 0
	call ReceiveInfraredLEDOn
	jp z, InfraredLEDReceiveTimedOut

	ld d, 16
	call SendInfraredLEDOff
	ret

SendEmptyIRDataBlock:
	ld b, 0
	jp SendIRDataBlock

ReceiveEmptyIRDataBlock:
	ld b, 0
	jp ReceiveIRDataBlock

MysteryGift_UpdateJoypad:
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

CheckAndSetMysteryGiftDecorationAlreadyReceived:
; Return nz if decoration c was already received; otherwise receive it.
	call GetMysteryGiftBank
	ld d, 0
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

CopyMysteryGiftReceivedDecorationsToPC:
	call GetMysteryGiftBank
	ld c, 0
.loop
	push bc
	ld d, 0
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
	cp NUM_NON_TROPHY_DECOS
	jr c, .loop
	jp CloseSRAM

UnlockMysteryGift:
; If [sMysteryGiftUnlocked] was -1, this sets both
; [sMysteryGiftUnlocked] and [sMysteryGiftItem] to 0.
	call GetMysteryGiftBank
	ld hl, sMysteryGiftUnlocked
	ld a, [hl]
	inc a
	jr nz, .ok
	ld [hld], a
	assert sMysteryGiftUnlocked - 1 == sMysteryGiftItem
	ld [hl], a
.ok
	jp CloseSRAM

ResetDailyMysteryGiftLimitIfUnlocked:
	call GetMysteryGiftBank
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	cp -1 ; locked?
	jr z, .dont_clear
	xor a
	ld [sNumDailyMysteryGiftPartnerIDs], a
.dont_clear
	jp CloseSRAM

BackupMysteryGift:
; Copies [sMysteryGiftItem] to [sBackupMysteryGiftItem],
; and [sMysteryGiftUnlocked] to [sNumDailyMysteryGiftPartnerIDs].
	call GetMysteryGiftBank
	ld hl, sMysteryGiftItem
	ld de, sBackupMysteryGiftItem
	ld a, [hli]
	ld [de], a
	inc de
	assert sMysteryGiftItem + 1 == sMysteryGiftUnlocked
	assert sBackupMysteryGiftItem + 1 == sNumDailyMysteryGiftPartnerIDs
	ld a, [hl]
	ld [de], a
	jp CloseSRAM

RestoreMysteryGift:
; Copies [sBackupMysteryGiftItem] to [sMysteryGiftItem],
; and [sNumDailyMysteryGiftPartnerIDs] to [sMysteryGiftUnlocked].
	call GetMysteryGiftBank
	ld hl, sBackupMysteryGiftItem
	ld de, sMysteryGiftItem
	ld a, [hli]
	ld [de], a
	inc de
	assert sBackupMysteryGiftItem + 1 == sNumDailyMysteryGiftPartnerIDs
	assert sMysteryGiftItem + 1 == sMysteryGiftUnlocked
	ld a, [hl]
	ld [de], a
	jp CloseSRAM

ClearMysteryGiftTrainer:
	ld hl, wMysteryGiftTrainer
	xor a
	ld b, wMysteryGiftTrainerEnd - wMysteryGiftTrainer
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

GetMysteryGiftBank:
	ld a, BANK(sMysteryGiftData)
	jp OpenSRAM
