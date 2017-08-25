NamingScreen_: ; 11aa3 (4:5aa3)
	call DisableSpriteUpdates
	call NamingScreen
	call ReturnToMapWithSpeechTextbox
	ret

NamingScreen: ; 11aad (4:5aad)
	ld hl, wNamingScreenDestinationPointer
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, wNamingScreenType
	ld [hl], b
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function11ae4
	call DelayFrame
.asm_11ad1
	call Function11cd4
	jr nc, .asm_11ad1
	pop af
	ld [hInMenu], a
	pop af
	ld [hMapAnims], a
	pop af
	ld [wOptions], a
	call ClearJoypad
	ret

Function11ae4: ; 11ae4 (4:5ae4)
	call ClearBGPalettes
	ld b, $8
	call GetSGBLayout
	call DisableLCD
	call Function1201e
	call Function11c67
	ld a, $e3
	ld [rLCDC], a
	call Function11b09
	call WaitBGMap
	call WaitTop
	call SetPalettes
	call Function11fad
	ret

Function11b09: ; 11b09 (4:5b09)
	ld a, [wNamingScreenType]
	and $7
	ld e, a
	ld d, $0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable
	dw Function11b2a
	dw Function11b79
	dw Function11b97
	dw Function11bb8
	dw Function11bda
	dw Function11b2a
	dw Function11b2a
	dw Function11b2a

Function11b2a:
	ld a, [wd004]
	ld [wd151], a
	ld hl, LoadMenuMonIcon
	ld a, BANK(LoadMenuMonIcon)
	ld e, $1
	rst FarCall
	ld a, [wd004]
	ld [wd151], a
	call GetPokemonName
	hlcoord 5, 2
	call PlaceString
	ld l, c
	ld h, b
	ld de, .Strings
	call PlaceString
	inc de
	hlcoord 5, 4
	call PlaceString
	callba GetGender
	jr c, .asm_11b68
	ld a, "♂"
	jr nz, .place_gender
	ld a, "♀"
.place_gender
	hlcoord 1, 2
	ld [hl], a
.asm_11b68
	call Function11c3a
	ret

.Strings:
	db "'S@"
	db "NICKNAME?@"

Function11b79:
	ld de, PlayerSpriteGFX ; $4000
	call Function11c11
	hlcoord 5, 2
	ld de, .String
	call PlaceString
	call Function11c41
	ret

.String:
	db "YOUR NAME?@"

Function11b97:
	ld de, SilverSpriteGFX ; $43c0
	call Function11c11
	hlcoord 5, 2
	ld de, .String
	call PlaceString
	call Function11c41
	ret

.String:
	db "RIVAL'S NAME?@"

Function11bb8:
	ld de, MomSpriteGFX ; $4fc0
	call Function11c11
	hlcoord 5, 2
	ld de, .String
	call PlaceString
	call Function11c41
	ret

.String:
	db "MOTHER'S NAME?@"

Function11bda:
	ld de, $7380
	ld hl, $8000
	lb bc, $31, 4
	call Request2bpp
	xor a
	ld hl, wMisc
	ld [hli], a
	ld [hl], a
	lb de, $24, $20
	ld a, $1c
	call InitAnimatedObjectStruct
	ld hl, $1
	add hl, bc
	ld [hl], $0
	hlcoord 5, 2
	ld de, .String
	call PlaceString
	call Function11c48
	ret

.String:
	db "BOX NAME?@"

Function11c11: ; 11c11 (4:5c11)
	push de
	ld hl, $8000
	lb bc, BANK(PlayerSpriteGFX), 4
	call Request2bpp
	pop de
	ld hl, $c0
	add hl, de
	ld e, l
	ld d, h
	ld hl, $8040
	lb bc, BANK(PlayerSpriteGFX), 4
	call Request2bpp
	xor a
	ld hl, wMisc
	ld [hli], a
	ld [hl], a
	lb de, $24, $20
	ld a, $1c
	call InitAnimatedObjectStruct
	ret

