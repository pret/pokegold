EngineFlagAction:: ; c01b
; Do action b on engine flag de
;
;   b = 0: reset flag
;     = 1: set flag
;     > 1: check flag, result in c
;
; Setting/resetting does not return a result.


; 16-bit flag ids are considered invalid, but it's nice
; to know that the infrastructure is there.

	ld a, d
	cp 0
	jr z, .ceiling
	jr c, .read ; cp 0 can't set carry!
	jr .invalid

; There are only $a2 engine flags, so
; anything beyond that is invalid too.

.ceiling
	ld a, e
	cp NUM_ENGINE_FLAGS
	jr c, .read

; Invalid flags are treated as flag 00.

.invalid
	xor a
	ld e, a
	ld d, a

; Get this flag's location.

.read
	ld hl, EngineFlags
; location
	add hl, de
	add hl, de
; bit
	add hl, de

; location
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; bit
	ld c, [hl]

; What are we doing with this flag?

	ld a, b
	cp 1
	jr c, .reset ; b = 0
	jr z, .set   ; b = 1

; Return the given flag in c.
.check
	ld a, [de]
	and c
	ld c, a
	ret

; Set the given flag.
.set
	ld a, [de]
	or c
	ld [de], a
	ret

; Reset the given flag.
.reset
	ld a, c
	cpl ; AND all bits except the one in question
	ld c, a
	ld a, [de]
	and c
	ld [de], a
	ret

; 404d
EngineFlags:
; All locations are in WRAM bank 1.
engine_flag: MACRO
	dwb \1, 1 << \2
