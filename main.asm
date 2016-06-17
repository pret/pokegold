INCLUDE "includes.asm"

SECTION "bank1", DATA, BANK[$1]
PlaceWaitingText::
	dr $4000, $4032
LoadPushOAM::
	dr $4032, $4274
SpriteMovementData::
	dr $4274, $4358
DeleteMapObject::
	dr $4358, $557f
Function557f::
	dr $557f, $5730
Function5730::
	dr $5730, $5795
StopFollow::
	dr $5795, $5896
UpdateSprites_::
	dr $5896, $58c5
Function58c5::
IF DEF(GOLD)
	dr $58c5, $6545
GameInit::
	dr $6545, $6551
ReanchorBGMap_NoOAMUpdate:: ; 6551
	dr $6551, $65cb
LoadFonts_NoOAMUpdate:: ; 65cb
	dr $65cb, $754e
ENDC

IF DEF(SILVER)
	dr $58c5, $650b
GameInit::
	dr $650b, $6517
ReanchorBGMap_NoOAMUpdate:: ; 6517
	dr $6517, $6591
LoadFonts_NoOAMUpdate:: ; 6591
	dr $6591, $7514
ENDC

SECTION "bank2", DATA, BANK[$2]
SwapTextboxPalettes::
	dr $8000, $804f
ScrollBGMapPalettes::
	dr $804f, $86d7
CopyObjectStruct_::
	dr $86d7, $8ac9
Sine_e::
	dr $8ac9, $8b3b
GetPredefPointer::
	dr $8b3b, $9cfd
InitCGBPals:: ; 9cfd
	dr $9cfd, $c000

SECTION "bank3", DATA, BANK[$3]
	dr $c000, $c01b
EngineFlagAction:: ; c01b
	dr $c01b, $10000

SECTION "bank4", DATA, BANK[$4]
	dr $10000, $14000

SECTION "bank5", DATA, BANK[$5]
	dr $14000, $14032
Function14032:: ; 14032
	dr $14032, $14089
StartClock:: ; 14089
	dr $14089, $140ff
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
	dr $14a2d, $15484
RunMapSetupScript::
	dr $15484, $15612
Function15612:: ; 15612
	dr $15612, $18000

SECTION "bank6", DATA, BANK[$6]
	dr $18000, $1c000

SECTION "bank7", DATA, BANK[$7]
LoadMapGroupRoof::
	dr $1c000, $20000

SECTION "bank8", DATA, BANK[$8]
	dr $20000, $24000

SECTION "bank9", DATA, BANK[$9]
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
	dr $24395, $28000

SECTION "banka", DATA, BANK[$a]
	dr $28000, $2c000

SECTION "bankb", DATA, BANK[$b]
	dr $2c000, $30000

SECTION "bankc", DATA, BANK[$c]
	dr $30000, $34000

SECTION "bankd", DATA, BANK[$d]
	dr $34000, $38000

SECTION "banke", DATA, BANK[$e]
	dr $38000, $398f2

Battle_GetTrainerName:: ; 398f2
	dr $398f2, $3c000

SECTION "bankf", DATA, BANK[$f]
	dr $3c000, $40000

SECTION "bank10", DATA, BANK[$10]
	dr $40000, $44000

SECTION "bank11", DATA, BANK[$11]
	dr $44000, $48000

SECTION "bank12", DATA, BANK[$12]
	dr $48000, $4c000

SECTION "bank13", DATA, BANK[$13]
	dr $4c000, $50000

SECTION "bank14", DATA, BANK[$14]
	dr $50000, $54000

SECTION "bank15", DATA, BANK[$15]
	dr $54000, $58000

SECTION "bank16", DATA, BANK[$16]
	dr $58000, $5c000

SECTION "bank17", DATA, BANK[$17]
	dr $5c000, $60000

SECTION "bank18", DATA, BANK[$18]
	dr $60000, $64000

SECTION "bank19", DATA, BANK[$19]
	dr $64000, $68000

SECTION "bank1a", DATA, BANK[$1a]
	dr $68000, $6c000

SECTION "bank1b", DATA, BANK[$1b]
	dr $6c000, $70000

SECTION "bank1c", DATA, BANK[$1c]
	dr $70000, $74000

SECTION "bank1d", DATA, BANK[$1d]
	dr $74000, $78000

SECTION "bank1e", DATA, BANK[$1e]
	dr $78000, $7c000

SECTION "bank1f", DATA, BANK[$1f]
	dr $7c000, $80000

SECTION "bank20", DATA, BANK[$20]
	dr $80000, $84000

SECTION "bank21", DATA, BANK[$21]
	dr $84000, $842db