Function11c3a: ; 11c3a (4:5c3a)
	ld a, $a
	hlcoord 5, 6
	jr asm_11c4f

Function11c41: ; 11c41 (4:5c41)
	ld a, $7
	hlcoord 5, 6
	jr asm_11c4f

Function11c48: ; 11c48 (4:5c48)
	ld a, $8
	hlcoord 5, 4
	jr asm_11c4f

asm_11c4f
	ld [wc5d3], a
	ld a, l
	ld [wc5d8], a
	ld a, h
	ld [wc5d9], a
	ret

Function11c5b: ; 11c5b (4:5c5b)
	push bc
	push af
	ld a, [wNamingScreenType]
	sub $3
	ld b, a
	pop af
	dec b
	pop bc
	ret

Function11c67: ; 11c67 (4:5c67)
	call WaitTop
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $60
	call ByteFill
	hlcoord 1, 1
	lb bc, $6, $12
	call Function11c5b
	jr nz, .asm_11c83
	lb bc, $4, $12
.asm_11c83
	call ClearBox
	ld de, NameInputUpper ; $616f
Function11c89: ; 11c89 (4:5c89)
	call Function11c5b
	jr nz, .asm_11c94
	ld hl, $55
	add hl, de
	ld d, h
	ld e, l
.asm_11c94
	push de
	hlcoord 1, 8
	lb bc, $7, $12
	call Function11c5b
	jr nz, .asm_11ca6
	hlcoord 1, 6
	lb bc, $9, $12
.asm_11ca6
	call ClearBox
	hlcoord 1, 16
	lb bc, $1, $12
	call ClearBox
	pop de
	hlcoord 2, 8
	ld b, $5
	call Function11c5b
	jr nz, .asm_11cc2
	hlcoord 2, 6
	ld b, $6
.asm_11cc2
	ld c, $11
.asm_11cc4
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_11cc4
	push de
	ld de, $17
	add hl, de
	pop de
	dec b
	jr nz, .asm_11cc2
	ret

Function11cd4: ; 11cd4 (4:5cd4)
	call JoyTextDelay
	ld a, [wce63]
	bit 7, a
	jr nz, .asm_11cef
	call Function11d27
	callba AnimatedObjects_PlayFrameAndDelay
	call Function11cff
	call DelayFrame
	and a
	ret

.asm_11cef
	callab ClearAnimatedObjectBuffer
	call ClearSprites
	xor a
	ld [hSCX], a
	ld [hSCY], a
	scf
	ret

Function11cff: ; 11cff (4:5cff)
	xor a
	ld [hBGMapMode], a
	hlcoord 1, 5
	call Function11c5b
	jr nz, .asm_11d0d
	hlcoord 1, 3
.asm_11d0d
	ld bc, $112
	call ClearBox
	ld hl, wNamingScreenDestinationPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, wc5d8
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret

Function11d27: ; 11d27 (4:5d27)
	ld a, [wce63]
	ld e, a
	ld d, $0
	ld hl, $5d36
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw Function11d3a
	dw Function11d60

Function11d3a:
	lb de, $50, $18
	call Function11c5b
	jr nz, .asm_11d44
	ld d, $40
.asm_11d44
	ld a, $14
	call InitAnimatedObjectStruct
	ld a, c
	ld [wc5d5], a
	ld a, b
	ld [wc5d6], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	ld hl, $e
	add hl, bc
	ld [hl], a
	ld hl, wce63
	inc [hl]
	ret

Function11d60:
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	jr nz, .asm_11d78
	ld a, [hl]
	and $2
	jr nz, .asm_11da6
	ld a, [hl]
	and $8
	jr nz, .asm_11d8e
	ld a, [hl]
	and $4
	jr nz, .asm_11db3
	ret

.asm_11d78
	call Function11dca
	cp $1
	jr z, .asm_11db3
	cp $2
	jr z, .asm_11da6
	cp $3
	jr z, .asm_11daa
	call Function11fde
	call Function11ed3
	ret nc
