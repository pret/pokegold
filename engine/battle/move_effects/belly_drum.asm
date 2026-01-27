BattleCommand_BellyDrum:
; Fixed: Now checks HP before boosting Attack
; Belly Drum should fail if user has less than 50% HP

; First check if user has at least 50% HP
	callfar GetHalfMaxHP
	callfar CheckUserHasEnoughHP
	jr nc, .failed

; Check if Attack can be raised (not already maxed)
	call BattleCommand_AttackUp2
	ld a, [wAttackMissed]
	and a
	jr nz, .failed

	push bc
	call AnimateCurrentMove
	pop bc
	callfar SubtractHPFromUser
	call UpdateUserInParty

rept MAX_STAT_LEVEL - BASE_STAT_LEVEL - 1
	call BattleCommand_AttackUp2
endr

	ld hl, BellyDrumText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