PrinterReceive_:: ; 842db
	dr $842db, $88000

SECTION "bank22", DATA, BANK[$22]
	dr $88000, $8c000

SECTION "bank23", DATA, BANK[$23]
	dr $8c000, $8c356

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
	dr $8c3e9, $90000

SECTION "bank24", DATA, BANK[$24]
	dr $90000, $94000

SECTION "bank25", DATA, BANK[$25]
MapTriggers:: ; 94000
	dr $94000, $940ed

MapGroupPointers::
	dr $940ed, $96b89

EnableScriptMode:: ; 96b89
	dr $96b89, $96b91

ScriptEvents:: ; 96b91
	dr $96b91, $97365

CallCallback:: ; 97365
	dr $97365, $97c2a

Function97c2a:: ; 97c2a
	dr $97c2a, $98000

SECTION "bank26", DATA, BANK[$26]
	dr $98000, $9c000

SECTION "bank27", DATA, BANK[$27]
	dr $9c000, $a0000

SECTION "bank28", DATA, BANK[$28]
	dr $a0000, $a4000

SECTION "bank29", DATA, BANK[$29]
	dr $a4000, $a8000

SECTION "bank2a", DATA, BANK[$2a]
	dr $a8000, $ac000

SECTION "bank2b", DATA, BANK[$2b]
	dr $ac000, $b0000

SECTION "bank2c", DATA, BANK[$2c]
	dr $b0000, $b4000

SECTION "bank2d", DATA, BANK[$2d]
	dr $b4000, $b8000

SECTION "bank2e", DATA, BANK[$2e]
	dr $b8000, $bc000

SECTION "bank2f", DATA, BANK[$2f]
	dr $bc000, $c0000

SECTION "bank30", DATA, BANK[$30]
	dr $c0000, $c4000

SECTION "bank31", DATA, BANK[$31]
	dr $c4000, $c8000

SECTION "bank32", DATA, BANK[$32]
	dr $c8000, $cc000

SECTION "bank33", DATA, BANK[$33]
	dr $cc000, $d0000

SECTION "bank34", DATA, BANK[$34]
	dr $d0000, $d4000

SECTION "bank35", DATA, BANK[$35]
	dr $d4000, $d8000

SECTION "bank36", DATA, BANK[$36]
	dr $d8000, $dc000

SECTION "bank37", DATA, BANK[$37]
	dr $dc000, $e0000

SECTION "bank38", DATA, BANK[$38]
	dr $e0000, $e4000

SECTION "bank39", DATA, BANK[$39]
	dr $e4000, $e8000

SECTION "bank3a", DATA, BANK[$3a]
	dr $e8000, $e805c

_UpdateSound::
	dr $e805c, $ec000

SECTION "bank3b", DATA, BANK[$3b]
	dr $ec000, $f0000

SECTION "bank3c", DATA, BANK[$3c]
	dr $f0000, $f4000

SECTION "bank3d", DATA, BANK[$3d]
	dr $f4000, $f8000

SECTION "bank3e", DATA, BANK[$3e]
Functionf8000::
	dr $f8000, $f800c
Functionf800c::
	dr $f800c, $f8032
Functionf8032::
	dr $f8032, $fb4be

TileCollisionTable::
	dr $fb4be, $fc000

SECTION "bank3f", DATA, BANK[$3f]
	dr $fc000, $100000

SECTION "bank40", DATA, BANK[$40]
	dr $100000, $104000

SECTION "bank41", DATA, BANK[$41]
	dr $104000, $108000

SECTION "bank42", DATA, BANK[$42]
	dr $108000, $10c000

SECTION "bank43", DATA, BANK[$43]
	dr $10c000, $110000

SECTION "bank44", DATA, BANK[$44]
	dr $110000, $114000

SECTION "bank45", DATA, BANK[$45]
	dr $114000, $118000

SECTION "bank46", DATA, BANK[$46]
	dr $118000, $11c000

SECTION "bank47", DATA, BANK[$47]
	dr $11c000, $120000

SECTION "bank48", DATA, BANK[$48]
	dr $120000, $124000

SECTION "bank49", DATA, BANK[$49]
	dr $124000, $128000

SECTION "bank4a", DATA, BANK[$4a]
	dr $128000, $12c000

SECTION "bank4b", DATA, BANK[$4b]
	dr $12c000, $130000

SECTION "bank4c", DATA, BANK[$4c]
	dr $130000, $134000

SECTION "bank4d", DATA, BANK[$4d]
	dr $134000, $138000

SECTION "bank4e", DATA, BANK[$4e]
	dr $138000, $13c000

