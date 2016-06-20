INCLUDE "includes.asm"

SECTION "bank1", ROMX, BANK[$1]
PlaceWaitingText:: ; 4000 (1:4000)
	hlcoord 3, 10
	ld b, $1
	ld c, $b
	ld a, [wBattleMode]
	and a
	jr z, .asm_4012
	call TextBox
	jr .asm_4017
.asm_4012
	predef Predef_LinkTextbox
.asm_4017
	hlcoord 4, 11
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames

.Waiting:
	db "Waiting...!@"

Predef1:
	ret

LoadPushOAM:: ; 4032 (1:4032)
	ld c, hPushOAM - $ff00
	ld b, PushOAMEnd - PushOAM
	ld hl, PushOAM
.asm_4039
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_4039
	ret

PushOAM:
	ld a, wOAMBuffer / $100
	ld [rDMA], a
	ld a, $28
.asm_4046
	dec a
	jr nz, .asm_4046
	ret
PushOAMEnd

INCLUDE "engine/map_objects.asm"
INCLUDE "engine/main_menu.asm"
INCLUDE "engine/title.asm"

ReanchorBGMap_NoOAMUpdate:: ; 6551 (1:6551)
	call DelayFrame
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	call Function656b
	pop af
	ld [hBGMapMode], a
	pop af
	ld [hOAMUpdate], a
	ret

Function656b: ; 656b (1:656b)
	xor a
	ld [hLCDCPointer], a
	ld [hBGMapMode], a
	ld hl, wd565
	set 7, [hl]
	res 2, [hl]
	ld a, $90
	ld [hWY], a
	call OverworldTextModeSwitch
	ld a, $9c
	call .LoadBGMapAddrIntoHRAM
	call _OpenAndCloseMenu_HDMATransferTileMapAndAttrMap
	xor a
	ld [hBGMapMode], a
	ld [hWY], a
	ld a, $98
	call .LoadBGMapAddrIntoHRAM
	call .WaitTransfer
	xor a
	ld [wd05b], a
	ld a, $98
	ld [wd05c], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	call ApplyBGMapAnchorToObjects
	ret

.LoadBGMapAddrIntoHRAM: ; 65a5 (1:65a5)
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ret

.WaitTransfer: ; 65ab (1:65ab)
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	ld a, $3
	ld [hFF9E], a
.asm_65bc
	call DelayFrame
	ld a, [hFF9E]
	and a
	jr nz, .asm_65bc
	pop af
	ld [hOAMUpdate], a
	pop af
	ld [hBGMapMode], a
	ret

LoadFonts_NoOAMUpdate:: ; 65cb (1:65cb)
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call .LoadGFX
	pop af
	ld [hOAMUpdate], a
	ret

.LoadGFX: ; 65d9 (1:65d9)
	call LoadFontsExtra
	ld a, $90
	ld [hWY], a
	call SafeUpdateSprites
	call Functiond9e
	ret

INCLUDE "engine/learn.asm"

CheckNickErrors:: ; 677e (1:677e)
	push bc
	push de
	ld b, PKMN_NAME_LENGTH
.checkchar
	ld a, [de]
	cp "@"
	jr z, .done
	ld hl, .textcommands
	dec hl
.loop
	inc hl
	ld a, [hl]
	cp $ff
	jr z, .next
	ld a, [de]
	cp [hl]
	inc hl
	jr c, .loop
	cp [hl]
	jr nc, .loop
	ld a, "?"
	ld [de], a
	jr .loop
.next
	inc de
	dec b
	jr nz, .checkchar
	pop de
	push de
	ld a, "?"
	ld [de], a
	inc de
	ld a, "@"
	ld [de], a
.done
	pop de
	pop bc
	ret

.textcommands
; table defining which characters are actually text commands
; format:
	;      ≥           <
	db "<START>",  $04       + 1
	db "<PLAY_G>", $18       + 1
	db $1d,        "%"       + 1
	db $35,        "<GREEN>" + 1
	db "<ENEMY>",  "<ENEMY>" + 1
	db $49,        "<TM>"    + 1
	db "<ROCKET>", "┘"       + 1
	db -1 ; end

INCLUDE "engine/math.asm"
ItemAttributes:
INCLUDE "items/item_attributes.asm"
INCLUDE "engine/npc_movement.asm"
INCLUDE "event/happiness_egg.asm"
INCLUDE "event/special.asm"

