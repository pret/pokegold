; MovementPointers indexes (see engine/overworld/movement.asm)
	const_def 0, 4

; Directional movements

	const movement_turn_head ; $00
turn_head: MACRO
	db movement_turn_head | \1
ENDM

	const movement_turn_step ; $04
turn_step: MACRO
	db movement_turn_step | \1
ENDM

	const movement_slow_step ; $08
slow_step: MACRO
	db movement_slow_step | \1
ENDM

	const movement_step ; $0c
step: MACRO
	db movement_step | \1
ENDM

	const movement_big_step ; $10
big_step: MACRO
	db movement_big_step | \1
ENDM

	const movement_slow_slide_step ; $14
slow_slide_step: MACRO
	db movement_slow_slide_step | \1
ENDM

	const movement_slide_step ; $18
slide_step: MACRO
	db movement_slide_step | \1
ENDM

	const movement_fast_slide_step ; $1c
fast_slide_step: MACRO
	db movement_fast_slide_step | \1
ENDM

	const movement_turn_away ; $20
turn_away: MACRO
	db movement_turn_away | \1
ENDM

	const movement_turn_in ; $24
turn_in: MACRO
	db movement_turn_in | \1
ENDM

	const movement_turn_waterfall ; $28
turn_waterfall: MACRO
	db movement_turn_waterfall | \1
ENDM

	const movement_slow_jump_step ; $2c
slow_jump_step: MACRO
	db movement_slow_jump_step | \1
ENDM

	const movement_jump_step ; $30
jump_step: MACRO
	db movement_jump_step | \1
ENDM

	const movement_fast_jump_step ; $34
fast_jump_step: MACRO
	db movement_fast_jump_step | \1
ENDM

DEF const_inc = 1

; Control
	const movement_remove_sliding ; $38
remove_sliding: MACRO
	db movement_remove_sliding
ENDM

	const movement_set_sliding ; $39
set_sliding: MACRO
	db movement_set_sliding
ENDM

	const movement_remove_fixed_facing ; $3a
remove_fixed_facing: MACRO
	db movement_remove_fixed_facing
ENDM

	const movement_fix_facing ; $3b
fix_facing: MACRO
	db movement_fix_facing
ENDM

	const movement_show_object ; $3c
show_object: MACRO
	db movement_show_object
ENDM

	const movement_hide_object ; $3d
hide_object: MACRO
	db movement_hide_object
ENDM

; Sleep

	const movement_step_sleep ; $3e
step_sleep: MACRO
if \1 <= 8
	db movement_step_sleep + \1 - 1
else
	db movement_step_sleep + 8, \1
endc
ENDM

	const_skip 8 ; all step_sleep values

	const movement_step_end ; $47
step_end: MACRO
	db movement_step_end
ENDM

	const movement_step_48 ; $48
step_48: MACRO
	db movement_step_48
	db \1 ; ???
ENDM

	const movement_remove_object ; $49
remove_object: MACRO
	db movement_remove_object
ENDM

	const movement_step_loop ; $4a
step_loop: MACRO
	db movement_step_loop
ENDM

	const movement_step_4b ; $4b
step_4b: MACRO
	db movement_step_4b
ENDM

	const movement_teleport_from ; $4c
teleport_from: MACRO
	db movement_teleport_from
ENDM

	const movement_teleport_to ; $4d
teleport_to: MACRO
	db movement_teleport_to
ENDM

	const movement_skyfall ; $4e
skyfall: MACRO
	db movement_skyfall
ENDM

	const movement_step_dig ; $4f
step_dig: MACRO
	db movement_step_dig
	db \1 ; length
ENDM

	const movement_step_bump ; $50
step_bump: MACRO
	db movement_step_bump
ENDM

	const movement_fish_got_bite ; $51
fish_got_bite: MACRO
	db movement_fish_got_bite
ENDM

	const movement_fish_cast_rod ; $52
fish_cast_rod: MACRO
	db movement_fish_cast_rod
ENDM

	const movement_hide_emote ; $53
hide_emote: MACRO
	db movement_hide_emote
ENDM

	const movement_show_emote ; $54
show_emote: MACRO
	db movement_show_emote
ENDM

	const movement_step_shake ; $55
step_shake: MACRO
	db movement_step_shake
	db \1 ; displacement
ENDM

	const movement_tree_shake ; $56
tree_shake: MACRO
	db movement_tree_shake
ENDM

	const movement_rock_smash ; $57
rock_smash: MACRO
	db movement_rock_smash
	db \1 ; length
ENDM

	const movement_return_dig ; $58
return_dig: MACRO
	db movement_return_dig
	db \1 ; length
ENDM

DEF NUM_MOVEMENT_CMDS EQU const_value
