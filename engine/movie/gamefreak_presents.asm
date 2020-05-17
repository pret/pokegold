Copyright_GFPresents: ; e49a8 (39:49a8)
; Play the copyright screen and GameFreak Presents sequence.
; Return carry if user cancels animation by pressing a button.

	call ClearBGPalettes
	call ClearTilemap

	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a

	ldh [hJoyDown], a
	ldh [hSCX], a
	ldh [hSCY], a

	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a

	call WaitBGMap

	ld b, SCGB_GAMEFREAK_LOGO
	call GetSGBLayout

	call SetPalettes

	ld c, 10
	call DelayFrames

	callfar Copyright

	call WaitBGMap

	ld c, 100
	call DelayFrames

	call ClearTilemap
	call GFPresents_Init

.loop
	call GFPresents_PlayFrame
	jr nc, .loop

	; high bits of wJumptableIndex are recycled for some flags
	; this was set if user canceled by pressing a button
	ld a, [wJumptableIndex]
	bit 6, a
	jr nz, .canceled

	; clear carry flag from GFPresents_PlayFrame
	and a
	ret

.canceled
	scf
	ret

GFPresents_Init: ; e49f3 (39:49f3)
; Load gfx and initialize variables

	ld de, GFPresentsGFX1
	ld hl, vTiles1
	lb bc, BANK(GFPresentsGFX1), 28
	call Get1bpp

	ld de, GFPresentsGFX2
	ld hl, vTiles1 tile 28
	lb bc, BANK(GFPresentsGFX2), 5
	call Request2bpp

	farcall ClearSpriteAnims

	ld hl, wSpriteAnimDict
	ld a, 6
	ld [hli], a
	ld a, $8d
	ld [hl], a

	xor a
	ld [wJumptableIndex], a
	ld [$ce64], a
	ld [wIntroSceneTimer], a
	ldh [hSCX], a
	ldh [hSCY], a

	ld a, 1
	ldh [hBGMapMode], a

	ld a, SCREEN_HEIGHT_PX
	ldh [hWY], a

	lb de, %00100100, %11111000
	call DmgToCgbObjPals
	ret

GFPresents_PlayFrame: ; e4a37 (39:4a37)
; Play one frame of GFPresents sequence.
; Return carry when the sequence completes or is canceled.

	call JoyTextDelay
	ldh a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button

	; high bits of wJumptableIndex are recycled for some flags
	; this is set when the sequence finished
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish

	farcall PlaySpriteAnimations

	call GFPresents_HandleFrame
	call DelayFrame

	; ensure carry is cleared
	and a
	ret

.pressed_button
	; high bits of wJumptableIndex are recycled for some flags
	ld hl, wJumptableIndex
	set 6, [hl]

.finish
	callfar ClearSpriteAnims
	call ClearTilemap
	call ClearSprites

	ld c, 16
	call DelayFrames

	scf
	ret

GFPresents_HandleFrame: ; e4a6d (39:4a6d)
; Dispatch to the current scene handler

	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .scenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.scenes
	dw GFPresents_Star
	dw GFPresents_PlaceLogo
	dw GFPresents_LogoSparkles
	dw GFPresents_PlacePresents
	dw GFPresents_WaitForTimer
	dw GFPresents_SetDoneFlag

GFPresents_NextScene: ; e4a88 (39:4a88)
	ld hl, wJumptableIndex
	inc [hl]
	ret

; unused?
Func_e4a8d: ; e4a8d (39:4a8d)
	ld c, 64
	call DelayFrames
	call GFPresents_NextScene
	ret

GFPresents_Star: ; e4a96 (39:4a96)

	; tell GFPresents_PlaceLogo we haven't finished yet
	xor a
	ld [$ce64], a

	depixel 10, 11, 4, 0
	ld a, $16
	call InitSpriteAnimStruct

	; TODO set some flag in the struct?
	ld hl, $c
	add hl, bc
	ld [hl], $80

	ld de, SFX_GAME_FREAK_LOGO_GS
	call PlaySFX

	call GFPresents_NextScene
	ret

GFPresents_PlaceLogo: ; e4ab2 (39:4ab2)
; Draw the Game Freak logo (may be initially invisible due to palette)

	; wait until the star animation completed
	; TODO this is cleared above, but when is it set?
	ld a, [$ce64]
	and a
	ret z

	depixel 10, 11, 4, 0
	ld a, $15
	call InitSpriteAnimStruct

	call GFPresents_NextScene

	; set timer for GFPresents_LogoSparkles
	ld a, $80
	ld [wIntroSceneTimer], a
	ret

