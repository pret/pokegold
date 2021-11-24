SECTION "Scratch", SRAM

UNION
sScratch::
sDecompressScratch::
	ds $60 tiles

NEXTU
	ds $188
sDecompressBuffer:: ds 7 * 7 tiles
ENDU


SECTION "SRAM Bank 0", SRAM

sPartyMail::
; sPartyMon1Mail - sPartyMon6Mail
for n, 1, PARTY_LENGTH + 1
sPartyMon{d:n}Mail:: mailmsg sPartyMon{d:n}Mail
endr

sPartyMailBackup::
; sPartyMon1MailBackup - sPartyMon6MailBackup
for n, 1, PARTY_LENGTH + 1
sPartyMon{d:n}MailBackup:: mailmsg sPartyMon{d:n}MailBackup
endr

sMailboxCount:: db
sMailboxes::
; sMailbox1 - sMailbox10
for n, 1, MAILBOX_CAPACITY + 1
sMailbox{d:n}:: mailmsg sMailbox{d:n}
endr

sMailboxCountBackup:: db
sMailboxesBackup::
; sMailbox1Backup - sMailbox10Backup
for n, 1, MAILBOX_CAPACITY + 1
sMailbox{d:n}Backup:: mailmsg sMailbox{d:n}Backup
endr

sMysteryGiftData::
sMysteryGiftItem:: db
sMysteryGiftUnlocked:: db
sBackupMysteryGiftItem:: db
sNumDailyMysteryGiftPartnerIDs:: db
sDailyMysteryGiftPartnerIDs:: ds MAX_MYSTERY_GIFT_PARTNERS * 2
sMysteryGiftDecorationsReceived:: flag_array NUM_NON_TROPHY_DECOS
	ds 4
sMysteryGiftTimer:: dw
	ds 1
sMysteryGiftTrainerHouseFlag:: db
sMysteryGiftPartnerName:: ds NAME_LENGTH
sMysteryGiftUnusedFlag:: db
sMysteryGiftTrainer:: ds wMysteryGiftTrainerEnd - wMysteryGiftTrainer
sBackupMysteryGiftItemEnd::

	ds $30

sRTCStatusFlags:: db
	ds 7
sLuckyNumberDay:: db
sLuckyIDNumber::  dw


SECTION "Backup Save 1", SRAM

sBackupPlayerData3:: ds wPlayerDataEnd - wPlayerData3
sBackupPokemonData:: ds wPokemonDataEnd - wPokemonData
sBackupPlayerData1:: ds wPlayerData1End - wPlayerData


SECTION "SRAM Stack", SRAM

sStackTop:: dw
sRTCHaltCheckValue:: dw


SECTION "SRAM Window Stack", SRAM

sWindowStackBottom::
	ds $800 - 1
sWindowStackTop::
	ds 1


SECTION "Save", SRAM

sOptions:: ds wOptionsEnd - wOptions

sCheckValue1:: db ; loaded with SAVE_CHECK_VALUE_1, used to check save corruption

sGameData::
sPlayerData::
sPlayerData1::  ds wPlayerData1End - wPlayerData1
sPlayerData2::  ds wPlayerData2End - wPlayerData2
sPlayerData3::  ds wPlayerData3End - wPlayerData3
sCurMapData::   ds wCurMapDataEnd - wCurMapData
sPokemonData::  ds wPokemonDataEnd - wPokemonData
sGameDataEnd::

sChecksum:: dw

sCheckValue2:: db ; loaded with SAVE_CHECK_VALUE_2, used to check save corruption


SECTION "Active Box", SRAM

sBox:: curbox sBox


SECTION "Link Battle Data", SRAM

sLinkBattleStats::
sLinkBattleWins::   dw
sLinkBattleLosses:: dw
sLinkBattleDraws::  dw

sLinkBattleRecord::
; sLinkBattleRecord1 - sLinkBattleRecord5
for n, 1, NUM_LINK_BATTLE_RECORDS + 1
sLinkBattleRecord{d:n}:: link_battle_record sLinkBattleRecord{d:n}
endr
sLinkBattleStatsEnd::


SECTION "SRAM Hall of Fame", SRAM

sHallOfFame::
; sHallOfFame1 - sHallOfFame30
for n, 1, NUM_HOF_TEAMS + 1
sHallOfFame{d:n}:: hall_of_fame sHallOfFame{d:n}
endr
sHallOfFameEnd::


SECTION "Backup Save 2", SRAM

sBackupPlayerData2:: ds wPlayerData2End - wPlayerData2


; The PC boxes will not fit into one SRAM bank,
; so they use multiple SECTIONs
box_n = 0
boxes: MACRO
rept \1
box_n += 1
sBox{d:box_n}:: box sBox{d:box_n}
endr
ENDM

SECTION "Boxes 1-7", SRAM

; sBox1 - sBox7
	boxes 7

SECTION "Boxes 8-14", SRAM

; sBox8 - sBox14
	boxes 7

; All 14 boxes fit exactly within 2 SRAM banks
	assert box_n == NUM_BOXES, \
		"boxes: Expected {d:NUM_BOXES} total boxes, got {d:box_n}"


SECTION "Backup Save 3", SRAM

sBackupOptions:: ds wOptionsEnd - wOptions
sBackupCheckValue1:: db ; loaded with SAVE_CHECK_VALUE_1, used to check save corruption
sBackupCurMapData:: ds wCurMapDataEnd - wCurMapData
sBackupChecksum:: dw
sBackupCheckValue2:: db ; loaded with SAVE_CHECK_VALUE_2, used to check save corruption