SECTION "bank2", ROMX, BANK[$2]
SwapTextboxPalettes::
	dr $8000, $804f
ScrollBGMapPalettes::
	dr $804f, $861a
SpawnPlayer:
	dr $861a, $8653
CopyDECoordsToMapObject:
	dr $8653, $86d7
CopyObjectStruct_::
	dr $86d7, $8876
CopyTempObjectToObjectStruct:
	dr $8876, $8a7a
QueueFollowerFirstStep:
	dr $8a7a, $8ac9
Sine_e::
	dr $8ac9, $8b3b

INCLUDE "engine/predef.asm"

Function8c2d:
	dr $8c2d, $91e5
ApplyMonOrTrainerPals:
	dr $91e5, $9cfd
InitCGBPals:: ; 9cfd
	dr $9cfd, $bc3a

SECTION "bank3", ROMX, BANK[$3]
CheckTime::
	ld a, [wTimeOfDay]
	ld hl, TimeOfDayTable
	ld de, $2
	call IsInArray
	inc hl
	ld c, [hl]
	ret c
	xor a
	ld c, a
	ret

TimeOfDayTable: ; c012
	db MORN, 1 << MORN
	db DAY,  1 << DAY
	db NITE, 1 << NITE
	db NITE, 1 << NITE
	db -1

INCLUDE "engine/engine_flags.asm"
INCLUDE "engine/variables.asm"
INCLUDE "engine/specials.asm"

ComputeHPBarPixels:
IF DEF(GOLD)
	dr $c6de, $d1e2
ReceiveItem_::
	dr $d1e2, $d21a
TossItem_::
	dr $d21a, $d251
CheckItem_::
	dr $d251, $d414
GetTMHMNumber::
	dr $d414, $d434
CheckTossableItem_::
	dr $d434, $e03f
RemoveMonFromPartyOrBox:
	dr $e03f, $e513
CheckCurPartyMonFainted:
	dr $e513, $e7a6
DoItemEffect_::
	dr $e7a6, $fa3e
ENDC

IF DEF(SILVER)
	dr $c6dc, $d1e0
ReceiveItem_::
	dr $d1e0, $d218
TossItem_::
	dr $d218, $d24f
CheckItem_::
	dr $d24f, $d412
GetTMHMNumber::
	dr $d412, $d432
CheckTossableItem_::
	dr $d432, $e03d
RemoveMonFromPartyOrBox:
	dr $e03d, $e511
CheckCurPartyMonFainted:
	dr $e511, $e7a4
DoItemEffect_::
	dr $e7a4, $fa3c
ENDC

SECTION "bank4", ROMX, BANK[$4]
Function10000::
	dr $10000, $117f1
InitializeStartDay_:
	dr $117f1, $11934
Function11934:
	dr $11934, $11aa3
NamingScreen_:
	dr $11aa3, $11aad
NamingScreen:
	dr $11aad, $13e03

SECTION "bank5", ROMX, BANK[$5]
	dr $14000, $14032
Function14032:: ; 14032
	dr $14032, $14089
StartClock:: ; 14089
	dr $14089, $140dc
ClockContinue: ; 140dc
	dr $140dc, $140ff
Function140ff:: ; 140ff
	dr $140ff, $1413c
Function1413c:: ; 1413c
	dr $1413c, $1414b
RefreshSprites:: ; 1414b
	dr $1414b, $1415c
Function1415c:: ; 1415c
	dr $1415c, $1416d
Function1416d:: ; 1416d
	dr $1416d, $14317
DoesSpriteHaveFacings_:: ; 14317
	dr $14317, $14334
GetSpritePalette_:: ; 14334
	dr $14334, $14a18
Function14a18:: ; 14a18
	dr $14a18, $14a2d
Function14a2d:: ; 14a2d
	dr $14a2d, $14a44
Function14a44: ; 14a44
	dr $14a44, $14ef5
TryLoadSaveFile: ; 14ef5
	dr $14ef5, $15484
RunMapSetupScript::
	dr $15484, $15612
Function15612:: ; 15612
	dr $15612, $171d1
Function171d1:
	dr $171d1, $1783e

SECTION "bank6", ROMX, BANK[$6]
	dr $18000, $1bdbc

