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

	; location, bit
	engine_flag ENGINE_RADIO_CARD
	engine_flag ENGINE_MAP_CARD
	engine_flag ENGINE_PHONE_CARD
	engine_flag ENGINE_EXPN_CARD
	engine_flag ENGINE_POKEGEAR

	engine_flag ENGINE_DAY_CARE_MAN_HAS_EGG
	engine_flag ENGINE_DAY_CARE_MAN_HAS_MON

	engine_flag ENGINE_DAY_CARE_LADY_HAS_MON

	engine_flag ENGINE_MOM_SAVING_MONEY
	engine_flag ENGINE_DST

	engine_flag ENGINE_0A

	engine_flag ENGINE_POKEDEX
	engine_flag ENGINE_UNOWN_DEX
	engine_flag ENGINE_POKERUS
	engine_flag ENGINE_ROCKET_SIGNAL_ON_CH20
	engine_flag ENGINE_CREDITS_SKIP
	engine_flag ENGINE_BUG_CONTEST_TIMER
	engine_flag ENGINE_SAFARI_ZONE
	engine_flag ENGINE_ROCKETS_IN_RADIO_TOWER
	engine_flag ENGINE_BIKE_SHOP_CALL_ENABLED
	engine_flag ENGINE_GIVE_POKERUS
	engine_flag ENGINE_FLORIA
	engine_flag ENGINE_ROCKETS_IN_MAHOGANY

	engine_flag ENGINE_STRENGTH_ACTIVE
	engine_flag ENGINE_ALWAYS_ON_BIKE
	engine_flag ENGINE_DOWNHILL

	engine_flag ENGINE_ZEPHYRBADGE
	engine_flag ENGINE_HIVEBADGE
	engine_flag ENGINE_PLAINBADGE
	engine_flag ENGINE_FOGBADGE
	engine_flag ENGINE_MINERALBADGE
	engine_flag ENGINE_STORMBADGE
	engine_flag ENGINE_GLACIERBADGE
	engine_flag ENGINE_RISINGBADGE

	engine_flag ENGINE_BOULDERBADGE
	engine_flag ENGINE_CASCADEBADGE
	engine_flag ENGINE_THUNDERBADGE
	engine_flag ENGINE_RAINBOWBADGE
	engine_flag ENGINE_SOULBADGE
	engine_flag ENGINE_MARSHBADGE
	engine_flag ENGINE_VOLCANOBADGE
	engine_flag ENGINE_EARTHBADGE

	engine_flag ENGINE_UNLOCKED_UNOWNS_1
	engine_flag ENGINE_UNLOCKED_UNOWNS_2
	engine_flag ENGINE_UNLOCKED_UNOWNS_3
	engine_flag ENGINE_UNLOCKED_UNOWNS_4
	engine_flag ENGINE_UNLOCKED_UNOWNS_5
	engine_flag ENGINE_UNLOCKED_UNOWNS_6
	engine_flag ENGINE_UNLOCKED_UNOWNS_7
	engine_flag ENGINE_UNLOCKED_UNOWNS_8

	engine_flag ENGINE_FLYPOINT_KRISS_HOUSE
	engine_flag ENGINE_FLYPOINT_VIRIDIAN_POKECENTER
	engine_flag ENGINE_FLYPOINT_PALLET
	engine_flag ENGINE_FLYPOINT_VIRIDIAN
	engine_flag ENGINE_FLYPOINT_PEWTER
	engine_flag ENGINE_FLYPOINT_CERULEAN
	engine_flag ENGINE_FLYPOINT_ROCK_TUNNEL
	engine_flag ENGINE_FLYPOINT_VERMILION
	engine_flag ENGINE_FLYPOINT_LAVENDER
	engine_flag ENGINE_FLYPOINT_SAFFRON
	engine_flag ENGINE_FLYPOINT_CELADON
	engine_flag ENGINE_FLYPOINT_FUCHSIA
	engine_flag ENGINE_FLYPOINT_CINNABAR
	engine_flag ENGINE_FLYPOINT_INDIGO_PLATEAU
	engine_flag ENGINE_FLYPOINT_NEW_BARK
	engine_flag ENGINE_FLYPOINT_CHERRYGROVE
	engine_flag ENGINE_FLYPOINT_VIOLET

	engine_flag ENGINE_FLYPOINT_AZALEA
	engine_flag ENGINE_FLYPOINT_CIANWOOD
	engine_flag ENGINE_FLYPOINT_GOLDENROD
	engine_flag ENGINE_FLYPOINT_OLIVINE
	engine_flag ENGINE_FLYPOINT_ECRUTEAK
	engine_flag ENGINE_FLYPOINT_MAHOGANY
	engine_flag ENGINE_FLYPOINT_LAKE_OF_RAGE
	engine_flag ENGINE_FLYPOINT_BLACKTHORN
	engine_flag ENGINE_FLYPOINT_SILVER_CAVE

	engine_flag ENGINE_FLYPOINT_UNUSED
	engine_flag ENGINE_LUCKY_NUMBER_SHOW
	engine_flag ENGINE_4E

	engine_flag ENGINE_KURT_MAKING_BALLS
	engine_flag ENGINE_DAILY_BUG_CONTEST
	engine_flag ENGINE_SPECIAL_WILDDATA
	engine_flag ENGINE_TIME_CAPSULE
	engine_flag ENGINE_ALL_FRUIT_TREES
	engine_flag ENGINE_SHUCKLE_GIVEN
	engine_flag ENGINE_GOLDENROD_UNDERGROUND_MERCHANT_CLOSED
	engine_flag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY

	engine_flag ENGINE_MT_MOON_SQUARE_CLEFAIRY
	engine_flag ENGINE_UNION_CAVE_LAPRAS
	engine_flag ENGINE_GOLDENROD_UNDERGROUND_GOT_HAIRCUT
	engine_flag ENGINE_GOLDENROD_MALL_5F_HAPPINESS_EVENT
	engine_flag ENGINE_TEA_IN_BLUES_HOUSE
	engine_flag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
