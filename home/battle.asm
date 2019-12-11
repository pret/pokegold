UserPartyAttr:: ; 3b69
	push af
	ld a, [hBattleTurn]
	and a
	jr nz, .asm_3b72
	pop af
	jr BattlePartyAttr

.asm_3b72
	pop af
	jr OTPartyAttr

OpponentPartyAttr::
	push af
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3b7e
	pop af
	jr BattlePartyAttr

.asm_3b7e
	pop af
	jr OTPartyAttr

BattlePartyAttr::
	push bc
	ld c, a
	ld b, $0
	ld hl, wPartyMon1Species
	add hl, bc
	ld a, [wCurBattleMon]
	call GetPartyLocation
	pop bc
	ret

OTPartyAttr::
	push bc
	ld c, a
	ld b, $0
	ld hl, wOTPartyMon1Species
	add hl, bc
	ld a, [wCurOTMon]
	call GetPartyLocation
	pop bc
	ret

ResetDamage::
	xor a
	ld [wCurDamage], a
	ld [wCurDamage + 1], a
	ret

SetPlayerTurn::
	xor a
	ld [hBattleTurn], a
	ret

SetEnemyTurn::
	ld a, $1
	ld [hBattleTurn], a
	ret

UpdateOpponentInParty::
	ld a, [hBattleTurn]
	and a
	jr z, UpdateEnemyMonInParty
	jr UpdateBattleMonInParty

	ld a, [hBattleTurn]
	and a
	jr z, UpdateBattleMonInParty
	jr UpdateEnemyMonInParty

UpdateBattleMonInParty::
	ld a, [wCurBattleMon]
	ld hl, wPartyMon1Level
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, wBattleMonLevel
	ld bc, 5
	jp CopyBytes

UpdateEnemyMonInParty::
	ld a, [wBattleMode]
	dec a
	ret z
	ld a, [wCurOTMon]
	ld hl, wOTPartyMon1Level
	call GetPartyLocation
	ld d, h
	ld e, l
	ld hl, wEnemyMonLevel
	ld bc, 5
	jp CopyBytes

RefreshBattleHuds::
	call UpdateBattleHuds
	ld c, $3
	call DelayFrames
	jp WaitBGMap

UpdateBattleHuds:: ; 3bf8 (0:3bf8)
	farcall UpdatePlayerHUD
	farcall UpdateEnemyHUD
	ret

GetBattleVar::
	push hl
	call GetBattleVarAddr
	pop hl
	ret

GetBattleVarAddr:: ; 3c0b (0:3c0b)
	push bc
	ld hl, .battlevarpairs ; $3c2c
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hBattleTurn]
	and a
	jr z, .asm_3c1d
	inc hl
.asm_3c1d
	ld a, [hl]
	ld c, a
	ld b, $0
	ld hl, .vars
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	pop bc
	ret

.battlevarpairs
	dw .substatus1, .substatus2, .substatus3, .substatus4, .substatus5
	dw .substatus1opp, .substatus2opp, .substatus3opp, .substatus4opp, .substatus5opp
	dw .status, .statusopp, .animation, .effect, .power, .type
	dw .curmove, .lastcounter, .lastcounteropp, .lastmove, .lastmoveopp

;                       player                     enemy
.substatus1     db PLAYER_SUBSTATUS_1,    ENEMY_SUBSTATUS_1
.substatus1opp  db ENEMY_SUBSTATUS_1,     PLAYER_SUBSTATUS_1
.substatus2     db PLAYER_SUBSTATUS_2,    ENEMY_SUBSTATUS_2
.substatus2opp  db ENEMY_SUBSTATUS_2,     PLAYER_SUBSTATUS_2
.substatus3     db PLAYER_SUBSTATUS_3,    ENEMY_SUBSTATUS_3
.substatus3opp  db ENEMY_SUBSTATUS_3,     PLAYER_SUBSTATUS_3
.substatus4     db PLAYER_SUBSTATUS_4,    ENEMY_SUBSTATUS_4
.substatus4opp  db ENEMY_SUBSTATUS_4,     PLAYER_SUBSTATUS_4
.substatus5     db PLAYER_SUBSTATUS_5,    ENEMY_SUBSTATUS_5
.substatus5opp  db ENEMY_SUBSTATUS_5,     PLAYER_SUBSTATUS_5
.status         db PLAYER_STATUS,         ENEMY_STATUS
.statusopp      db ENEMY_STATUS,          PLAYER_STATUS
.animation      db PLAYER_MOVE_ANIMATION, ENEMY_MOVE_ANIMATION
.effect         db PLAYER_MOVE_EFFECT,    ENEMY_MOVE_EFFECT
.power          db PLAYER_MOVE_POWER,     ENEMY_MOVE_POWER
.type           db PLAYER_MOVE_TYPE,      ENEMY_MOVE_TYPE
.curmove        db PLAYER_CUR_MOVE,       ENEMY_CUR_MOVE
.lastcounter    db PLAYER_COUNTER_MOVE,   ENEMY_COUNTER_MOVE
.lastcounteropp db ENEMY_COUNTER_MOVE,    PLAYER_COUNTER_MOVE
.lastmove       db PLAYER_LAST_MOVE,      ENEMY_LAST_MOVE
.lastmoveopp    db ENEMY_LAST_MOVE,       PLAYER_LAST_MOVE

.vars
	dw wPlayerSubStatus1,            wEnemySubStatus1
	dw wPlayerSubStatus2,            wEnemySubStatus2
	dw wPlayerSubStatus3,            wEnemySubStatus3
	dw wPlayerSubStatus4,            wEnemySubStatus4
	dw wPlayerSubStatus5,            wEnemySubStatus5
	dw wBattleMonStatus,             wEnemyMonStatus
	dw wPlayerMoveStructAnimation,   wEnemyMoveStructAnimation
	dw wPlayerMoveStructEffect,      wEnemyMoveStructEffect
	dw wPlayerMoveStructPower,       wEnemyMoveStructPower
	dw wPlayerMoveStructType,        wEnemyMoveStructType
	dw wCurPlayerMove,               wCurEnemyMove
	dw wLastEnemyCounterMove,        wLastPlayerCounterMove
	dw wLastPlayerMove,              wLastEnemyMove

	db $23 ; ???

FarCopyRadioText::
	ld a, [hROMBank]
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ld a, e
	ld l, a
	ld a, d
	ld h, a
	ld de, wcef7
	ld bc, $28
	call CopyBytes
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret

StdBattleTextBox::
GLOBAL BattleText
	ld a, [hROMBank]
	push af
	ld a, BANK(BattleText) ; $40
	rst Bankswitch
	call PrintText
	pop af
	rst Bankswitch
	ret

GetBattleAnimPointer::

GLOBAL BattleAnimations
GLOBAL BattleAnimCommands

	ld a, BANK(BattleAnimations) ; $32
	rst Bankswitch
	ld a, [hli]
	ld [wca10], a
	ld a, [hl]
	ld [wca11], a
	ld a, BANK(BattleAnimCommands) ; $33
	rst Bankswitch
	ret

GetBattleAnimByte::
	push hl
	push de
	ld hl, wca10
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld a, BANK(BattleAnimations) ; $32
	rst Bankswitch

	ld a, [de]
	ld [wca17], a
	inc de

	ld a, BANK(BattleAnimCommands) ; $33
	rst Bankswitch

	ld [hl], d
	dec hl
	ld [hl], e
	pop de
	pop hl
	ld a, [wca17]
	ret