SECTION "bank7", ROMX, BANK[$7]
LoadMapGroupRoof::
	dr $1c000, $1ffbd

SECTION "bank8", ROMX, BANK[$8]
	dr $20000, $24000

SECTION "bank9", ROMX, BANK[$9]
StringBufferPointers::
	dr $24000, $2400e
_2DMenu_::
	dr $2400e, $24136
StaticMenuJoypad_::
	dr $24136, $24139
ScrollingMenuJoypad_::
	dr $24139, $242a0
PushWindow_::
	dr $242a0, $24307
ExitMenu_::
	dr $24307, $24395
InitVerticalMenuCursor_::
	dr $24395, $244d7
InitScrollingMenu::
	dr $244d7, $244f3
ScrollingMenu_::
	dr $244f3, $2692d
InitDecorations: ; 2692d
	dr $2692d, $28000

SECTION "banka", ROMX, BANK[$a]
	dr $28000, $29dff
Function29dff:
	dr $29dff, $2a4bf
MysteryGift_CopyReceivedDecosToPC:
	dr $2a4bf, $2a8e0
JumpRoamMons:
	dr $2a8e0, $2c000

SECTION "bankb", ROMX, BANK[$b]
	dr $2c000, $30000

SECTION "bankc", ROMX, BANK[$c]
	dr $30000, $34000

SECTION "bankd", ROMX, BANK[$d]
	dr $34000, $38000

SECTION "banke", ROMX, BANK[$e]
	dr $38000, $398f2

Battle_GetTrainerName:: ; 398f2
	dr $398f2, $3c000

SECTION "bankf", ROMX, BANK[$f]
	dr $3c000, $3dda9

UpdatePlayerHUD::
	dr $3dda9, $3de97

UpdateEnemyHUD::
	dr $3de97, $3ec11
BattleRandom_:: ; 3ec11
	dr $3ec11, $40000

SECTION "bank10", ROMX, BANK[$10]
	dr $40000, $41afe
Moves::
	dr $41afe, $44000

SECTION "bank11", ROMX, BANK[$11]
	dr $44000, $44870
DeletePartyMonMail:
	dr $44870, $48000

SECTION "bank12", ROMX, BANK[$12]
	dr $48000, $4c000

SECTION "bank13", ROMX, BANK[$13]
	dr $4c000, $50000

SECTION "bank14", ROMX, BANK[$14]
Function50000:
	dr $50000, $51b0b
BaseData:: ; 51b0b
	dr $51b0b, $53a83
UnknownEggPic:: ; 53a83
	dr $53a83, $54000

SECTION "bank15", ROMX, BANK[$15]
	dr $54000, $58000

SECTION "bank16", ROMX, BANK[$16]
	dr $58000, $5c000

SECTION "bank17", ROMX, BANK[$17]
	dr $5c000, $60000

SECTION "bank18", ROMX, BANK[$18]
	dr $60000, $64000

SECTION "bank19", ROMX, BANK[$19]
	dr $64000, $68000

SECTION "bank1a", ROMX, BANK[$1a]
	dr $68000, $6c000

SECTION "bank1b", ROMX, BANK[$1b]
	dr $6c000, $70000

SECTION "bank1c", ROMX, BANK[$1c]
	dr $70000, $74000

SECTION "bank1d", ROMX, BANK[$1d]
	dr $74000, $78000

SECTION "bank1e", ROMX, BANK[$1e]
	dr $78000, $7c000

SECTION "bank1f", ROMX, BANK[$1f]
	dr $7c000, $80000

SECTION "bank20", ROMX, BANK[$20]
	dr $80000, $84000

SECTION "bank21", ROMX, BANK[$21]
	dr $84000, $842db

PrinterReceive_:: ; 842db
	dr $842db, $88000

SECTION "bank22", ROMX, BANK[$22]
	dr $88000, $8c000

SECTION "bank23", ROMX, BANK[$23]
	dr $8c000, $8c17a

ResetClock_:
	dr $8c17a, $8c310

DeleteSaveData_:
	dr $8c310, $8c356

UpdateTimeOfDayPal:: ; 8c356
	dr $8c356, $8c366

_TimeOfDayPals:: ; 8c366
	dr $8c366, $8c397

_UpdateTimePals:: ; 8c397
	dr $8c397, $8c3a0

