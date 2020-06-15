; DoTradeAnimation.JumpTable indexes (see engine/movies/trade_animation.asm)
	enum_start

	enum tradeanim_next_command ; $00
tradeanim_next: MACRO
	db tradeanim_next_command
ENDM

	enum tradeanim_show_givemon_data_command ; $01
tradeanim_show_givemon_data: MACRO
	db tradeanim_show_givemon_data_command
ENDM

	enum tradeanim_show_getmon_data_command ; $02
tradeanim_show_getmon_data: MACRO
	db tradeanim_show_getmon_data_command
ENDM

	enum tradeanim_enter_link_tube_command ; $03
tradeanim_enter_link_tube: MACRO
	db tradeanim_enter_link_tube_command
ENDM

	enum_start $05

	enum tradeanim_exit_link_tube_command ; $05
tradeanim_exit_link_tube: MACRO
	db tradeanim_exit_link_tube_command
ENDM

	enum tradeanim_tube_to_ot_command ; $06
tradeanim_tube_to_ot: MACRO
	db tradeanim_tube_to_ot_command
ENDM

	enum_start $0e

	enum tradeanim_tube_to_player_command ; $0e
tradeanim_tube_to_player: MACRO
	db tradeanim_tube_to_player_command
ENDM

	enum_start $16

	enum tradeanim_sent_to_ot_text_command ; $16
tradeanim_sent_to_ot_text: MACRO
	db tradeanim_sent_to_ot_text_command
ENDM

	enum tradeanim_ot_bids_farewell_command ; $17
tradeanim_ot_bids_farewell: MACRO
	db tradeanim_ot_bids_farewell_command
ENDM

	enum tradeanim_take_care_of_text_command ; $18
tradeanim_take_care_of_text: MACRO
	db tradeanim_take_care_of_text_command
ENDM

	enum tradeanim_ot_sends_text_1_command ; $19
tradeanim_ot_sends_text_1: MACRO
	db tradeanim_ot_sends_text_1_command
ENDM

	enum tradeanim_ot_sends_text_2_command ; $1a
tradeanim_ot_sends_text_2: MACRO
	db tradeanim_ot_sends_text_2_command
ENDM

	enum tradeanim_setup_givemon_scroll_command ; $1b
tradeanim_setup_givemon_scroll: MACRO
	db tradeanim_setup_givemon_scroll_command
ENDM

	enum tradeanim_do_givemon_scroll_command ; $1c
tradeanim_do_givemon_scroll: MACRO
	db tradeanim_do_givemon_scroll_command
ENDM

	enum tradeanim_frontpic_scroll_command ; $1d
tradeanim_frontpic_scroll: MACRO
	db tradeanim_frontpic_scroll_command
ENDM

	enum tradeanim_textbox_scroll_command ; $1e
tradeanim_textbox_scroll: MACRO
	db tradeanim_textbox_scroll_command
ENDM

	enum tradeanim_scroll_out_right_command ; $1f
tradeanim_scroll_out_right: MACRO
	db tradeanim_scroll_out_right_command
ENDM

	enum_start $21

	enum tradeanim_wait_80_command ; $21
tradeanim_wait_80: MACRO
	db tradeanim_wait_80_command
ENDM

	enum tradeanim_rocking_ball_command ; $22
tradeanim_rocking_ball: MACRO
	db tradeanim_rocking_ball_command
ENDM

	enum tradeanim_drop_ball_command ; $23
tradeanim_drop_ball: MACRO
	db tradeanim_drop_ball_command
ENDM

	enum tradeanim_wait_anim_command ; $24
tradeanim_wait_anim: MACRO
	db tradeanim_wait_anim_command
ENDM

	enum tradeanim_poof_command ; $25
tradeanim_poof: MACRO
	db tradeanim_poof_command
ENDM

	enum tradeanim_bulge_through_tube_command ; $26
tradeanim_bulge_through_tube: MACRO
	db tradeanim_bulge_through_tube_command
ENDM

	enum tradeanim_give_trademon_sfx_command ; $27
tradeanim_give_trademon_sfx: MACRO
	db tradeanim_give_trademon_sfx_command
ENDM

	enum tradeanim_get_trademon_sfx_command ; $28
tradeanim_get_trademon_sfx: MACRO
	db tradeanim_get_trademon_sfx_command
ENDM

	enum tradeanim_end_command ; $29
tradeanim_end: MACRO
	db tradeanim_end_command
ENDM