.asm_11d8e
	ld hl, wc5d5
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $c
	add hl, bc
	ld [hl], $8
	ld hl, $d
	add hl, bc
	ld [hl], $4
	call Function11c5b
	ret nz
	inc [hl]
	ret

.asm_11da6
	call Function11f89
	ret

.asm_11daa
	call Function11fc4
	ld hl, wce63
	set 7, [hl]
	ret

.asm_11db3
	ld hl, wce64
	ld a, [hl]
	xor $1
	ld [hl], a
	jr z, .asm_11dc3
	ld de, $60b4
	call Function11c89
	ret

.asm_11dc3
	ld de, $616f
	call Function11c89
	ret

Function11dca: ; 11dca (4:5dca)
	ld hl, wc5d5
	ld c, [hl]
	inc hl
	ld b, [hl]
Function11dd0: ; 11dd0 (4:5dd0)
	ld hl, $d
	add hl, bc
	ld a, [hl]
	push bc
	ld b, $4
	call Function11c5b
	jr nz, .asm_11dde
	inc b
.asm_11dde
	cp b
	pop bc
	jr nz, .asm_11df8
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $3
	jr c, .asm_11df2
	cp $6
	jr c, .asm_11df5
	ld a, $3
	ret

.asm_11df2
	ld a, $1
	ret

.asm_11df5
	ld a, $2
	ret

.asm_11df8
	xor a
	ret

Function11dfa:
	call Function11e4a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld e, a
	swap e
	ld hl, $7
	add hl, bc
	ld [hl], e
	ld d, $4
	call Function11c5b
	jr nz, .asm_11e12
	inc d
.asm_11e12
	cp d
	ld de, .LetterEntries
	ld a, $0
	jr nz, .asm_11e1f
	ld de, .CaseDelEnd
	ld a, $1
.asm_11e1f
	ld hl, $e
	add hl, bc
	add [hl]
	ld hl, $1
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.LetterEntries:
	db $00, $10, $20, $30, $40, $50, $60, $70, $80

.CaseDelEnd:
	db $00, $00, $00, $30, $30, $30, $60, $60, $60

Function11e4a: ; 11e4a (4:5e4a)
	ld hl, hJoyLast
	ld a, [hl]
	and $40
	jr nz, .asm_11ec1
	ld a, [hl]
	and $80
	jr nz, .asm_11ea8
	ld a, [hl]
	and $20
	jr nz, .asm_11e84
	ld a, [hl]
	and $10
	jr nz, .asm_11e62
	ret

.asm_11e62
	call Function11dd0
	and a
	jr nz, .asm_11e76
	ld hl, $c
	add hl, bc
.asm_11e6c
	ld a, [hl]
	cp $8
	jr nc, .asm_11e73
	inc [hl]
	ret

.asm_11e73
	ld [hl], $0
	ret

.asm_11e76
	cp $3
	jr nz, .asm_11e7b
	xor a
.asm_11e7b
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
	ret

.asm_11e84
	call Function11dd0
	and a
	jr nz, .asm_11e97
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_11e94
	dec [hl]
	ret

.asm_11e94
	ld [hl], $8
	ret

.asm_11e97
	cp $1
	jr nz, .asm_11e9d
	ld a, $4
.asm_11e9d
	dec a
	dec a
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
	ret

.asm_11ea8
	ld hl, $d
	add hl, bc
	ld a, [hl]
	call Function11c5b
	jr nz, .asm_11eb8
	cp $5
	jr nc, .asm_11ebe
	inc [hl]
	ret

.asm_11eb8
	cp $4
	jr nc, .asm_11ebe
	inc [hl]
	ret

.asm_11ebe
	ld [hl], $0
	ret

.asm_11ec1
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_11ecb
	dec [hl]
	ret

.asm_11ecb
	ld [hl], $4
	call Function11c5b
	ret nz
	inc [hl]
	ret

