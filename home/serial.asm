Serial:: ; 6aa (0:06aa)
	push af
	push bc
	push de
	push hl

	ld a, [wPrinterConnectionOpen]
	bit 0, a
	jr nz, .printer

	ld a, [hLinkPlayerNumber]
	inc a
	jr z, .init_player_number
	ld a, [rSB]
	ld [hSerialReceive], a
	ld a, [hSerialSend]
	ld [rSB], a
	ld a, [hLinkPlayerNumber]
	cp $2
	jr z, .player2
	ld a, 0 << rSC_ON
	ld [rSC], a
	ld a, 1 << rSC_ON
	ld [rSC], a
	jr .player2

.printer
	call PrinterReceive
	jr .end

.init_player_number
	ld a, [rSB]
	cp $1
	jr z, .player1
	cp $2
	jr nz, .player2

.player1
	ld [hSerialReceive], a
	ld [hLinkPlayerNumber], a
	cp $2
	jr z, ._player2

	xor a
	ld [rSB], a
	ld a, $3
	ld [rDIV], a

.wait_bit_7
	ld a, [rDIV]
	bit 7, a
	jr nz, .wait_bit_7

	; cycle the serial controller
	ld a, 0 << rSC_ON
	ld [rSC], a
	ld a, 1 << rSC_ON
	ld [rSC], a
	jr .player2

._player2
	xor a
	ld [rSB], a
.player2
	ld a, $1
	ld [hFFCC], a
	ld a, SERIAL_NO_DATA_BYTE
	ld [hSerialSend], a

.end
	pop hl
	pop de
	pop bc
	pop af
	reti

Function710:: ; 710
	ld a, $1
	ld [hFFCE], a
.loop
	ld a, [hl]
	ld [hSerialSend], a
	call Function73b
	push bc
	ld b, a
	inc hl
	ld a, $30
.wait
	dec a
	jr nz, .wait
	ld a, [hFFCE]
	and a
	ld a, b
	pop bc
	jr z, .load
	dec hl
	cp SERIAL_PREAMBLE_BYTE
	jr nz, .loop
	xor a
	ld [hFFCE], a
	jr .loop

.load
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Function73b:: ; 73b (0:073b)
.loop
	xor a
	ld [hFFCC], a
	ld a, [hLinkPlayerNumber]
	cp $2
	jr nz, .loop2
	ld a, (1 << rSC_CLOCK) | (0 << rSC_ON)
	ld [rSC], a
	ld a, (1 << rSC_CLOCK) | (1 << rSC_ON)
	ld [rSC], a
.loop2
	ld a, [hFFCC]
	and a
	jr nz, .reset_ffcc
	ld a, [hLinkPlayerNumber]
	cp $1
	jr nz, .not_player_1_or_wLinkTimeoutFrames_zero
	call CheckLinkTimeout
	jr z, .not_player_1_or_wLinkTimeoutFrames_zero
	call Serial15CycleDelay
	push hl
	ld hl, wLinkTimeoutFrames + 1
	inc [hl]
	jr nz, .no_rollover_up
	dec hl
	inc [hl]

.no_rollover_up
	pop hl
	call CheckLinkTimeout
	jr nz, .loop2
	jp SerialDisconnected

.not_player_1_or_wLinkTimeoutFrames_zero
	ld a, [rIE]
	and $f
	cp $8
	jr nz, .loop2
	ld a, [wce5d]
	dec a
	ld [wce5d], a
	jr nz, .loop2
	ld a, [wce5d + 1]
	dec a
	ld [wce5d + 1], a
	jr nz, .loop2
	ld a, [hLinkPlayerNumber]
	cp $1
	jr z, .reset_ffcc

	ld a, $ff
.delay_255_cycles
	dec a
	jr nz, .delay_255_cycles

.reset_ffcc
	xor a
	ld [hFFCC], a
	ld a, [rIE]
	and $f
	sub $8
	jr nz, .rIE_not_equal_8

	ld [wce5d], a
	ld a, 80
	ld [wce5d + 1], a

.rIE_not_equal_8
	ld a, [hSerialReceive]
	cp SERIAL_NO_DATA_BYTE
	ret nz
	call CheckLinkTimeout
	jr z, .link_timed_out
	push hl
	ld hl, wLinkTimeoutFrames + 1
	ld a, [hl]
	dec a
	ld [hld], a
	inc a
	jr nz, .no_rollover
	dec [hl]