FadeInPalettes:: ; 8c3a0
	dr $8c3a0, $8c3ab

Function8c3ab:: ; 8c3ab
	dr $8c3ab, $8c3e9

Function8c3e9:: ; 8c3e9
	dr $8c3e9, $8d174

ClearAnimatedObjectBuffer:
	dr $8d174, $8d18a

AnimatedObjects_PlayFrame:
	dr $8d18a, $8d1f7

InitAnimatedObjectStruct_:: ; 8d1f7
	dr $8d1f7, $8d332

ReinitAnimatedObjectFrame_:: ; 8d332
	dr $8d332, $90000

SECTION "bank24", ROMX, BANK[$24]
	dr $90000, $90641
InitClock:
	dr $90641, $90b0f
PrintHour:
	dr $90b0f, $94000

SECTION "bank25", ROMX, BANK[$25]
MapTriggers:: ; 94000
	dr $94000, $940ed

MapGroupPointers::
	dr $940ed, $965f9

OverworldLoop::
	dr $965f9, $96b89

EnableScriptMode:: ; 96b89
	dr $96b89, $96b91

ScriptEvents:: ; 96b91
	dr $96b91, $97365

CallCallback:: ; 97365
	dr $97365, $97c2a

Function97c2a:: ; 97c2a
	dr $97c2a, $98000

SECTION "bank26", ROMX, BANK[$26]
IF DEF(GOLD)
TitleScreenGFX1:
	dr $98000, $98476
TitleScreenGFX2:
	dr $98476, $98616
GSIntroTilemap:
	dr $98616, $9c000
ENDC

IF DEF(SILVER)
TitleScreenGFX1:
	dr $98000, $98498
TitleScreenGFX2:
	dr $98498, $9862a
GSIntroTilemap:
	dr $9862a, $9c000
ENDC

SECTION "bank27", ROMX, BANK[$27]
	dr $9c000, $a0000

SECTION "bank28", ROMX, BANK[$28]
	dr $a0000, $a4000

SECTION "bank29", ROMX, BANK[$29]
	dr $a4000, $a8000

SECTION "bank2a", ROMX, BANK[$2a]
	dr $a8000, $ac000

SECTION "bank2b", ROMX, BANK[$2b]
	dr $ac000, $b0000

SECTION "bank2c", ROMX, BANK[$2c]
	dr $b0000, $b4000

SECTION "bank2d", ROMX, BANK[$2d]
	dr $b4000, $b8000

SECTION "bank2e", ROMX, BANK[$2e]
	dr $b8000, $bc000

SECTION "bank2f", ROMX, BANK[$2f]
	dr $bc000, $c0000

SECTION "bank30", ROMX, BANK[$30]
PlayerIcon:
	dr $c0000, $c4000

SECTION "bank31", ROMX, BANK[$31]
	dr $c4000, $c8000

SECTION "bank32", ROMX, BANK[$32]
BattleAnimations:: ; Not actually where it is, I just needed the label for BANK to work
	dr $c8000, $cc000

SECTION "bank33", ROMX, BANK[$33]
BattleAnimCommands::  ; Not actually where it is, I just needed the label for BANK to work
	dr $cc000, $d0000

SECTION "bank34", ROMX, BANK[$34]
	dr $d0000, $d4000

SECTION "bank35", ROMX, BANK[$35]
	dr $d4000, $d8000

SECTION "bank36", ROMX, BANK[$36]
	dr $d8000, $dc000

SECTION "bank37", ROMX, BANK[$37]
	dr $dc000, $e0000

SECTION "bank38", ROMX, BANK[$38]
	dr $e0000, $e4000

SECTION "bank39", ROMX, BANK[$39]
TitleScreenGFX5:
	dr $e4000, $e41e0
TitleScreenGFX3:
IF DEF(GOLD)
	dr $e41e0, $e4260
TitleScreenGFX4:
	dr $e4260, $e4608
OptionsMenu:
	dr $e4608, $e49a8
Copyright_GFPresents:
	dr $e49a8, $e4cb1
GoldSilverIntro:
	dr $e4cb1, $e8000
ENDC

IF DEF(SILVER)
	dr $e41e0, $e4220
TitleScreenGFX4:
	dr $e4220, $e4450
OptionsMenu:
	dr $e4450, $e47f0
