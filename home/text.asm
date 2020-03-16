TEXTBOX_PAL EQU 7

ClearBox:: ; ebd (0:0ebd)
	ld a, " "
FillBoxWithByte::
	ld de, SCREEN_WIDTH
.row
	push hl
	push bc
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop bc
	pop hl
	add hl, de
	dec b
	jr nz, .row
	ret

ClearTilemap::
	ld hl, wTileMap
	ld a, " "
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ld a, [rLCDC]
	bit 7, a
	ret z
	jp WaitBGMap

FillScreenWithTextboxPal::
	ld a, TEXTBOX_PAL
	hlcoord 0, 0, wAttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	jr ClearTilemap

Textbox:: ; eef (0:0eef)
	push bc
	push hl
	call TextboxBorder
	pop hl
	pop bc
	jr TextboxPalette

TextboxBorder:: ; ef8 (0:0ef8)
	push hl
	ld a, "┌"
	ld [hli], a
	inc a
	call TextboxBorder_PlaceTiles
	inc a
	ld [hl], a
	pop hl

	; Middle
	ld de, SCREEN_WIDTH
	add hl, de
.row
	push hl
	ld a, "│"
	ld [hli], a
	ld a, " "
	call TextboxBorder_PlaceTiles
	ld [hl], "│"
	pop hl

	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .row

	; Bottom
	ld a, "└"
	ld [hli], a
	ld a, "─"
	call TextboxBorder_PlaceTiles
	ld [hl], "┘"
	ret

TextboxBorder_PlaceTiles:: ; f25 (0:0f25)
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret

TextboxPalette::
	ld de, wAttrMap - wTileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	ld a, TEXTBOX_PAL
.col
	push bc
	push hl
.row
	ld [hli], a
	dec c
	jr nz, .row
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .col
	ret

SpeechTextbox:: ; f45 (0:0f45)
	hlcoord TEXTBOX_X, TEXTBOX_Y
	ld b, TEXTBOX_INNERH
	ld c, TEXTBOX_INNERW
	jp Textbox

TestText::
	text "ゲームフりーク!"
	done

RadioTerminator:: ; 1052
	ld hl, .stop
	ret

.stop	db "@"

PrintText::
	call SetUpTextbox
PrintTextboxText::
	bccoord TEXTBOX_INNERX, TEXTBOX_INNERY
	call PlaceHLTextAtBC
	ret

SetUpTextbox:: ; f68 (0:0f68)
	push hl
	call SpeechTextbox
	call UpdateSprites
	call ApplyTilemap
	pop hl
	ret

PlaceString:: ; f74 (0:0f74)
	push hl

PlaceNextChar:: ; f75 (0:0f75)
	ld a, [de]
	cp "@"
	jr nz, CheckDict
	ld b, h
	ld c, l
	pop hl
	ret

	pop de
NextChar:: ; f7f (0:0f7f)
	inc de
	jp PlaceNextChar

CheckDict
dict: macro
if \1 == 0
	and a
else
	cp \1
endc
	jp z, \2
endm

dict2: macro
	cp \1
	jr nz, ._\@
	ld a, \2
._\@:
endm

	dict "<LINE>", LineChar
	dict "<NEXT>", NextLineChar
	dict $00, NullChar
	dict $4c, Char4C
	dict $4b, Char4B
	dict "<PARA>", Paragraph
	dict "<MOM>", PrintMomsName
	dict "<PLAYER>", PrintPlayerName
	dict "<RIVAL>", PrintRivalName
	dict $35, Char35
	dict $36, Char36
	dict $37, Char37
	dict "<RED>", PrintRedsName
	dict "<GREEN>", PrintGreensName
	dict "#", PlacePOKe
	dict "<PC>", PCChar
	dict "<ROCKET>", RocketChar
	dict "<TM>", TMChar
	dict "<TRNER>", TrainerChar
	dict $23, PlaceKougeki
	dict "<LNBRK>", HalfLineChar
	dict "<CONT>", ContText
	dict "<……>", SixDotsChar
	dict "<DONE>", DoneText
	dict "<PROMPT>", PromptText
	dict "<PKMN>", PlacePKMN
	dict "<POKE>", PlacePOKE
	dict $25, NextChar
	dict2 $1f, " "
	dict "<DEXEND>", PlaceDexEnd
	dict "<TARGET>", PlaceMoveTargetsName
	dict "<USER>", PlaceMoveUsersName
	dict "<ENEMY>", PlaceEnemysName

	cp $e4
	jr z, .diacritic
	cp $e5
	jr nz, .not_diacritic