.no_rollover
	pop hl
	call CheckLinkTimeout
	jr z, SerialDisconnected

.link_timed_out
	ld a, [rIE]
	and $f
	cp $8
	ld a, SERIAL_NO_DATA_BYTE
	ret z
	ld a, [hl]
	ld [hSerialSend], a
	call DelayFrame
	jp .loop

Serial15CycleDelay:: ; 7d6 (0:07d6)
	ld a, $f
.loop
	dec a
	jr nz, .loop
	ret

CheckLinkTimeout:: ; 7dc (0:07dc)
	push hl
	ld hl, wLinkTimeoutFrames
	ld a, [hli]
	or [hl]
	pop hl
	ret

SerialDisconnected:: ; 7e4 (0:07e4)
	dec a
	ld [wLinkTimeoutFrames], a
	ld [wLinkTimeoutFrames + 1], a
	ret

Function7ec:: ; 7ec
	ld hl, wPlayerLinkAction
	ld de, wOtherPlayerLinkMode
	ld c, $2
	ld a, $1
	ld [hFFCE], a
.asm_7f8
	call DelayFrame
	ld a, [hl]
	ld [hSerialSend], a
	call Function73b
	ld b, a
	inc hl
	ld a, [hFFCE]
	and a
	ld a, $0
	ld [hFFCE], a
	jr nz, .asm_7f8
	ld a, b
	ld [de], a
	inc de
	dec c
	jr nz, .asm_7f8
	ret

Function813:: ; 813
	call LoadTileMapToTempTileMap
	callfar PlaceWaitingText
	call WaitLinkTransfer
	jp Call_LoadTempTileMapToTileMap

Function822:: ; 822
	call LoadTileMapToTempTileMap
	callfar PlaceWaitingText
	jp WaitLinkTransfer

; One "giant" leap for machinekind

WaitLinkTransfer:: ; 82e (0:082e)
	ld a, $ff
	ld [wOtherPlayerLinkAction], a
.loop
	call LinkTransfer
	call DelayFrame
	call CheckLinkTimeout
	jr z, .check
	push hl
	ld hl, wLinkTimeoutFrames + 1
	dec [hl]
	jr nz, .skip
	dec hl
	dec [hl]
	jr nz, .skip
	pop hl
	xor a
	jp SerialDisconnected

.skip
	pop hl

.check
	ld a, [wOtherPlayerLinkAction]
	inc a
	jr z, .loop

	ld b, 10
.receive
	call DelayFrame
	call LinkTransfer
	dec b
	jr nz, .receive

	ld b, 10
.acknowledge
	call DelayFrame
	call LinkDataReceived
	dec b
	jr nz, .acknowledge

	ld a, [wOtherPlayerLinkAction]
	ld [wOtherPlayerLinkMode], a
	ret

LinkTransfer:: ; 872 (0:0872)
	push bc
	ld b, SERIAL_TIMECAPSULE
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr z, .got_high_nybble
	ld b, SERIAL_TIMECAPSULE
	jr c, .got_high_nybble
	cp LINK_TRADECENTER
	ld b, SERIAL_TRADECENTER
	jr z, .got_high_nybble
	ld b, SERIAL_BATTLE

.got_high_nybble
	call LinkTransferReceive
	ld a, [wPlayerLinkAction]
	add b
	ld [hSerialSend], a
	ld a, [hLinkPlayerNumber]
	cp $2
	jr nz, .asm_89f
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
.asm_89f
	call LinkTransferReceive
	pop bc
	ret

LinkTransferReceive:: ; 8a4 (0:08a4)
	ld a, [hSerialReceive]
	ld [wOtherPlayerLinkMode], a
	and $f0
	cp b
	ret nz
	xor a
	ld [hSerialReceive], a
	ld a, [wOtherPlayerLinkMode]
	and $f
	ld [wOtherPlayerLinkAction], a
	ret

LinkDataReceived:: ; 8b9 (0:08b9)
	xor a
	ld [hSerialSend], a
	ld a, [hLinkPlayerNumber]
	cp $2
	ret nz
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ret

Function8ca:: ; 8ca
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, $2
	ld [rSB], a
	xor a
	ld [hSerialReceive], a
	ld a, $0
	ld [rSC], a
	ld a, $80
	ld [rSC], a
	ret