Copyright_GFPresents:
	dr $e47f0, $e4af9
GoldSilverIntro:
	dr $e4af9, $e8000
ENDC

SECTION "bank3a", ROMX, BANK[$3a]
DisableAudio_::
	dr $e8000, $e805c

UpdateSound_::
	dr $e805c, $e8b30

PlayMusic_::
	dr $e8b30, $e8b79

PlayCryHeader_::
	dr $e8b79, $e8c04

PlaySFX_::
	dr $e8c04, $ec000

SECTION "bank3b", ROMX, BANK[$3b]
	dr $ec000, $f0000

SECTION "bank3c", ROMX, BANK[$3c]
	dr $f0000, $f2747
CryHeaders::
	dr $f2747, $f4000

SECTION "bank3d", ROMX, BANK[$3d]
	dr $f4000, $f8000

SECTION "bank3e", ROMX, BANK[$3e]
Functionf8000::
	dr $f8000, $f800c
Functionf800c::
	dr $f800c, $f8032
Functionf8032::
	dr $f8032, $fb4be

TileCollisionTable::
	dr $fb4be, $fb5be
Shrink1Pic:
	dr $fb5be, $fb64e
Shrink2Pic:
	dr $fb64e, $fc000

SECTION "bank3f", ROMX, BANK[$3f]
	dr $fc000, $100000

SECTION "bank40", ROMX, BANK[$40]
BattleText:: ; Not actually where it is, I just needed the label for BANK to work
	dr $100000, $104000

SECTION "bank41", ROMX, BANK[$41]
	dr $104000, $108000

SECTION "bank42", ROMX, BANK[$42]
	dr $108000, $10c000

SECTION "bank43", ROMX, BANK[$43]
	dr $10c000, $110000

SECTION "bank44", ROMX, BANK[$44]
	dr $110000, $114000

SECTION "bank45", ROMX, BANK[$45]
	dr $114000, $118000

SECTION "bank46", ROMX, BANK[$46]
	dr $118000, $11c000

SECTION "bank47", ROMX, BANK[$47]
	dr $11c000, $120000

SECTION "bank48", ROMX, BANK[$48]
	dr $120000, $124000

SECTION "bank49", ROMX, BANK[$49]
	dr $124000, $128000

SECTION "bank4a", ROMX, BANK[$4a]
	dr $128000, $12c000

SECTION "bank4b", ROMX, BANK[$4b]
	dr $12c000, $130000

SECTION "bank4c", ROMX, BANK[$4c]
	dr $130000, $134000

SECTION "bank4d", ROMX, BANK[$4d]
	dr $134000, $138000

SECTION "bank4e", ROMX, BANK[$4e]
	dr $138000, $13c000

SECTION "bank4f", ROMX, BANK[$4f]
	dr $13c000, $140000

SECTION "bank50", ROMX, BANK[$50]
	dr $140000, $144000

SECTION "bank51", ROMX, BANK[$51]
	dr $144000, $148000

SECTION "bank52", ROMX, BANK[$52]
	dr $148000, $14c000

SECTION "bank53", ROMX, BANK[$53]
	dr $14c000, $150000

SECTION "bank54", ROMX, BANK[$54]
	dr $150000, $154000

SECTION "bank55", ROMX, BANK[$55]
	dr $154000, $158000

SECTION "bank56", ROMX, BANK[$56]
	dr $158000, $15c000

SECTION "bank57", ROMX, BANK[$57]
	dr $15c000, $160000

SECTION "bank58", ROMX, BANK[$58]
	dr $160000, $164000

SECTION "bank59", ROMX, BANK[$59]
	dr $164000, $168000

SECTION "bank5a", ROMX, BANK[$5a]
	dr $168000, $16c000

SECTION "bank5b", ROMX, BANK[$5b]
	dr $16c000, $170000

SECTION "bank5c", ROMX, BANK[$5c]
	dr $170000, $174000

SECTION "bank5d", ROMX, BANK[$5d]
	dr $174000, $178000

SECTION "bank5e", ROMX, BANK[$5e]
	dr $178000, $17c000

SECTION "bank5f", ROMX, BANK[$5f]
	dr $17c000, $180000

SECTION "bank60", ROMX, BANK[$60]
	dr $180000, $184000

SECTION "bank61", ROMX, BANK[$61]
	dr $184000, $188000