.diacritic
	ld b, a
	call Diacritic
	jp NextChar

.not_diacritic
	cp $60
	jr nc, .place
	cp $40
	jr nc, .handakuten
	cp $20
	jr nc, .daku1
	add $80
	jr .daku2

.daku1
	add $90
.daku2
	ld b, $e5
	call Diacritic
	jr .place

.handakuten
	cp $44
	jr nc, .han1
	add $59
	jr .han2

.han1
	add $86
.han2
	ld b, $e4
	call Diacritic
.place
	ld [hli], a
	call Function31e2
	jp NextChar

print_name: macro
	push de
	ld de, \1
	jp PlaceCommandCharacter
endm

PrintMomsName::   print_name wMomsName ; 1066 (0:1066)
PrintPlayerName:: print_name wPlayerName ; 106d (0:106d)
PrintRivalName::  print_name wRivalName ; 1074 (0:1074)
PrintRedsName::   print_name wRedsName ; 107b (0:107b)
PrintGreensName:: print_name wGreensName ; 1082 (0:1082)

TrainerChar::  print_name TrainerCharText ; 1089 (0:1089)
TMChar::       print_name TMCharText ; 1090 (0:1090)
PCChar::       print_name PCCharText ; 1097 (0:1097)
RocketChar::   print_name RocketCharText ; 109e (0:109e)
PlacePOKe::    print_name POKeCharText ; 10a5 (0:10a5)
PlaceKougeki:: print_name KougekiText ; 10ac (0:10ac)
SixDotsChar::  print_name SixDotsCharText ; 10b3 (0:10b3)
PlacePKMN::    print_name PKMNText ; 10ba (0:10ba)
PlacePOKE::    print_name POKEText ; 10c1 (0:10c1)
Char35::       print_name Char35Text ; 10c8 (0:10c8)
Char36::       print_name Char36Text ; 10cf (0:10cf)
Char37::       print_name Char37Text ; 10d6 (0:10d6)

PlaceMoveTargetsName:: ; 10dd (0:10dd)
	ld a, [hBattleTurn]
	xor $1
	jr PlaceMonsName

PlaceMoveUsersName:: ; 10e3 (0:10e3)
	ld a, [hBattleTurn]
PlaceMonsName::
	push de
	and a
	jr nz, .enemy
	ld de, wBattleMonNick
	jr PlaceCommandCharacter

.enemy
	ld de, EnemyText
	call PlaceString
	ld h, b
	ld l, c
	ld de, wEnemyMonNick
	jr PlaceCommandCharacter

PlaceEnemysName:: ; 10fb (0:10fb)
	push de
	ld a, [wLinkMode]
	and a
	jr nz, .linkbattle
	ld a, [wTrainerClass]
	cp RIVAL1
	jr z, .rival
	cp RIVAL2
	jr z, .rival
	ld de, wOTClassName
	call PlaceString
	ld h, b
	ld l, c
	ld de, String116a
	call PlaceString

	push bc
	callfar Battle_GetTrainerName
	pop hl

	ld de, wStringBuffer1
	jr PlaceCommandCharacter

.rival
	ld de, wRivalName
	jr PlaceCommandCharacter

.linkbattle
	ld de, wOTClassName
	jr PlaceCommandCharacter