Function11ed3: ; 11ed3 (4:5ed3)
	ld a, [wc5d7]
	ld hl, Dakutens
	cp $e5
	jr z, asm_11f06
	ld hl, Handakutens
	cp $e4
	jr z, asm_11f06
Function11ee4: ; 11ee4 (4:5ee4)
	ld a, [wc5d3]
	ld c, a
	ld a, [wc5d2]
	cp c
	ret nc
	ld a, [wc5d7]
asm_11ef0
	call Function11f9d
	ld [hl], a
asm_11ef4
	ld hl, wc5d2
	inc [hl]
	call Function11f9d
	ld a, [hl]
	cp $50
	jr z, .asm_11f04
	ld [hl], $f2
	and a
	ret

.asm_11f04
	scf
	ret

asm_11f06
	ld a, [wc5d2]
	and a
	ret z
	push hl
	ld hl, wc5d2
	dec [hl]
	call Function11f9d
	ld c, [hl]
	pop hl
.asm_11f15
	ld a, [hli]
	cp $ff
	jr z, asm_11ef4
	cp c
	jr z, .asm_11f20
	inc hl
	jr .asm_11f15

.asm_11f20
	ld a, [hl]
	jr asm_11ef0

Dakutens: ; Dummied out
	db "かが", "きぎ", "くぐ", "けげ", "こご"
	db "さざ", "しじ", "すず", "せぜ", "そぞ"
	db "ただ", "ちぢ", "つづ", "てで", "とど"
	db "はば", "ひび", "ふぶ", "へべ", "ほぼ"
	db "カガ", "キギ", "クグ", "ケゲ", "コゴ"
	db "サザ", "シジ", "スズ", "セゼ", "ソゾ"
	db "タダ", "チヂ", "ツヅ", "テデ", "トド"
	db "ハバ", "ヒビ", "フブ", "へべ", "ホボ"
	db $ff

Handakutens: ; Dummied out
	db "はぱ", "ひぴ", "ふぷ", "へぺ", "ほぽ"
	db "ハパ", "ヒピ", "フプ", "へぺ", "ホポ"
	db $ff

Function11f89: ; 11f89 (4:5f89)
	ld hl, wc5d2
	ld a, [hl]
	and a
	ret z
	dec [hl]
	call Function11f9d
	ld [hl], $f2
	inc hl
	ld a, [hl]
	cp $f2
	ret nz
	ld [hl], $eb
	ret

Function11f9d: ; 11f9d (4:5f9d)
	push af
	ld hl, wNamingScreenDestinationPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc5d2]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ret

Function11fad: ; 11fad (4:5fad)
	ld hl, wNamingScreenDestinationPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], $f2
	inc hl
	ld a, [wc5d3]
	dec a
	ld c, a
	ld a, $eb
.asm_11fbd
	ld [hli], a
	dec c
	jr nz, .asm_11fbd
	ld [hl], $50
	ret

Function11fc4: ; 11fc4 (4:5fc4)
	ld hl, wNamingScreenDestinationPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc5d3]
	ld c, a
.asm_11fce
	ld a, [hl]
	cp $eb
	jr z, .asm_11fd7
	cp $f2
	jr nz, .asm_11fd9
.asm_11fd7
	ld [hl], $50
.asm_11fd9
	inc hl
	dec c
	jr nz, .asm_11fce
	ret

Function11fde: ; 11fde (4:5fde)
	ld hl, wc5d5
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $6
	add hl, bc
	ld a, [hl]
	ld hl, $4
	add hl, bc
	add [hl]
	sub $8
	srl a
	srl a
	srl a
	ld e, a
	ld hl, $7
	add hl, bc
	ld a, [hl]
	ld hl, $5
	add hl, bc
	add [hl]
	sub $10
	srl a
	srl a
	srl a
	ld d, a
	hlcoord 0, 0
	ld bc, $14
.asm_12010
	ld a, d
	and a
	jr z, .asm_12018
	add hl, bc
	dec d
	jr .asm_12010