GFPresents_LogoSparkles: ; e4ac8 (39:4ac8)

	ld hl, wIntroSceneTimer
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]

	; add first text when timer passes half
	cp $3f
	call z, GFPresents_PlaceGameFreak

	; add sparkles continuously
	call GFPresents_Sparkle
	ret

.done
	; set (unused?) timer for GFPresents_PlacePresents
	ld [hl], $80
	call GFPresents_NextScene
	ret

GFPresents_PlaceGameFreak: ; e4adf (39:4adf)
	hlcoord 5, 12
	ld de, .game_freak
	call PlaceString
	ret

.game_freak
	db $80, $81, $82, $83, $8d, $84, $85, $83, $81, $86, "@"

GFPresents_PlacePresents: ; e4af4 (39:4af4)
	hlcoord 7, 13
	ld de, .presents
	call PlaceString

	call GFPresents_NextScene

	; set timer for GFPresents_WaitForTimer
	ld a, $80
	ld [wIntroSceneTimer], a
	ret

.presents
	db $87, $88, $89, $8a, $8b, $8c, "@"

GFPresents_SetDoneFlag: ; e4b0d (39:4b0d)
; Tell GFPresents_PlayFrame and TitleScreenFrame (01:63da) that we're finished.

	ld hl, wJumptableIndex
	set 7, [hl]
	ret

GFPresents_WaitForTimer: ; e4b13 (39:4b13)
; Wait for the timer to elapse

	ld hl, wIntroSceneTimer
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	ret
.done
	call GFPresents_NextScene
	ret

GFPresents_UpdateLogoPal: ; e4b20 (39:4b20)
; called from 29:5928
; OBP1 was initialized at end of GFPresents_Init

	; once we reached the final state, leave it alone
	ldh a, [rOBP1]
	cp %10010000
	ret z

	; wait 16 frames before next change
	ld a, [wIntroSceneTimer]
	and $f
	ret nz

	; rotate OBP1 by one color slot (2 bits)
	; DMG: logo is white, then light gray, then dark gray
	; CGB: logo is white, then yellow
	ldh a, [rOBP1]
	rrca
	rrca
	call DmgToCgbObjPal1
	ret

GFPresents_Sparkle: ; e4b33 (39:4b33)
; Initialize and configure a sparkle sprite.
; TODO unclear how this relates to the actual screen display,
; seems to be called more times than there are visible sparkles?

	; run only every second frame
	ld d, a
	and 1
	ret nz

	; shift over so our index is still changing by 1 each time
	ld a, d
	srl a

	; set up a new sparkle sprite
	push af
	depixel 11, 11
	ld a, $17
	call InitSpriteAnimStruct
	pop af

	; take the bottom 4 bits of a as an index into
	; sparkle_vectors (16 entries)
	and %00001111
	ld e, a
	ld d, 0
	ld hl, .sparkle_vectors
	add hl, de
	add hl, de

	; set the angle and distance for this sprite
	; bc+$b <- hl (angle), bc+$c <- 0, bc+$d <- hl+1 (distance)
	ld e, l
	ld d, h
	ld hl, $b
	add hl, bc
	ld a, [de]
	ld [hl], a
	inc de
	ld hl, $c
	add hl, bc
	ld [hl], 0
	inc hl
	ld a, [de]
	ld [hl], a

	ret

.sparkle_vectors
	; values control final position of each sparkle
	; position is automatically animated along the vector
	; each entry emits two sparkles in opposite directions
	; angle (6 bits) and distance (tiles?)
	db $00, $03
	db $08, $04
	db $04, $03
	db $0c, $02
	db $10, $02
	db $18, $03
	db $14, $04
	db $1c, $03
	db $20, $02
	db $28, $02
	db $24, $03
	db $2c, $04
	db $30, $04
	db $38, $03
	db $34, $02
	db $3c, $04

GFPresentsGFX1:
INCBIN "gfx/intro/gamefreak_presents.1bpp"
INCBIN "gfx/intro/gamefreak_logo.1bpp"

GFPresentsGFX2:
INCBIN "gfx/intro/logo_star.2bpp"
INCBIN "gfx/intro/logo_sparkle.2bpp"
