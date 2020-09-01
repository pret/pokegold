; macros taken from pokered's data/sgb_packets.asm
; names taken from pandocs
; http://gbdev.gg8.se/wiki/articles/SGB_Functions#SGB_Palette_Commands

attr_blk: MACRO
	db (SGB_ATTR_BLK << 3) + ((\1 * 6) / 16 + 1)
	db \1
ENDM

attr_blk_data: MACRO
	db \1 ; which regions are affected
	db \2 + (\3 << 2) + (\4 << 4) ; palette for each region
	db \5, \6, \7, \8 ; x1, y1, x2, y2
ENDM

BlkPacket_9ee5:
	attr_blk 1
	attr_blk_data %011, 0,0,0, 00,00, 19,17
	ds 8, 0

BlkPacket_GSIntroJigglypuffPikachu:
	attr_blk 1
	attr_blk_data %111, 1,1,0, 00,10, 19,13
	ds 8, 0

BlkPacket_Battle:
	attr_blk 5
	attr_blk_data %111, 2,2,0, 00,12, 19,17 ; text box: pal 2
	attr_blk_data %011, 1,1,0, 01,00, 10,03 ; enemy HP bar: pal 1
	attr_blk_data %011, 0,0,0, 10,08, 19,10 ; player HP+exp bar: pal 0
	attr_blk_data %011, 2,2,0, 00,04, 08,11 ; player mon: pal 2
	attr_blk_data %011, 3,3,0, 11,00, 19,07 ; enemy mon : pal 3

BlkPacket_StatsScreen:
	attr_blk 1
	attr_blk_data %111, 1,1,0, 00,00, 06,06 ; mon: pal 1
	ds 8, 0

BlkPacket_MoveList:
	attr_blk 1
	attr_blk_data %110, 1,1,0, 11,01, 19,02
	ds 8, 0

BlkPacket_Pokedex_PC:
	attr_blk 1
	attr_blk_data %111, 1,1,0, 00,01, 07,07 ; mon: pal 1
	ds 8, 0

BlkPacket_9f55:
	attr_blk 1
	attr_blk_data %111, 1,1,0, 01,04, 07,10
	ds 8, 0

BlkPacket_Pokedex_5x5:
	attr_blk 1
	attr_blk_data %111, 1,1,0, 01,01, 05,05
	ds 8, 0

BlkPacket_PokedexUnownMode:
	attr_blk 1
	attr_blk_data %111, 1,1,0, 07,05, 13,11 ; unown: pal 1
	ds 8, 0

BlkPacket_SlotMachine:
	attr_blk 5
	attr_blk_data %011, 1,1,0, 00,00, 19,11 ; "3" rows and top of screen: pal 1
	attr_blk_data %011, 2,2,0, 00,04, 19,09 ; "2" rows: pal 2
	attr_blk_data %010, 3,3,0, 00,06, 19,07 ; "1" row: pal 3
	attr_blk_data %011, 0,0,0, 04,04, 15,09 ; slot reels: pal 0
	attr_blk_data %011, 0,0,0, 00,12, 19,17 ; text box: pal 0

BlkPacket_PartyMenu:
	attr_blk 7
	attr_blk_data %111, 0,0,1, 00,00, 02,12
	attr_blk_data %010, 0,0,0, 12,01, 18,02
	attr_blk_data %010, 0,0,0, 12,03, 18,04
	attr_blk_data %010, 0,0,0, 12,05, 18,06
	attr_blk_data %010, 0,0,0, 12,07, 18,08
	attr_blk_data %010, 0,0,0, 12,09, 18,10
	attr_blk_data %010, 0,0,0, 12,11, 18,12
	ds 4, 0

BlkPacket_GSTitleScreen:
	attr_blk 2
	attr_blk_data %111, 0,0,3, 00,00, 19,06
	attr_blk_data %010, 0,1,0, 05,06, 14,06
	ds 2, 0

BlkPacket_BetaTitleScreen:
	attr_blk 1
	attr_blk_data %111, 0,0,1, 00,00, 19,05 ; logo
	ds 8, 0

BlkPacket_MagnetTrain:
	attr_blk 2
	attr_blk_data %111, 2,2,0, 00,04, 19,13 ; fence
	attr_blk_data %011, 1,1,0, 00,06, 19,11 ; train
	ds 2, 0