SECTION "bank4f", DATA, BANK[$4f]
	dr $13c000, $140000

SECTION "bank50", DATA, BANK[$50]
	dr $140000, $144000

SECTION "bank51", DATA, BANK[$51]
	dr $144000, $148000

SECTION "bank52", DATA, BANK[$52]
	dr $148000, $14c000

SECTION "bank53", DATA, BANK[$53]
	dr $14c000, $150000

SECTION "bank54", DATA, BANK[$54]
	dr $150000, $154000

SECTION "bank55", DATA, BANK[$55]
	dr $154000, $158000

SECTION "bank56", DATA, BANK[$56]
	dr $158000, $15c000

SECTION "bank57", DATA, BANK[$57]
	dr $15c000, $160000

SECTION "bank58", DATA, BANK[$58]
	dr $160000, $164000

SECTION "bank59", DATA, BANK[$59]
	dr $164000, $168000

SECTION "bank5a", DATA, BANK[$5a]
	dr $168000, $16c000

SECTION "bank5b", DATA, BANK[$5b]
	dr $16c000, $170000

SECTION "bank5c", DATA, BANK[$5c]
	dr $170000, $174000

SECTION "bank5d", DATA, BANK[$5d]
	dr $174000, $178000

SECTION "bank5e", DATA, BANK[$5e]
	dr $178000, $17c000

SECTION "bank5f", DATA, BANK[$5f]
	dr $17c000, $180000

SECTION "bank60", DATA, BANK[$60]
	dr $180000, $184000

SECTION "bank61", DATA, BANK[$61]
	dr $184000, $188000

SECTION "bank62", DATA, BANK[$62]
	dr $188000, $18c000

SECTION "bank63", DATA, BANK[$63]
	dr $18c000, $190000

SECTION "bank64", DATA, BANK[$64]
	dr $190000, $194000

SECTION "bank65", DATA, BANK[$65]
	dr $194000, $195b84

ObjectEventText_:: ; 195b84
	dr $195b84, $195b93

BGEventText_:: ; 195b93
	dr $195b93, $195b9d

CoordinatesEventText_:: ; 195b9d
	dr $195b9d, $198000

SECTION "bank66", DATA, BANK[$66]
	dr $198000, $19c000

SECTION "bank67", DATA, BANK[$67]
	dr $19c000, $1a0000

SECTION "bank68", DATA, BANK[$68]
	dr $1a0000, $1a4000

SECTION "bank69", DATA, BANK[$69]
	dr $1a4000, $1a8000

SECTION "bank6a", DATA, BANK[$6a]
	dr $1a8000, $1ac000

SECTION "bank6b", DATA, BANK[$6b]
	dr $1ac000, $1b0000

SECTION "bank6c", DATA, BANK[$6c]
	dr $1b0000, $1b4000

SECTION "bank6d", DATA, BANK[$6d]
	dr $1b4000, $1b8000

SECTION "bank6e", DATA, BANK[$6e]
	dr $1b8000, $1bc000

SECTION "bank6f", DATA, BANK[$6f]
	dr $1bc000, $1c0000

SECTION "bank70", DATA, BANK[$70]
	dr $1c0000, $1c0de9
_DudeAutoInput_A::
	dr $1c0de9, $1c4000

SECTION "bank71", DATA, BANK[$71]
	dr $1c4000, $1c8000

SECTION "bank72", DATA, BANK[$72]
	dr $1c8000, $1cc000

SECTION "bank73", DATA, BANK[$73]
	dr $1cc000, $1d0000

SECTION "bank74", DATA, BANK[$74]
	dr $1d0000, $1d4000

SECTION "bank75", DATA, BANK[$75]
	dr $1d4000, $1d8000

SECTION "bank76", DATA, BANK[$76]
	dr $1d8000, $1dc000

SECTION "bank77", DATA, BANK[$77]
	dr $1dc000, $1e0000

SECTION "bank78", DATA, BANK[$78]
	dr $1e0000, $1e4000

SECTION "bank79", DATA, BANK[$79]
	dr $1e4000, $1e8000

SECTION "bank7a", DATA, BANK[$7a]
	dr $1e8000, $1ec000

SECTION "bank7b", DATA, BANK[$7b]
	dr $1ec000, $1f0000

SECTION "bank7c", DATA, BANK[$7c]
	dr $1f0000, $1f4000

SECTION "bank7d", DATA, BANK[$7d]
	dr $1f4000, $1f8000

SECTION "bank7e", DATA, BANK[$7e]
	dr $1f8000, $1fc000

SECTION "bank7f", DATA, BANK[$7f]
	dr $1fc000, $200000
