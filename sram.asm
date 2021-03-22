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
	table_width MAIL_STRUCT_LENGTH, sPartyMail
sPartyMon1Mail:: mailmsg sPartyMon1Mail
sPartyMon2Mail:: mailmsg sPartyMon2Mail
sPartyMon3Mail:: mailmsg sPartyMon3Mail
sPartyMon4Mail:: mailmsg sPartyMon4Mail
sPartyMon5Mail:: mailmsg sPartyMon5Mail
sPartyMon6Mail:: mailmsg sPartyMon6Mail
	assert_table_length PARTY_LENGTH

sPartyMailBackup::
	table_width MAIL_STRUCT_LENGTH, sPartyMailBackup
sPartyMon1MailBackup:: mailmsg sPartyMon1MailBackup
sPartyMon2MailBackup:: mailmsg sPartyMon2MailBackup
sPartyMon3MailBackup:: mailmsg sPartyMon3MailBackup
sPartyMon4MailBackup:: mailmsg sPartyMon4MailBackup
sPartyMon5MailBackup:: mailmsg sPartyMon5MailBackup
sPartyMon6MailBackup:: mailmsg sPartyMon6MailBackup
	assert_table_length PARTY_LENGTH

sMailboxCount:: db
sMailboxes::
	table_width MAIL_STRUCT_LENGTH, sMailboxes
sMailbox1::  mailmsg sMailbox1
sMailbox2::  mailmsg sMailbox2
sMailbox3::  mailmsg sMailbox3
sMailbox4::  mailmsg sMailbox4
sMailbox5::  mailmsg sMailbox5
sMailbox6::  mailmsg sMailbox6
sMailbox7::  mailmsg sMailbox7
sMailbox8::  mailmsg sMailbox8
sMailbox9::  mailmsg sMailbox9
sMailbox10:: mailmsg sMailbox10
	assert_table_length MAILBOX_CAPACITY

sMailboxCountBackup:: db
sMailboxesBackup::
	table_width MAIL_STRUCT_LENGTH, sMailboxesBackup
sMailbox1Backup::  mailmsg sMailbox1Backup
sMailbox2Backup::  mailmsg sMailbox2Backup
sMailbox3Backup::  mailmsg sMailbox3Backup
sMailbox4Backup::  mailmsg sMailbox4Backup
sMailbox5Backup::  mailmsg sMailbox5Backup
sMailbox6Backup::  mailmsg sMailbox6Backup
sMailbox7Backup::  mailmsg sMailbox7Backup
sMailbox8Backup::  mailmsg sMailbox8Backup
sMailbox9Backup::  mailmsg sMailbox9Backup
sMailbox10Backup:: mailmsg sMailbox10Backup
	assert_table_length MAILBOX_CAPACITY

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
	table_width LINK_BATTLE_RECORD_LENGTH, sLinkBattleRecord
sLinkBattleRecord1:: link_battle_record sLinkBattleRecord1
sLinkBattleRecord2:: link_battle_record sLinkBattleRecord2
sLinkBattleRecord3:: link_battle_record sLinkBattleRecord3
sLinkBattleRecord4:: link_battle_record sLinkBattleRecord4
sLinkBattleRecord5:: link_battle_record sLinkBattleRecord5
	assert_table_length NUM_LINK_BATTLE_RECORDS
sLinkBattleStatsEnd::


SECTION "SRAM Hall of Fame", SRAM

sHallOfFame::
	table_width HOF_LENGTH, sHallOfFame
sHallOfFame01:: hall_of_fame sHallOfFame01
sHallOfFame02:: hall_of_fame sHallOfFame02
sHallOfFame03:: hall_of_fame sHallOfFame03
sHallOfFame04:: hall_of_fame sHallOfFame04
sHallOfFame05:: hall_of_fame sHallOfFame05
sHallOfFame06:: hall_of_fame sHallOfFame06
sHallOfFame07:: hall_of_fame sHallOfFame07
sHallOfFame08:: hall_of_fame sHallOfFame08
sHallOfFame09:: hall_of_fame sHallOfFame09
sHallOfFame10:: hall_of_fame sHallOfFame10
sHallOfFame11:: hall_of_fame sHallOfFame11
sHallOfFame12:: hall_of_fame sHallOfFame12
sHallOfFame13:: hall_of_fame sHallOfFame13
sHallOfFame14:: hall_of_fame sHallOfFame14
sHallOfFame15:: hall_of_fame sHallOfFame15
sHallOfFame16:: hall_of_fame sHallOfFame16
sHallOfFame17:: hall_of_fame sHallOfFame17
sHallOfFame18:: hall_of_fame sHallOfFame18
sHallOfFame19:: hall_of_fame sHallOfFame19
sHallOfFame20:: hall_of_fame sHallOfFame20
sHallOfFame21:: hall_of_fame sHallOfFame21
sHallOfFame22:: hall_of_fame sHallOfFame22
sHallOfFame23:: hall_of_fame sHallOfFame23
sHallOfFame24:: hall_of_fame sHallOfFame24
sHallOfFame25:: hall_of_fame sHallOfFame25
sHallOfFame26:: hall_of_fame sHallOfFame26
sHallOfFame27:: hall_of_fame sHallOfFame27
sHallOfFame28:: hall_of_fame sHallOfFame28
sHallOfFame29:: hall_of_fame sHallOfFame29
sHallOfFame30:: hall_of_fame sHallOfFame30
	assert_table_length NUM_HOF_TEAMS
sHallOfFameEnd::


SECTION "Backup Save 2", SRAM

sBackupPlayerData2:: ds wPlayerData2End - wPlayerData2


SECTION "Boxes 1-7", SRAM

sBox1::  box sBox1
sBox2::  box sBox2
sBox3::  box sBox3
sBox4::  box sBox4
sBox5::  box sBox5
sBox6::  box sBox6
sBox7::  box sBox7


SECTION "Boxes 8-14", SRAM

sBox8::  box sBox8
sBox9::  box sBox9
sBox10:: box sBox10
sBox11:: box sBox11
sBox12:: box sBox12
sBox13:: box sBox13
sBox14:: box sBox14


SECTION "Backup Save 3", SRAM

sBackupOptions:: ds wOptionsEnd - wOptions
sBackupCheckValue1:: db ; loaded with SAVE_CHECK_VALUE_1, used to check save corruption
sBackupCurMapData:: ds wCurMapDataEnd - wCurMapData
sBackupChecksum:: dw
sBackupCheckValue2:: db ; loaded with SAVE_CHECK_VALUE_2, used to check save corruption