ENDM
	; location, bit
	engine_flag wPokegearFlags, 1 ; radio card       ; $0
	engine_flag wPokegearFlags, 0 ; map card
	engine_flag wPokegearFlags, 2 ; phone card
	engine_flag wPokegearFlags, 3 ; expn card
	engine_flag wPokegearFlags, 7 ; on/off

	engine_flag wDayCareMan, 6 ; egg is ready
	engine_flag wDayCareMan, 0 ; monster 1 in daycare

	engine_flag wDaycareLady, 0 ; monster 2 in daycare

	engine_flag wMomSavingMoney, 0 ; mom saving money ; $8
	engine_flag wMomSavingMoney, 7 ; dst

	engine_flag wUnusedTwoDayTimerOn, 0 ; unused

	engine_flag wStatusFlags, 0 ; pokedex
	engine_flag wStatusFlags, 1 ; unown dex
	engine_flag wStatusFlags, 3 ; pokerus
	engine_flag wStatusFlags, 4 ; rocket signal on ch20
	engine_flag wStatusFlags, 6 ; credits skip
	engine_flag wStatusFlags2, 2 ; bug contest timer ; $10
	engine_flag wStatusFlags2, 1 ; safari zone?
	engine_flag wStatusFlags2, 0 ; rockets in radio tower
	engine_flag wStatusFlags2, 4 ; bike shop call enabled (1024 bike steps reqd)
	engine_flag wStatusFlags2, 5 ; give pokerus
	engine_flag wStatusFlags2, 6 ; berry -> berry juice when trading?
	engine_flag wStatusFlags2, 7 ; rockets in mahogany

	engine_flag wBikeFlags, 0 ; strength active
	engine_flag wBikeFlags, 1 ; always on bike (cant surf)  ; $18
	engine_flag wBikeFlags, 2 ; downhill (cycling road)

	engine_flag wJohtoBadges, 0 ; zephyrbadge
	engine_flag wJohtoBadges, 1 ; hivebadge
	engine_flag wJohtoBadges, 2 ; plainbadge
	engine_flag wJohtoBadges, 3 ; fogbadge
	engine_flag wJohtoBadges, 4 ; mineralbadge
	engine_flag wJohtoBadges, 5 ; stormbadge
	engine_flag wJohtoBadges, 6 ; glacierbadge ; $20
	engine_flag wJohtoBadges, 7 ; risingbadge

	engine_flag wKantoBadges, 0 ; boulderbadge
	engine_flag wKantoBadges, 1 ; cascadebadge
	engine_flag wKantoBadges, 2 ; thunderbadge
	engine_flag wKantoBadges, 3 ; rainbowbadge
	engine_flag wKantoBadges, 4 ; soulbadge
	engine_flag wKantoBadges, 5 ; marshbadge
	engine_flag wKantoBadges, 6 ; volcanobadge ; $28
	engine_flag wKantoBadges, 7 ; earthbadge

	engine_flag wUnlockedUnowns, 0
	engine_flag wUnlockedUnowns, 1
	engine_flag wUnlockedUnowns, 2
	engine_flag wUnlockedUnowns, 3
	engine_flag wUnlockedUnowns, 4
	engine_flag wUnlockedUnowns, 5
	engine_flag wUnlockedUnowns, 6   ; $30
	engine_flag wUnlockedUnowns, 7

	engine_flag wVisitedSpawns,     0 ; your house
	engine_flag wVisitedSpawns,     1 ; viridian pokecenter
	engine_flag wVisitedSpawns,     2 ; pallet
	engine_flag wVisitedSpawns,     3 ; viridian
	engine_flag wVisitedSpawns,     4 ; pewter
	engine_flag wVisitedSpawns,     5 ; cerulean
	engine_flag wVisitedSpawns,     6 ; rock tunnel ; $38
	engine_flag wVisitedSpawns,     7 ; vermilion
	engine_flag wVisitedSpawns + 1, 0 ; lavender
	engine_flag wVisitedSpawns + 1, 1 ; saffron
	engine_flag wVisitedSpawns + 1, 2 ; celadon
	engine_flag wVisitedSpawns + 1, 3 ; fuchsia
	engine_flag wVisitedSpawns + 1, 4 ; cinnabar
	engine_flag wVisitedSpawns + 1, 5 ; indigo plateau
	engine_flag wVisitedSpawns + 1, 6 ; new bark ; $40
	engine_flag wVisitedSpawns + 1, 7 ; cherrygrove
	engine_flag wVisitedSpawns + 2, 0 ; violet
                                      ; union cave
	engine_flag wVisitedSpawns + 2, 2 ; azalea
	engine_flag wVisitedSpawns + 2, 3 ; cianwood
	engine_flag wVisitedSpawns + 2, 4 ; goldenrod
	engine_flag wVisitedSpawns + 2, 5 ; olivine
	engine_flag wVisitedSpawns + 2, 6 ; ecruteak
	engine_flag wVisitedSpawns + 2, 7 ; mahogany  ; $48
	engine_flag wVisitedSpawns + 3, 0 ; lake of rage
	engine_flag wVisitedSpawns + 3, 1 ; blackthorn
	engine_flag wVisitedSpawns + 3, 2 ; silver cave
                                      ; fast ship
	engine_flag wVisitedSpawns + 3, 4 ; unused
	engine_flag wLuckyNumberShowFlag, 0
	engine_flag wStatusFlags2, 3

	engine_flag wDailyFlags, 0 ; kurt making balls
	engine_flag wDailyFlags, 1 ; did bug catching contest today ; $50
	engine_flag wDailyFlags, 2 ; special wilddata?
	engine_flag wDailyFlags, 3 ; time capsule (24h wait)
	engine_flag wDailyFlags, 4 ; all fruit trees
	engine_flag wDailyFlags, 5 ; shuckle given
	engine_flag wDailyFlags, 6 ; goldenrod underground merchant closed
	engine_flag wDailyFlags, 7 ; fought in trainer hall today

	engine_flag wWeeklyFlags, 0 ; mt moon square clefairy
	engine_flag wWeeklyFlags, 1 ; union cave lapras  ; $58
	engine_flag wWeeklyFlags, 2 ; goldenrod underground haircut used
	engine_flag wWeeklyFlags, 3 ; goldenrod mall happiness event floor05 person07
	engine_flag wWeeklyFlags, 4 ; tea in blues house
	engine_flag wWeeklyFlags, 5 ; indigo plateau rival fight