.asm_12018
	add hl, de
	ld a, [hl]
	ld [wc5d7], a
	ret

Function1201e: ; 1201e (4:601e)
	call ClearSprites
	callab ClearAnimatedObjectBuffer
	call Functiond9e
	call LoadFontsExtra
	ld de, NamingScreenGFX_MiddleLine ; $6232
	ld hl, $8eb0
	lb bc, BANK(NamingScreenGFX_MiddleLine), 1
	call Get1bpp
	ld de, NamingScreenGFX_UnderLine ; $623a
	ld hl, $8f20
	lb bc, BANK(NamingScreenGFX_UnderLine), 1
	call Get1bpp
	ld de, $9600
	ld hl, NamingScreenGFX_Border
	ld bc, $10
	ld a, BANK(NamingScreenGFX_Border)
	call FarCopyBytes
	ld de, $87e0
	ld hl, NamingScreenGFX_Cursor
	ld bc, $20
	ld a, BANK(NamingScreenGFX_Cursor)
	call FarCopyBytes
	ld a, $5
	ld hl, wAnimatedObjectDynamicVTileOffsets + 9 * 2
	ld [hli], a
	ld [hl], $7e
	xor a
	ld [hSCY], a
	ld [wGlobalAnimYOffset], a
	ld [hSCX], a
	ld [wGlobalAnimXOffset], a
	ld [wce63], a
	ld [wce64], a
	ld [hBGMapMode], a
	ld [wc5d2], a
	ld a, $7
	ld [hWX], a
	ret

NamingScreenGFX_Border: INCBIN "gfx/namingscreen/border.2bpp"
NamingScreenGFX_Cursor: INCBIN "gfx/namingscreen/cursor.2bpp"

NameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "× ( ) : ; [ ] <PK> <MN>"
	db "UPPER  DEL   END "

BoxNameInputLower:
	db "a b c d e f g h i"
	db "j k l m n o p q r"
	db "s t u v w x y z  "
	db "é 'd 'l 'm 'r 's 't 'v 0"
	db "1 2 3 4 5 6 7 8 9"
	db "UPPER  DEL   END "

NameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "- ? ! / . ,      "
	db "lower  DEL   END "

BoxNameInputUpper:
	db "A B C D E F G H I"
	db "J K L M N O P Q R"
	db "S T U V W X Y Z  "
	db "× ( ) : ; [ ] <PK> <MN>"
	db "- ? ! ♂ ♀ / . , &"
	db "lower  DEL   END "

NamingScreenGFX_ED: INCBIN "gfx/namingscreen/ed.1bpp" ; leftover from gen 1
NamingScreenGFX_MiddleLine: INCBIN "gfx/namingscreen/middleline.1bpp"
NamingScreenGFX_UnderLine: INCBIN "gfx/namingscreen/underline.1bpp"

ComposeMailMessage:
	ld hl, wNamingScreenDestinationPointer
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function12267
	call DelayFrame
.asm_1225b
	call Function1238d
	jr nc, .asm_1225b
	pop af
	ld [hInMenu], a
	pop af
	ld [hMapAnims], a
	ret

Function12267: ; 12267 (4:6267)
	call ClearBGPalettes
	call DisableLCD
	call Function1201e
	ld de, $8000
	ld hl, MailIcon ; $62c1
	ld bc, $80
	ld a, BANK(MailIcon)
	call FarCopyBytes
	xor a
	ld hl, wTileMapEnd
	ld [hli], a
	ld [hl], a
	lb de, $18, $10
	ld a, $0
	call InitAnimatedObjectStruct
	ld hl, $2
	add hl, bc
	ld [hl], $0
	call Function12351
	ld a, $e3
	ld [rLCDC], a
	call Function12341
	ld b, $8
	call GetSGBLayout
	call WaitBGMap
	call WaitTop
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e4
	call DmgToCgbObjPal0
	call Function11fad
	ld hl, wNamingScreenDestinationPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $10
	add hl, de
	ld [hl], $4e
	ret