PlaceCommandCharacter:: ; 1132 (0:1132)
	call PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar

TMCharText:: ; 113b (0:113b)
	db "TM@"

TrainerCharText:: ; 113e (0:113e)
	db "TRAINER@"

PCCharText:: ; 1146 (0:1146)
	db "PC@"

RocketCharText:: ; 1149 (0:1149)
	db "ROCKET@"

POKeCharText:: ; 1150 (0:1150)
	db "POKé@"

KougekiText:: ; 1155 (0:1155)
	db "こうげき@"

SixDotsCharText:: ; 115a (0:115a)
	db "……@"

EnemyText:: ; 115d (0:115d)
	db "Enemy @"

PKMNText:: ; 1164 (0:1164)
	db "<PK><MN>@"

POKEText:: ; 1167 (0:1167)
	db "<PO><KE>@"

String116a:: ; 116a (0:116a)
	db " @"

Char35Text:: ; 116c (0:116c)
Char36Text:: ; 116c (0:116c)
Char37Text:: ; 116c (0:116c)
	db "@"

NextLineChar:: ; 116d (0:116d)
	pop hl
	ld bc, SCREEN_WIDTH * 2
	add hl, bc
	push hl
	jp NextChar

HalfLineChar:: ; 1176 (0:1176)
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	push hl
	jp NextChar

LineChar:: ; 117f (0:117f)
	pop hl
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	push hl
	jp NextChar

Paragraph:: ; 1187 (0:1187)
	push de
	ld a, [wLinkMode]
	cp $3
	jr z, .asm_1192
	call LoadBlinkingCursor
.asm_1192
	call Text_WaitBGMap
	call ButtonSound
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	lb bc, TEXTBOX_INNERH - 1, TEXTBOX_INNERW
	call ClearBox
	call UnloadBlinkingCursor
	ld c, 20
	call DelayFrames
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY
	pop de
	jp NextChar

Char4B:: ; 11b0 (0:11b0)
	ld a, [wLinkMode]
	or a
	jr nz, .link_battle
	call LoadBlinkingCursor
.link_battle
	call Text_WaitBGMap
	push de
	call ButtonSound
	pop de
	ld a, [wLinkMode]
	or a
	call z, UnloadBlinkingCursor
Char4C:: ; 11c8 (0:11c8)
	push de
	call TextScroll
	call TextScroll
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	pop de
	jp NextChar

ContText:: ; 11d6 (0:11d6)
	push de
	ld de, .cont
	ld b, h
	ld c, l
	call PlaceString
	ld h, b
	ld l, c
	pop de
	jp NextChar

.cont	db $4b, "@"

PlaceDexEnd:: ; 11e7 (0:11e7)
	ld [hl], "."
	pop hl
	ret

PromptText:: ; 11eb (0:11eb)
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jr z, .ok
	call LoadBlinkingCursor

.ok
	call Text_WaitBGMap
	call ButtonSound
	ld a, [wLinkMode]
	cp $3
	jr z, DoneText
	call UnloadBlinkingCursor

DoneText:: ; 1205 (0:1205)
	pop hl
	ld de, .stop
	dec de
	ret

.stop db "@"

NullChar:: ; 120c (0:120c)
	ld b, h
	ld c, l
	pop hl
	ld de, .ErrorText
	dec de
	ret

.ErrorText
	text_decimal hObjectStructIndexBuffer, 1, 2
	text "エラー"
	done

TextScroll:: ; 121d (0:121d)
	hlcoord TEXTBOX_X, TEXTBOX_INNERY
	decoord TEXTBOX_X, TEXTBOX_INNERY - 1
	ld bc, 3 * SCREEN_WIDTH
	call CopyBytes
	hlcoord TEXTBOX_INNERX, TEXTBOX_INNERY + 2
	ld a, " "
	ld bc, TEXTBOX_INNERW
	call ByteFill
	ld c, 5
	call DelayFrames
	ret

