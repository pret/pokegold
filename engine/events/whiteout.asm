Script_BattleWhiteout::
	callasm BattleBGMap
	sjump Script_Whiteout

OverworldWhiteoutScript::
	reanchormap
	callasm OverworldBGMap

Script_Whiteout:
	writetext .WhitedOutText
	waitbutton
	special FadeOutToWhite
	pause 40
	special HealParty
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .bug_contest
	callasm HalveMoney
	callasm GetWhiteoutSpawn
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	newloadmap MAPSETUP_WARP
	endall

.bug_contest
	jumpstd BugContestResultsWarpScript

.WhitedOutText:
	text_far _WhitedOutText
	text_end

OverworldBGMap:
	call ClearPalettes
	call ClearScreen
	call WaitBGMap2
	call HideSprites
	call RotateThreePalettesLeft
	ret

BattleBGMap:
	ld b, SCGB_BATTLE_GRAYSCALE
	call GetSGBLayout
	call SetDefaultBGPAndOBP
	ret

HalveMoney:
; Gen VI-style money loss: Level * (Badges + 1) * 8
; Much less punishing than halving all money
; e.g., Level 50 with 8 badges = 50 * 9 * 8 = 3600
	; Find highest level in party
	ld hl, wPartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPartyCount]
	and a
	jr z, .done ; no party = no loss
	ld d, a
	ld e, 0 ; highest level
.find_highest
	ld a, [hl]
	cp e
	jr c, .not_higher
	ld e, a
.not_higher
	add hl, bc
	dec d
	jr nz, .find_highest
	; e = highest level
	; Count badges
	push de
	ld hl, wBadges
	ld b, 2
	call CountSetBits
	ld a, [wNumSetBits]
	inc a ; badges + 1
	ld d, a ; d = badges+1
	pop bc ; b = highest level (was in e)
	ld c, b
	; Calculate: level * (badges+1)
	; Use repeated addition: hl = level * (badges+1)
	ld h, 0
	ld l, 0
.mult_loop
	ld a, l
	add c
	ld l, a
	ld a, h
	adc 0
	ld h, a
	dec d
	jr nz, .mult_loop
	; hl = level * (badges+1), now multiply by 8
	add hl, hl
	add hl, hl
	add hl, hl
	; hl = money to lose (max ~7200 at level 100, 16 badges)
	; Subtract from wMoney (3 bytes, big-endian)
	ld a, [wMoney + 2]
	sub l
	ld [wMoney + 2], a
	ld a, [wMoney + 1]
	sbc h
	ld [wMoney + 1], a
	ld a, [wMoney]
	sbc 0
	ld [wMoney], a
	; If carry, we went negative - set to 0
	ret nc
	xor a
	ld [wMoney], a
	ld [wMoney + 1], a
	ld [wMoney + 2], a
.done
	ret

GetWhiteoutSpawn:
	ld a, [wLastSpawnMapGroup]
	ld d, a
	ld a, [wLastSpawnMapNumber]
	ld e, a
	farcall IsSpawnPoint
	ld a, c
	jr c, .yes
	xor a ; SPAWN_HOME

.yes
	ld [wDefaultSpawnpoint], a
	ret
