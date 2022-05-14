BattleCommand_Present:
	call BattleCommand_Stab
	ld a, [wTypeMatchup]
	and a
	jp z, AnimateFailedMove
	ld a, [wAttackMissed]
	and a
	jp nz, AnimateFailedMove

	push bc
	call BattleRandom
	ld b, a
	ld hl, PresentPower
	ld c, 0
.next
	ld a, [hli]
	cp -1
	jr z, .heal_effect
	cp b
	jr nc, .got_power
	inc c
	inc hl
	jr .next

.got_power
	ld a, c
	ld [wBattleAnimParam], a
	call AnimateCurrentMoveEitherSide
	ld d, [hl]
	pop bc
	ret

.heal_effect
	pop bc
	ld a, $3 ; heal animation
	ld [wBattleAnimParam], a
	call AnimateCurrentMove
	call BattleCommand_SwitchTurn
	ld hl, AICheckPlayerMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp_fn_pointer
	ld hl, AICheckEnemyMaxHP
.got_hp_fn_pointer
	ld a, BANK(AICheckPlayerMaxHP) ; aka BANK(AICheckEnemyMaxHP)
	rst FarCall
	jr c, .already_fully_healed

	ld hl, GetQuarterMaxHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	ld hl, RestoreHP
	call CallBattleCore
	call BattleCommand_SwitchTurn
	ld hl, RegainedHealthText
	call StdBattleTextbox
	call BattleCommand_SwitchTurn
	call UpdateOpponentInParty
	jr .do_animation

.already_fully_healed
	call BattleCommand_SwitchTurn
	; check battle scene
	ld a, [wOptions]
	add a
	jr nc, .do_animation
	call AnimateFailedMove
	ld hl, PresentFailedText
	call StdBattleTextbox
.do_animation
	jp EndMoveEffect

INCLUDE "data/moves/present_power.asm"