Text_WaitBGMap:: ; 123a (0:123a)
	push bc
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call WaitBGMap
	pop af
	ld [hOAMUpdate], a
	pop bc
	ret

Diacritic:: ; 124a (0:124a)
	push af
	push hl
	ld a, b
	ld bc, -SCREEN_WIDTH
	add hl, bc
	ld [hl], a
	pop hl
	pop af
	ret

LoadBlinkingCursor:: ; 1255 (0:1255)
	ld a, "▼"
	ldcoord_a 18, 17
	ret

UnloadBlinkingCursor:: ; 125b (0:125b)
	ld a, "─"
	ldcoord_a 18, 17
	ret

FarString::
	ld b, a
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch
	call PlaceString
	pop af
	rst Bankswitch
	ret

PokeFluteTerminatorCharacter::
	ld hl, .stop
	ret

.stop	db "@"

PlaceHLTextAtBC:: ; 1272 (0:1272)
	ld a, [wTextboxFlags]
	push af
	set 1, a
	ld [wTextboxFlags], a

	call DoTextUntilTerminator

	pop af
	ld [wTextboxFlags], a
	ret

DoTextUntilTerminator:: ; 1283 (0:1283)
	ld a, [hli]
	cp "@"
	ret z
	call TextCommand
	jr DoTextUntilTerminator

TextCommand:: ; 128c (0:128c)
	push hl
	push bc
	ld c, a
	ld b, $0
	ld hl, TextCommands
	add hl, bc
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop bc
	pop hl
	push de
	ret

TextCommands:: ; 129d (0:129d)
	dw Text_TX
	dw Text_TX_RAM
	dw Text_TX_BCD
	dw Text_TX_MOVE
	dw Text_TX_BOX
	dw Text_TX_LOW
	dw Text_WAIT_BUTTON
	dw Text_TX_SCROLL
	dw Text_TX_ASM
	dw Text_TX_NUM
	dw Text_TX_EXIT
	dw Text_TX_SFX
	dw Text_TX_DOTS
	dw Text_TX_0D
	dw Text_TX_SFX
	dw Text_TX_SFX
	dw Text_TX_SFX
	dw Text_TX_SFX
	dw Text_TX_SFX
	dw Text_TX_SFX
	dw Text_TX_BUFFER
	dw Text_TX_DAY
	dw Text_TX_FAR

Text_TX:: ; 12cb (0:12cb)
	ld d, h
	ld e, l
	ld h, b
	ld l, c
	call PlaceString
	ld h, d
	ld l, e
	inc hl
	ret

Text_TX_RAM:: ; 12d6 (0:12d6)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c
	call PlaceString
	pop hl
	ret

Text_TX_FAR:: ; 12e2 (0:12e2)
	ld a, [hROMBank]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [hROMBank], a
	ld [MBC3RomBank], a
	push hl
	ld h, d
	ld l, e
	call DoTextUntilTerminator
	pop hl
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret

Text_TX_BCD:: ; 12fd (0:12fd)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, b
	ld l, c
	ld c, a
	call PrintBCDNumber
	ld b, h
	ld c, l
	pop hl
	ret

Text_TX_MOVE:: ; 130d (0:130d)
	ld a, [hli]
	ld [wcfd6], a
	ld c, a
	ld a, [hli]
	ld [wcfd7], a
	ld b, a
	ret

Text_TX_BOX:: ; 1318 (0:1318)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld h, d
	ld l, e
	call Textbox
	pop hl
	ret

Text_TX_LOW:: ; 1328 (0:1328)
	bccoord 1, 16
	ret

Text_WAIT_BUTTON:: ; 132c (0:132c)
	ld a, [wLinkMode]
	cp LINK_COLOSSEUM
	jp z, Text_TX_0D

	push hl
	call LoadBlinkingCursor
	push bc
	call ButtonSound
	pop bc
	call UnloadBlinkingCursor
	pop hl
	ret