SECTION "bank62", ROMX, BANK[$62]
	dr $188000, $18c000

SECTION "bank63", ROMX, BANK[$63]
	dr $18c000, $190000

SECTION "bank64", ROMX, BANK[$64]
	dr $190000, $194000

SECTION "bank65", ROMX, BANK[$65]
	dr $194000, $195610

ClockTimeUnknownText_:: ; 195610
	dr $195610, $195624

OakText1_::
	dr $195624, $195693

OakText2_::
	dr $195693, $1956d1

OakText3_:: ; 1956d1
	dr $1956d1, $1956d3

OakText4_::
	dr $1956d3, $19573f

OakText5_::
	dr $19573f, $1957b7

OakText6_::
	dr $1957b7, $1957dd

OakText7_::
	dr $1957dd, $195b84

ObjectEventText_:: ; 195b84
	dr $195b84, $195b93

BGEventText_:: ; 195b93
	dr $195b93, $195b9d

CoordinatesEventText_:: ; 195b9d
	dr $195b9d, $198000

SECTION "bank66", ROMX, BANK[$66]
	dr $198000, $1981e1
Text_LearnedMove_::
	dr $1981e1, $1981f8
Text_ForgetWhich_::
	dr $1981f8, $198219
Text_StopLearning_::
	dr $198219, $19822f
Text_DidNotLearn_::
	dr $19822f, $198249
Text_TryingToLearn_::
	dr $198249, $1982c0
Text_1_2_and_Poof_::
	dr $1982c0, $1982ce
Text_PoofForgot_::
	dr $1982ce, $1982f2
Text_CantForgetHM_::
	dr $1982f2, $19c000

SECTION "bank67", ROMX, BANK[$67]
	dr $19c000, $1a0000

SECTION "bank68", ROMX, BANK[$68]
	dr $1a0000, $1a4000

SECTION "bank69", ROMX, BANK[$69]
	dr $1a4000, $1a8000

SECTION "bank6a", ROMX, BANK[$6a]
	dr $1a8000, $1ac000

SECTION "bank6b", ROMX, BANK[$6b]
	dr $1ac000, $1b0000

SECTION "bank6c", ROMX, BANK[$6c]
ItemNames::
	dr $1b0000, $1b0955
TrainerClassNames::
	dr $1b0955, $1b0b74
PokemonNames::
	dr $1b0b74, $1b1574
MoveNames::
	dr $1b1574, $1b4000

SECTION "bank6d", ROMX, BANK[$6d]
	dr $1b4000, $1b8000

SECTION "bank6e", ROMX, BANK[$6e]
	dr $1b8000, $1bc000

SECTION "bank6f", ROMX, BANK[$6f]
	dr $1bc000, $1c0000

SECTION "bank70", ROMX, BANK[$70]
	dr $1c0000, $1c0de9
_DudeAutoInput_A::
	dr $1c0de9, $1c4000

SECTION "bank71", ROMX, BANK[$71]
	dr $1c4000, $1c8000

SECTION "bank72", ROMX, BANK[$72]
	dr $1c8000, $1cc000

SECTION "bank73", ROMX, BANK[$73]
	dr $1cc000, $1d0000

SECTION "bank74", ROMX, BANK[$74]
	dr $1d0000, $1d4000

SECTION "bank75", ROMX, BANK[$75]
	dr $1d4000, $1d8000

SECTION "bank76", ROMX, BANK[$76]
	dr $1d8000, $1dc000

SECTION "bank77", ROMX, BANK[$77]
	dr $1dc000, $1e0000

SECTION "bank78", ROMX, BANK[$78]
	dr $1e0000, $1e4000

SECTION "bank79", ROMX, BANK[$79]
	dr $1e4000, $1e8000

SECTION "bank7a", ROMX, BANK[$7a]
	dr $1e8000, $1ec000

SECTION "bank7b", ROMX, BANK[$7b]
	dr $1ec000, $1f0000

SECTION "bank7c", ROMX, BANK[$7c]
	dr $1f0000, $1f4000

SECTION "bank7d", ROMX, BANK[$7d]
	dr $1f4000, $1f8000

SECTION "bank7e", ROMX, BANK[$7e]
	dr $1f8000, $1fc000

SECTION "bank7f", ROMX, BANK[$7f]
	dr $1fc000, $200000
