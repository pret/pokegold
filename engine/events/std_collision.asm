CheckFacingTileForStdScript::
; Checks to see if the tile you're facing has a std script associated with it.  If so, executes the script and returns carry.
	ld a, c
	ld de, 3
	ld hl, TileCollisionStdScripts
	call IsInArray
	jr nc, .notintable

	ld a, jumpstd_command
	ld [wcf2a], a
	inc hl
	ld a, [hli]
	ld [wcf2b], a
	ld a, [hli]
	ld [wTempTrainer], a
	ld a, BANK(Script_JumpStdFromRAM)
	ld hl, Script_JumpStdFromRAM
	call CallScript
	scf
	ret

.notintable
	xor a
	ret

INCLUDE "data/events/collision_stdscripts.asm"

Script_JumpStdFromRAM:
	jump wcf2a