Text_TX_SCROLL:: ; 1342 (0:1342)
	push hl
	call UnloadBlinkingCursor
	call TextScroll
	call TextScroll
	pop hl
	bccoord 1, 16
	ret

Text_TX_ASM:: ; 1351 (0:1351)
	jp hl

Text_TX_NUM:: ; 1352 (0:1352)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	push hl
	ld h, b
	ld l, c
	ld b, a
	and $f
	ld c, a
	ld a, b
	and $f0
	swap a
	set 6, a
	ld b, a
	call PrintNum
	ld b, h
	ld c, l
	pop hl
	ret

Text_TX_EXIT:: ; 136d (0:136d)
	push hl
	push bc
	call GetJoypad
	ld a, [hJoyDown]
	and A_BUTTON | B_BUTTON
	jr nz, .skip
	ld c, 30
	call DelayFrames
.skip
	pop bc
	pop hl
	ret

Text_TX_SFX:: ; 1380 (0:1380)
	push bc
	dec hl
	ld a, [hli]
	ld b, a
	push hl
	ld hl, TextSFX
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp b
	jr z, .sound
	inc hl
	inc hl
	jr .loop

.sound
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call PlaySFX
	call WaitSFX
	pop de
.done
	pop hl
	pop bc
	ret

Text_TX_CRY
	push de
	ld e, [hl]
	inc hl
	ld d, [hl]
	call PlayMonCry
	pop de
	pop hl
	pop bc
	ret

TextSFX::
	dbw TX_SOUND_DEX_FANFARE_50_79,  SFX_DEX_FANFARE_50_79
	dbw TX_SOUND_FANFARE,            SFX_FANFARE
	dbw TX_SOUND_DEX_FANFARE_20_49,  SFX_DEX_FANFARE_20_49
	dbw TX_SOUND_ITEM,               SFX_ITEM
	dbw TX_SOUND_CAUGHT_MON,         SFX_CAUGHT_MON
	dbw TX_SOUND_DEX_FANFARE_80_109, SFX_DEX_FANFARE_80_109
	dbw TX_SOUND_SLOT_MACHINE_START, SFX_SLOT_MACHINE_START
	db -1

Text_TX_DOTS:: ; 13c3 (0:13c3)
	ld a, [hli]
	ld d, a
	push hl
	ld h, b
	ld l, c
.loop
	push de
	ld a, "…"
	ld [hli], a
	call GetJoypad
	ld a, [hJoyDown]
	and A_BUTTON | B_BUTTON
	jr nz, .next
	ld c, 10
	call DelayFrames
.next
	pop de
	dec d
	jr nz, .loop
	ld b, h
	ld c, l
	pop hl
	ret

Text_TX_0D:: ; 13e2 (0:13e2)
	push hl
	push bc
	call ButtonSound
	pop bc
	pop hl
	ret

Text_TX_BUFFER:: ; 13ea (0:13ea)
	ld a, [hli]
	push hl
	ld e, a
	ld d, $0
	ld hl, StringBufferPointers
	add hl, de
	add hl, de
	ld a, BANK(StringBufferPointers)
	call GetFarHalfword
	ld d, h
	ld e, l
	ld h, b
	ld l, c
	call PlaceString
	pop hl
	ret

Text_TX_DAY:: ; 1402 (0:1402)
	call GetWeekday
	push hl
	push bc
	ld c, a
	ld b, $0
	ld hl, .Days
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	call PlaceString
	pop hl
	ret

.Days: ; 1422 (0:1422)
	dw .Sun
	dw .Mon
	dw .Tues
	dw .Wednes
	dw .Thurs
	dw .Fri
	dw .Satur

.Sun:    db "SUN@"
.Mon:    db "MON@"
.Tues:   db "TUES@"
.Wednes: db "WEDNES@"
.Thurs:  db "THURS@"
.Fri:    db "FRI@"
.Satur:  db "SATUR@"
.Day:    db "DAY@"
