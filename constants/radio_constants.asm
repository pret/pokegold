; radio channel ids
; indexes for:
; - RadioChannelSongs (see data/radio/channel_music.asm)
; - PlayRadioShow/RadioJumptable (see engine/pokegear/radio.asm)
; - RadioChannels (see engine/pokegear/pokegear.asm)
	const_def
	const OAKS_POKEMON_TALK      ; 00
	const POKEDEX_SHOW           ; 01
	const POKEMON_MUSIC          ; 02
	const LUCKY_CHANNEL          ; 03
	const PLACES_AND_PEOPLE      ; 04
	const LETS_ALL_SING          ; 05
	const ROCKET_RADIO           ; 06
	const POKE_FLUTE_RADIO       ; 07
	const UNOWN_RADIO            ; 08
	const EVOLUTION_RADIO        ; 09
; internal indexes for channel segments
	const OAKS_POKEMON_TALK_2    ; 0a
	const OAKS_POKEMON_TALK_3    ; 0b
	const OAKS_POKEMON_TALK_4    ; 0c
	const OAKS_POKEMON_TALK_5    ; 0d
	const OAKS_POKEMON_TALK_6    ; 0e
	const OAKS_POKEMON_TALK_7    ; 0f
	const OAKS_POKEMON_TALK_8    ; 10
	const OAKS_POKEMON_TALK_9    ; 11
	const POKEDEX_SHOW_2         ; 12
	const POKEDEX_SHOW_3         ; 13
	const POKEDEX_SHOW_4         ; 14
	const POKEDEX_SHOW_5         ; 15
	const POKEMON_MUSIC_2        ; 16
	const POKEMON_MUSIC_3        ; 17
	const POKEMON_MUSIC_4        ; 18
	const POKEMON_MUSIC_5        ; 19
	const POKEMON_MUSIC_6        ; 1a
	const POKEMON_MUSIC_7        ; 1b
	const LETS_ALL_SING_2        ; 1c
	const LUCKY_NUMBER_SHOW_2    ; 1d
	const LUCKY_NUMBER_SHOW_3    ; 1e
	const LUCKY_NUMBER_SHOW_4    ; 1f
	const LUCKY_NUMBER_SHOW_5    ; 20
	const LUCKY_NUMBER_SHOW_6    ; 21
	const LUCKY_NUMBER_SHOW_7    ; 22
	const LUCKY_NUMBER_SHOW_8    ; 23
	const LUCKY_NUMBER_SHOW_9    ; 24
	const LUCKY_NUMBER_SHOW_10   ; 25
	const LUCKY_NUMBER_SHOW_11   ; 26
	const LUCKY_NUMBER_SHOW_12   ; 27
	const LUCKY_NUMBER_SHOW_13   ; 28
	const LUCKY_NUMBER_SHOW_14   ; 29
	const LUCKY_NUMBER_SHOW_15   ; 2a
	const PLACES_AND_PEOPLE_2    ; 2b
	const PLACES_AND_PEOPLE_3    ; 2c
	const PLACES_AND_PEOPLE_4    ; 2d
	const PLACES_AND_PEOPLE_5    ; 2e
	const PLACES_AND_PEOPLE_6    ; 2f
	const PLACES_AND_PEOPLE_7    ; 30
	const ROCKET_RADIO_2         ; 31
	const ROCKET_RADIO_3         ; 32
	const ROCKET_RADIO_4         ; 33
	const ROCKET_RADIO_5         ; 34
	const ROCKET_RADIO_6         ; 35
	const ROCKET_RADIO_7         ; 36
	const ROCKET_RADIO_8         ; 37
	const ROCKET_RADIO_9         ; 38
	const ROCKET_RADIO_10        ; 39
	const OAKS_POKEMON_TALK_10   ; 3a
	const OAKS_POKEMON_TALK_11   ; 3b
	const OAKS_POKEMON_TALK_12   ; 3c
	const OAKS_POKEMON_TALK_13   ; 3d
	const OAKS_POKEMON_TALK_14   ; 3e
	const RADIO_SCROLL           ; 3f
	const POKEDEX_SHOW_6         ; 40
	const POKEDEX_SHOW_7         ; 41
	const POKEDEX_SHOW_8         ; 42

; PlayRadio.StationPointers indexes (see engine/pokegear/pokegear.asm)
	const_def
	const MAPRADIO_POKEMON_CHANNEL
	const MAPRADIO_OAKS_POKEMON_TALK
	const MAPRADIO_POKEDEX_SHOW
	const MAPRADIO_POKEMON_MUSIC
	const MAPRADIO_LUCKY_CHANNEL
	const MAPRADIO_UNOWN
	const MAPRADIO_PLACES_PEOPLE
	const MAPRADIO_LETS_ALL_SING
	const MAPRADIO_ROCKET

; OaksPKMNTalkRoutes size (see data/radio/oaks_pkmn_talk_routes.asm)
NUM_OAKS_POKEMON_TALK_ROUTES EQU 15

; These tables in engine/pokegear/radio.asm are all sized to a power of 2
; so there's no need for a rejection sampling loop
NUM_OAKS_POKEMON_TALK_ADVERBS    EQU 16 ; OaksPKMNTalk8.Adverbs
NUM_OAKS_POKEMON_TALK_ADJECTIVES EQU 16 ; OaksPKMNTalk9.Adjectives
NUM_PNP_PEOPLE_ADJECTIVES        EQU 16 ; PeoplePlaces5.Adjectives
NUM_PNP_PLACES_ADJECTIVES        EQU 16 ; PeoplePlaces7.Adjectives
