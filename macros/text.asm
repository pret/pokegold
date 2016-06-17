text   EQUS "db $00," ; Start writing text.
next   EQUS "db $4e," ; Move a line down.
line   EQUS "db $4f," ; Start writing at the bottom line.
para   EQUS "db $51," ; Start a new paragraph.
cont   EQUS "db $55," ; Scroll to the next line.
done   EQUS "db $57"  ; End a text box.
prompt EQUS "db $58"  ; Prompt the player to end a text box (initiating some other event).

; Pokedex text commands are only used with pokered.
; They are included for compatibility.
page   EQUS "db $50,"     ; Start a new Pokedex page.
dex    EQUS "db $e8, $50" ; End a Pokedex entry.

; TX_RAM EQU $01
; TX_FAR EQU $16
	enum_start 1
	enum TX_RAM
text_from_ram: MACRO ; 01
	db TX_RAM
	dw \1
	ENDM

	enum TX_BCD
text_bcd: macro ; 02
	db TX_BCD
	dw \1
	db \2
	ENDM

	enum TX_MOVE
text_move: macro ; 03
	db TX_MOVE
	dw \1
	ENDM

	enum TX_BOX
text_box: macro ; 04
	db TX_BOX
	dw \1
	db \2, \3
	ENDM

	enum TX_LOW
text_low: macro ; 05
	db TX_LOW
	endm

	enum WAIT_BUTTON
text_waitbutton: macro ; 06
	db WAIT_BUTTON
	endm

	enum TX_SCROLL
text_scroll: macro ; 07
	db TX_SCROLL
	endm

	enum START_ASM
start_asm: macro ; 08
	db START_ASM
	endm

	enum TX_NUM
deciram: macro ; 09
	db TX_NUM
	dw \1 ; address
	dn \2, \3 ; bytes, digits
	endm

	enum TX_EXIT
interpret_data: macro ; 0a
	db TX_EXIT
	endm

	enum TX_SOUND_0B
sound_dex_fanfare_50_79: macro ; 0b
	db TX_SOUND_0B
	endm

	enum TX_DOTS
limited_interpret_data: macro ; 0c
	db TX_DOTS
	db \1
	endm

	enum TX_LINK_WAIT_BUTTON
link_wait_button: macro ; 0d
	db TX_LINK_WAIT_BUTTON
	endm

	enum TX_SOUND_0E
sound_dex_fanfare_20_49: macro ; 0e
	db TX_SOUND_0E
	endm

	enum TX_SOUND_0F
sound_item: macro ; 0f
	db TX_SOUND_0F
	endm

	enum TX_SOUND_10
sound_caught_mon: macro ; 10
	db TX_SOUND_10
	endm

	enum TX_SOUND_11
sound_dex_fanfare_80_109: macro ; 11
	db TX_SOUND_11
	endm

	enum TX_SOUND_12
sound_fanfare: macro ; 12
	db TX_SOUND_12
	endm

	enum TX_SOUND_13
sound_slot_machine_start: macro ; 13
	db TX_SOUND_13
	endm

	enum TX_STRINGBUFFER
text_buffer: macro ; 14
	db TX_STRINGBUFFER
	db \1
	endm

	enum TX_DAY
current_day: macro ; 15
	db TX_DAY
	endm

	enum TX_FAR
text_jump: MACRO ; 16
	db TX_FAR
	dw \1
	db BANK(\1)
	ENDM