MailIcon: INCBIN "gfx/namingscreen/mail_icon.2bpp"

Function12341: ; 12341 (4:6341)
	ld a, $21
	ld [wc5d3], a
	ret

	db "メールを かいてね@"

Function12351: ; 12351 (4:6351)
	call WaitTop
	hlcoord 0, 0
	ld bc, $78
	ld a, $60
	call ByteFill
	hlcoord 0, 6
	ld bc, $f0
	ld a, $7f
	call ByteFill
	hlcoord 1, 1
	ld bc, IncGradGBPalTable_13
	call ClearBox
	ld de, MailEntry_Uppercase
Function12376: ; 12376 (4:6376)
	hlcoord 1, 7
	ld b, $6
.asm_1237b
	ld c, $13
.asm_1237d
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_1237d
	push de
	ld de, $15
	add hl, de
	pop de
	dec b
	jr nz, .asm_1237b
	ret

Function1238d: ; 1238d (4:638d)
	call JoyTextDelay
	ld a, [wce63]
	bit 7, a
	jr nz, .asm_123a8
	call Function123d5
	callba AnimatedObjects_PlayFrameAndDelay
	call Function123b8
	call DelayFrame
	and a
	ret

.asm_123a8
	callab ClearAnimatedObjectBuffer
	call ClearSprites
	xor a
	ld [hSCX], a
	ld [hSCY], a
	scf
	ret

Function123b8: ; 123b8 (4:63b8)
	xor a
	ld [hBGMapMode], a
	hlcoord 1, 1
	lb bc, 4, 18
	call ClearBox
	ld hl, wNamingScreenDestinationPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 2, 2
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret

Function123d5: ; 123d5 (4:63d5)
	ld a, [wce63]
	ld e, a
	ld d, $0
	ld hl, .Jumptable ; $63e4
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw Function123e8
	dw Function12407

Function123e8:
	lb de, $48, $10
	ld a, $1b
	call InitAnimatedObjectStruct
	ld a, c
	ld [wc5d5], a
	ld a, b
	ld [wc5d6], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	ld hl, $e
	add hl, bc
	ld [hl], a
	ld hl, wce63
	inc [hl]
	ret

Function12407:
	ld hl, hJoyPressed
	ld a, [hl]
	and $1
	jr nz, .asm_1241f
	ld a, [hl]
	and $2
	jr nz, .asm_1245a
	ld a, [hl]
	and $8
	jr nz, .asm_12447
	ld a, [hl]
	and $4
	jr nz, .asm_12477
	ret

.asm_1241f
	call Function12552
	cp $1
	jr z, .asm_12477
	cp $2
	jr z, .asm_1245a
	cp $3
	jr z, .asm_1246e
	call Function11fde
	call Function12579
	jr c, .asm_12447
	ld hl, wc5d2
	ld a, [hl]
	cp $10
	ret nz
	inc [hl]
	call Function11f9d
	ld [hl], $f2
	dec hl
	ld [hl], $4e
	ret

.asm_12447
	ld hl, wc5d5
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $c
	add hl, bc
	ld [hl], $9
	ld hl, $d
	add hl, bc
	ld [hl], $5
	ret

.asm_1245a
	call Function11f89
	ld hl, wc5d2
	ld a, [hl]
	cp $10
	ret nz
	dec [hl]
	call Function11f9d
	ld [hl], $f2
	inc hl
	ld [hl], $4e
	ret

.asm_1246e
	call Function11fc4
	ld hl, wce63
	set 7, [hl]
	ret

.asm_12477
	ld hl, wce64
	ld a, [hl]
	xor $1
	ld [hl], a
	jr nz, .asm_12487
	ld de, MailEntry_Uppercase ; $65b6
	call Function12376
	ret

.asm_12487
	ld de, MailEntry_Lowercase ; $6628
	call Function12376
	ret

Function1248e:
	call Function124d9
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld e, a
	swap e
	ld hl, $7
	add hl, bc
	ld [hl], e
	cp $5
	ld de, .LetterEntries
	ld a, $0
	jr nz, .asm_124ac
	ld de, .CaseDelEnd
	ld a, $1
.asm_124ac
	ld hl, $e
	add hl, bc
	add [hl]
	ld hl, $1
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.LetterEntries:
	db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90

.CaseDelEnd:
	db $00, $00, $00, $30, $30, $30, $60, $60, $60, $60

Function124d9: ; 124d9 (4:64d9)
	ld hl, hJoyLast
	ld a, [hl]
	and $40
	jr nz, .asm_12545
	ld a, [hl]
	and $80
	jr nz, .asm_12537
	ld a, [hl]
	and $20
	jr nz, .asm_12513
	ld a, [hl]
	and $10
	jr nz, .asm_124f1
	ret

.asm_124f1
	call Function12558
	and a
	jr nz, .asm_12505
	ld hl, $c
.asm_124f9
	add hl, bc
	ld a, [hl]
	cp $9
	jr nc, .asm_12502
	inc [hl]
	ret

.asm_12502
	ld [hl], $0
.asm_12504
	ret

.asm_12505
	cp $3
	jr nz, .asm_1250a
	xor a
.asm_1250a
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
	ret

.asm_12513
	call Function12558
	and a
	jr nz, .asm_12526
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_12523
	dec [hl]
	ret

.asm_12523
	ld [hl], $9
	ret

.asm_12526
	cp $1
	jr nz, .asm_1252c
	ld a, $4
.asm_1252c
	dec a
	dec a
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
.asm_12536
	ret

.asm_12537
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $5
	jr nc, .asm_12542
	inc [hl]
	ret

.asm_12542
	ld [hl], $0
	ret

.asm_12545
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_1254f
	dec [hl]
	ret

.asm_1254f
	ld [hl], $5
	ret

Function12552: ; 12552 (4:6552)
	ld hl, wc5d5
	ld c, [hl]
	inc hl
	ld b, [hl]
Function12558: ; 12558 (4:6558)
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $5
	jr nz, .asm_12577
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $3
	jr c, .asm_12571
	cp $6
	jr c, .asm_12574
	ld a, $3
	ret

.asm_12571
	ld a, $1
	ret

.asm_12574
	ld a, $2
	ret

.asm_12577
	xor a
	ret

Function12579: ; 12579 (4:6579)
	ld a, [wc5d7]
	ld hl, $5f23
	cp $e5
	jr z, .asm_1258b
	ld hl, $5f74
	cp $e4
	jp nz, Function11ee4
.asm_1258b
	ld a, [wc5d2]
	and a
	ret z
	cp $11
	jr nz, .asm_1259c
	push hl
	ld hl, wc5d2
	dec [hl]
	dec [hl]
	jr .asm_125a1

.asm_1259c
	push hl
	ld hl, wc5d2
	dec [hl]
.asm_125a1
	call Function11f9d
	ld c, [hl]
	pop hl
.asm_125a6
	ld a, [hli]
	cp $ff
	jp z, asm_11ef4
	cp c
	jr z, .asm_125b2
	inc hl
	jr .asm_125a6

.asm_125b2
	ld a, [hl]
	jp asm_11ef0

MailEntry_Uppercase:
	db "A B C D E F G H I J"
	db "K L M N O P Q R S T"
	db "U V W X Y Z   , ? !"
	db "1 2 3 4 5 6 7 8 9 0"
	db "<PK> <MN> <PO> <KE> é ♂ ♀ ¥ … ×"
	db "lower  DEL   END   "

MailEntry_Lowercase:
	db "a b c d e f g h i j"
	db "k l m n o p q r s t"
	db "u v w x y z   . - /"
	db "'d 'l 'm 'r 's 't 'v & ( )"
	db "<``> <''> [ ] ' : ;      "
	db "UPPER  DEL   END   "
