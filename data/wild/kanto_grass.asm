; Kanto Pokémon in grass

KantoGrassWildMons:

	map_id DIGLETTS_CAVE
	db 4 percent, 2 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 15, DIGLETT
	db 17, DIGLETT
	db 19, DIGLETT
	db 13, DIGLETT
	db 19, DUGTRIO
	db 24, DUGTRIO
	db 29, DUGTRIO
	; day
	db 15, DIGLETT
	db 17, DIGLETT
	db 19, DIGLETT
	db 13, DIGLETT
	db 19, DUGTRIO
	db 24, DUGTRIO
	db 29, DUGTRIO
	; nite
	db 15, DIGLETT
	db 17, DIGLETT
	db 19, DIGLETT
	db 13, DIGLETT
	db 19, DUGTRIO
	db 24, DUGTRIO
	db 29, DUGTRIO

	map_id MOUNT_MOON
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 6, ZUBAT
	db 8, GEODUDE
	db 8, SANDSHREW
	db 12, PARAS
	db 10, SANDSLASH
	db 8, CLEFAIRY
	db 8, CLEFAIRY
	; day
	db 6, ZUBAT
	db 8, GEODUDE
	db 8, SANDSHREW
	db 12, PARAS
	db 10, SANDSLASH
	db 8, CLEFAIRY
	db 8, CLEFAIRY
	; nite
	db 6, ZUBAT
	db 8, GEODUDE
	db 8, SANDSHREW
	db 12, PARAS
	db 10, SANDSLASH
	db 8, CLEFAIRY
	db 8, CLEFAIRY

	ELIF DEF(_SILVER)
	; morn
	db 6, ZUBAT
	db 8, GEODUDE
	db 8, ZUBAT
	db 12, PARAS
	db 10, GEODUDE
	db 8, CLEFAIRY
	db 8, CLEFAIRY
	; day
	db 6, ZUBAT
	db 8, GEODUDE
	db 8, ZUBAT
	db 12, PARAS
	db 10, GEODUDE
	db 8, CLEFAIRY
	db 8, CLEFAIRY
	; nite
	db 6, ZUBAT
	db 8, GEODUDE
	db 8, ZUBAT
	db 12, PARAS
	db 10, GEODUDE
	db 8, CLEFAIRY
	db 8, CLEFAIRY
	ENDC

	map_id ROCK_TUNNEL_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 10, CUBONE
	db 10, GEODUDE
	db 12, MACHOP
	db 8, ZUBAT
	db 14, MACHOKE
	db 13, CUBONE
	db 13, CUBONE
	; day
	db 10, CUBONE
	db 10, GEODUDE
	db 12, MACHOP
	db 8, ZUBAT
	db 14, MACHOKE
	db 13, CUBONE
	db 13, CUBONE
	; nite
	db 10, CUBONE
	db 10, GEODUDE
	db 12, MACHOP
	db 8, ZUBAT
	db 14, MACHOKE
	db 13, CUBONE
	db 13, CUBONE

	map_id ROCK_TUNNEL_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 12, CUBONE
	db 12, GEODUDE
	db 16, ONIX
	db 10, ZUBAT
	db 14, MAROWAK
	db 14, KANGASKHAN
	db 14, KANGASKHAN
	; day
	db 12, CUBONE
	db 12, GEODUDE
	db 16, ONIX
	db 10, ZUBAT
	db 14, MAROWAK
	db 14, KANGASKHAN
	db 14, KANGASKHAN
	; nite
	db 12, CUBONE
	db 12, GEODUDE
	db 16, ONIX
	db 10, ZUBAT
	db 14, MAROWAK
	db 14, KANGASKHAN
	db 14, KANGASKHAN

	map_id VICTORY_ROAD
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 32, GRAVELER
	db 32, GOLBAT
	db 33, URSARING
	db 34, ONIX
	db 36, ONIX
	db 35, RHYHORN
	db 35, RHYHORN
	; day
	db 32, GRAVELER
	db 32, GOLBAT
	db 33, URSARING
	db 34, ONIX
	db 36, ONIX
	db 35, RHYHORN
	db 35, RHYHORN
	; nite
	db 32, GRAVELER
	db 32, GOLBAT
	db 33, URSARING
	db 34, ONIX
	db 36, ONIX
	db 35, RHYHORN
	db 35, RHYHORN

	ELIF DEF(_SILVER)
	; morn
	db 32, GRAVELER
	db 32, GOLBAT
	db 33, DONPHAN
	db 34, ONIX
	db 36, ONIX
	db 35, RHYHORN
	db 35, RHYHORN
	; day
	db 32, GRAVELER
	db 32, GOLBAT
	db 33, DONPHAN
	db 34, ONIX
	db 36, ONIX
	db 35, RHYHORN
	db 35, RHYHORN
	; nite
	db 32, GRAVELER
	db 32, GOLBAT
	db 33, DONPHAN
	db 34, ONIX
	db 36, ONIX
	db 35, RHYHORN
	db 35, RHYHORN
	ENDC

	map_id TOHJO_FALLS
	IF DEF(_GOLD)
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	ELIF DEF(_SILVER)
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	ENDC
	; morn
	db 22, ZUBAT
	db 22, RATICATE
	db 22, GOLBAT
	db 21, SLOWPOKE
	db 20, RATTATA
	db 23, SLOWPOKE
	db 23, SLOWPOKE
	; day
	db 22, ZUBAT
	db 22, RATICATE
	db 22, GOLBAT
	db 21, SLOWPOKE
	db 20, RATTATA
	db 23, SLOWPOKE
	db 23, SLOWPOKE
	; nite
	db 22, ZUBAT
	db 22, RATICATE
	db 22, GOLBAT
	db 21, SLOWPOKE
	db 20, RATTATA
	db 23, SLOWPOKE
	db 23, SLOWPOKE

	map_id ROUTE_1
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 2, PIDGEY
	db 2, RATTATA
	db 3, SENTRET
	db 3, PIDGEY
	db 6, FURRET
	db 4, PIDGEY
	db 4, PIDGEY
	; day
	db 2, PIDGEY
	db 2, RATTATA
	db 3, SENTRET
	db 3, PIDGEY
	db 6, FURRET
	db 4, PIDGEY
	db 4, PIDGEY
	; nite
	db 2, HOOTHOOT
	db 2, RATTATA
	db 3, RATTATA
	db 3, HOOTHOOT
	db 6, RATTATA
	db 4, HOOTHOOT
	db 4, HOOTHOOT

	map_id ROUTE_2
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 3, CATERPIE
	db 3, PIDGEY
	db 5, METAPOD
	db 7, BUTTERFREE
	db 7, PIDGEOTTO
	db 4, PIKACHU
	db 4, PIKACHU
	; day
	db 3, CATERPIE
	db 3, PIDGEY
	db 5, METAPOD
	db 7, PIDGEY
	db 7, PIDGEOTTO
	db 4, PIKACHU
	db 4, PIKACHU
	; nite
	db 3, HOOTHOOT
	db 3, SPINARAK
	db 5, HOOTHOOT
	db 7, NOCTOWL
	db 7, ARIADOS
	db 4, PIKACHU
	db 4, PIKACHU

	ELIF DEF(_SILVER)
	; morn
	db 3, WEEDLE
	db 3, LEDYBA
	db 5, KAKUNA
	db 7, BEEDRILL
	db 7, LEDIAN
	db 4, PIKACHU
	db 4, PIKACHU
	; day
	db 3, WEEDLE
	db 3, PIDGEY
	db 5, KAKUNA
	db 7, PIDGEY
	db 7, PIDGEOTTO
	db 4, PIKACHU
	db 4, PIKACHU
	; nite
	db 3, HOOTHOOT
	db 3, HOOTHOOT
	db 5, HOOTHOOT
	db 7, NOCTOWL
	db 7, NOCTOWL
	db 4, PIKACHU
	db 4, PIKACHU
	ENDC

	map_id ROUTE_3
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 5, SPEAROW
	db 5, RATTATA
	db 8, SPEAROW
	db 6, JIGGLYPUFF
	db 10, RATTATA
	db 8, SPEAROW
	db 8, SPEAROW
	; day
	db 5, SPEAROW
	db 5, RATTATA
	db 8, SPEAROW
	db 6, JIGGLYPUFF
	db 10, RATTATA
	db 8, SPEAROW
	db 8, SPEAROW
	; nite
	db 5, RATTATA
	db 5, ZUBAT
	db 8, RATTATA
	db 6, JIGGLYPUFF
	db 10, RATTATA
	db 8, RATTATA
	db 8, RATTATA

	ELIF DEF(_SILVER)
	; morn
	db 5, SPEAROW
	db 5, RATTATA
	db 8, EKANS
	db 6, JIGGLYPUFF
	db 10, ARBOK
	db 8, SPEAROW
	db 8, SPEAROW
	; day
	db 5, SPEAROW
	db 5, RATTATA
	db 8, EKANS
	db 6, JIGGLYPUFF
	db 10, ARBOK
	db 8, SPEAROW
	db 8, SPEAROW
	; nite
	db 5, RATTATA
	db 5, ZUBAT
	db 8, EKANS
	db 6, JIGGLYPUFF
	db 10, ARBOK
	db 8, RATTATA
	db 8, RATTATA
	ENDC

	map_id ROUTE_4
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn

	IF DEF(_GOLD)
	; morn
	db 5, SPEAROW
	db 5, RATTATA
	db 8, SPEAROW
	db 6, JIGGLYPUFF
	db 10, RATTATA
	db 8, SPEAROW
	db 8, SPEAROW
	; day
	db 5, SPEAROW
	db 5, RATTATA
	db 8, SPEAROW
	db 6, JIGGLYPUFF
	db 10, RATTATA
	db 8, SPEAROW
	db 8, SPEAROW
	; nite
	db 5, SPEAROW
	db 5, ZUBAT
	db 8, RATTATA
	db 6, JIGGLYPUFF
	db 10, RATTATA
	db 8, RATTATA
	db 8, RATTATA

	ELIF DEF(_SILVER)
	; morn
	db 5, SPEAROW
	db 5, RATTATA
	db 8, EKANS
	db 6, JIGGLYPUFF
	db 10, ARBOK
	db 8, SPEAROW
	db 8, SPEAROW
	; day
	db 5, SPEAROW
	db 5, RATTATA
	db 8, EKANS
	db 6, JIGGLYPUFF
	db 10, ARBOK
	db 8, SPEAROW
	db 8, SPEAROW
	; nite
	db 5, RATTATA
	db 5, ZUBAT
	db 8, EKANS
	db 6, JIGGLYPUFF
	db 10, ARBOK
	db 8, RATTATA
	db 8, RATTATA
	ENDC

	map_id ROUTE_5
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 13, PIDGEY
	db 13, BELLSPROUT
	db 14, PIDGEY
	db 15, PIDGEY
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	; day
	db 13, PIDGEY
	db 13, BELLSPROUT
	db 14, PIDGEY
	db 15, PIDGEY
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	; nite
	db 13, ODDISH
	db 14, ODDISH
	db 13, BELLSPROUT
	db 15, GLOOM
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA

	ELIF DEF(_SILVER)
	; morn
	db 13, PIDGEY
	db 13, BELLSPROUT
	db 14, MEOWTH
	db 15, PIDGEY
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	; day
	db 13, PIDGEY
	db 13, BELLSPROUT
	db 14, MEOWTH
	db 15, PIDGEY
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	; nite
	db 13, ODDISH
	db 14, MEOWTH
	db 13, BELLSPROUT
	db 15, GLOOM
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	ENDC

	map_id ROUTE_6
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 13, PIDGEY
	db 13, BELLSPROUT
	db 14, PIDGEY
	db 15, MAGNEMITE
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	; day
	db 13, PIDGEY
	db 13, BELLSPROUT
	db 14, PIDGEY
	db 15, MAGNEMITE
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	; nite
	db 13, ODDISH
	db 14, ODDISH
	db 13, BELLSPROUT
	db 15, MAGNEMITE
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA

	ELIF DEF(_SILVER)
	; morn
	db 13, PIDGEY
	db 13, BELLSPROUT
	db 14, MEOWTH
	db 15, MAGNEMITE
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	; day
	db 13, PIDGEY
	db 13, BELLSPROUT
	db 14, MEOWTH
	db 15, MAGNEMITE
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	; nite
	db 13, ODDISH
	db 14, MEOWTH
	db 13, BELLSPROUT
	db 15, MAGNEMITE
	db 12, ABRA
	db 14, ABRA
	db 14, ABRA
	ENDC

	map_id ROUTE_7
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 17, RATTATA
	db 17, SPEAROW
	db 18, GROWLITHE
	db 19, RATICATE
	db 19, RATTATA
	db 15, RATTATA
	db 15, RATTATA
	; day
	db 17, RATTATA
	db 17, SPEAROW
	db 18, GROWLITHE
	db 19, RATICATE
	db 19, RATTATA
	db 15, GROWLITHE
	db 15, GROWLITHE
	; nite
	db 17, RATTATA
	db 17, MURKROW
	db 18, GROWLITHE
	db 19, RATICATE
	db 19, MURKROW
	db 15, HOUNDOUR
	db 15, HOUNDOUR

	ELIF DEF(_SILVER)
	; morn
	db 17, MEOWTH
	db 17, SPEAROW
	db 18, VULPIX
	db 19, RATICATE
	db 19, PERSIAN
	db 15, RATTATA
	db 15, RATTATA
	; day
	db 17, MEOWTH
	db 17, SPEAROW
	db 18, VULPIX
	db 19, RATICATE
	db 19, PERSIAN
	db 15, VULPIX
	db 15, VULPIX
	; nite
	db 17, MEOWTH
	db 17, MURKROW
	db 18, VULPIX
	db 19, RATICATE
	db 19, PERSIAN
	db 15, HOUNDOUR
	db 15, HOUNDOUR
	ENDC

	map_id ROUTE_8
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 17, PIDGEOTTO
	db 19, PIDGEOTTO
	db 15, ABRA
	db 18, GROWLITHE
	db 17, PIDGEOTTO
	db 15, KADABRA
	db 15, KADABRA
	; day
	db 17, PIDGEOTTO
	db 19, PIDGEOTTO
	db 15, ABRA
	db 18, GROWLITHE
	db 17, PIDGEOTTO
	db 15, KADABRA
	db 15, KADABRA
	; nite
	db 17, NOCTOWL
	db 20, HAUNTER
	db 15, ABRA
	db 19, NOCTOWL
	db 18, GROWLITHE
	db 15, KADABRA
	db 15, KADABRA

	ELIF DEF(_SILVER)
	; morn
	db 17, MEOWTH
	db 19, PIDGEOTTO
	db 15, ABRA
	db 18, VULPIX
	db 17, PIDGEOTTO
	db 15, KADABRA
	db 15, KADABRA
	; day
	db 17, MEOWTH
	db 19, PIDGEOTTO
	db 15, ABRA
	db 18, VULPIX
	db 17, PIDGEOTTO
	db 15, KADABRA
	db 15, KADABRA
	; nite
	db 17, MEOWTH
	db 20, HAUNTER
	db 15, ABRA
	db 19, NOCTOWL
	db 18, VULPIX
	db 15, KADABRA
	db 15, KADABRA
	ENDC

	map_id ROUTE_9
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 13, MANKEY
	db 15, RATTATA
	db 13, SPEAROW
	db 15, RATICATE
	db 15, FEAROW
	db 15, PRIMEAPE
	db 15, PRIMEAPE
	; day
	db 13, MANKEY
	db 15, RATTATA
	db 13, SPEAROW
	db 15, RATICATE
	db 15, FEAROW
	db 15, PRIMEAPE
	db 15, PRIMEAPE
	; nite
	db 13, MANKEY
	db 15, RATTATA
	db 15, RATICATE
	db 13, RATTATA
	db 15, RATICATE
	db 15, PRIMEAPE
	db 15, PRIMEAPE

	ELIF DEF(_SILVER)
	; morn
	db 13, RATTATA
	db 15, SPEAROW
	db 13, SPEAROW
	db 15, RATICATE
	db 15, FEAROW
	db 15, RATICATE
	db 15, RATICATE
	; day
	db 13, RATTATA
	db 15, SPEAROW
	db 13, SPEAROW
	db 15, RATICATE
	db 15, FEAROW
	db 15, RATICATE
	db 15, RATICATE
	; nite
	db 13, RATTATA
	db 15, RATTATA
	db 15, RATICATE
	db 13, RATTATA
	db 15, RATICATE
	db 15, RATICATE
	db 15, RATICATE
	ENDC

	map_id ROUTE_10_NORTH
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 16, SPEAROW
	db 17, VOLTORB
	db 16, RATICATE
	db 18, FEAROW
	db 16, QUAGSIRE
	db 15, ELECTABUZZ
	db 15, ELECTABUZZ
	; day
	db 16, SPEAROW
	db 17, VOLTORB
	db 17, RATICATE
	db 18, FEAROW
	db 15, ELECTABUZZ
	db 17, ELECTABUZZ
	db 17, ELECTABUZZ
	; nite
	db 16, QUAGSIRE
	db 17, VOLTORB
	db 16, RATICATE
	db 17, QUAGSIRE
	db 18, RATICATE
	db 15, ELECTABUZZ
	db 15, ELECTABUZZ

	map_id ROUTE_11
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 14, DROWZEE
	db 15, RATTATA
	db 15, MAGNEMITE
	db 16, DROWZEE
	db 16, HYPNO
	db 16, HYPNO
	db 16, HYPNO
	; day
	db 14, DROWZEE
	db 15, RATTATA
	db 15, MAGNEMITE
	db 16, DROWZEE
	db 16, HYPNO
	db 16, HYPNO
	db 16, HYPNO
	; nite
	db 14, DROWZEE
	db 15, RATTATA
	db 15, MAGNEMITE
	db 16, DROWZEE
	db 16, HYPNO
	db 16, HYPNO
	db 16, HYPNO

	map_id ROUTE_13
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 23, NIDORINA
	db 23, NIDORINO
	db 25, PIDGEOTTO
	db 22, HOPPIP
	db 24, HOPPIP
	db 22, QUAGSIRE
	db 25, CHANSEY
	; day
	db 23, NIDORINA
	db 23, NIDORINO
	db 25, PIDGEOTTO
	db 22, HOPPIP
	db 24, HOPPIP
	db 24, HOPPIP
	db 25, CHANSEY
	; nite
	db 23, NIDORINA
	db 23, NIDORINO
	db 25, NOCTOWL
	db 22, QUAGSIRE
	db 24, QUAGSIRE
	db 24, QUAGSIRE
	db 25, CHANSEY

	ELIF DEF(_SILVER)
	; morn
	db 23, NIDORINO
	db 23, NIDORINA
	db 25, PIDGEOTTO
	db 22, HOPPIP
	db 24, HOPPIP
	db 22, QUAGSIRE
	db 25, CHANSEY
	; day
	db 23, NIDORINO
	db 23, NIDORINA
	db 25, PIDGEOTTO
	db 22, HOPPIP
	db 24, HOPPIP
	db 24, HOPPIP
	db 25, CHANSEY
	; nite
	db 23, NIDORINO
	db 23, NIDORINA
	db 25, NOCTOWL
	db 22, QUAGSIRE
	db 24, QUAGSIRE
	db 24, QUAGSIRE
	db 25, CHANSEY
	ENDC

	map_id ROUTE_14
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 23, NIDORINA
	db 23, NIDORINO
	db 25, PIDGEOTTO
	db 24, HOPPIP
	db 26, SKIPLOOM
	db 22, QUAGSIRE
	db 25, CHANSEY
	; day
	db 23, NIDORINA
	db 23, NIDORINO
	db 25, PIDGEOTTO
	db 24, HOPPIP
	db 26, SKIPLOOM
	db 26, SKIPLOOM
	db 25, CHANSEY
	; nite
	db 23, NIDORINA
	db 23, NIDORINO
	db 25, NOCTOWL
	db 22, QUAGSIRE
	db 24, QUAGSIRE
	db 24, QUAGSIRE
	db 25, CHANSEY

	ELIF DEF(_SILVER)
	; morn
	db 23, NIDORINO
	db 23, NIDORINA
	db 25, PIDGEOTTO
	db 24, HOPPIP
	db 26, SKIPLOOM
	db 22, QUAGSIRE
	db 25, CHANSEY
	; day
	db 23, NIDORINO
	db 23, NIDORINA
	db 25, PIDGEOTTO
	db 24, HOPPIP
	db 26, SKIPLOOM
	db 26, SKIPLOOM
	db 25, CHANSEY
	; nite
	db 23, NIDORINO
	db 23, NIDORINA
	db 25, NOCTOWL
	db 22, QUAGSIRE
	db 24, QUAGSIRE
	db 24, QUAGSIRE
	db 25, CHANSEY
	ENDC

	map_id ROUTE_15
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 23, NIDORINA
	db 23, NIDORINO
	db 25, PIDGEOTTO
	db 22, HOPPIP
	db 24, HOPPIP
	db 22, QUAGSIRE
	db 25, CHANSEY
	; day
	db 23, NIDORINA
	db 23, NIDORINO
	db 25, PIDGEOTTO
	db 22, HOPPIP
	db 24, HOPPIP
	db 24, HOPPIP
	db 25, CHANSEY
	; nite
	db 23, NIDORINA
	db 23, NIDORINO
	db 25, NOCTOWL
	db 22, QUAGSIRE
	db 24, QUAGSIRE
	db 24, QUAGSIRE
	db 25, CHANSEY

	ELIF DEF(_SILVER)
	; morn
	db 23, NIDORINO
	db 23, NIDORINA
	db 25, PIDGEOTTO
	db 22, HOPPIP
	db 24, HOPPIP
	db 22, QUAGSIRE
	db 25, CHANSEY
	; day
	db 23, NIDORINO
	db 23, NIDORINA
	db 25, PIDGEOTTO
	db 22, HOPPIP
	db 24, HOPPIP
	db 24, HOPPIP
	db 25, CHANSEY
	; nite
	db 23, NIDORINO
	db 23, NIDORINA
	db 25, NOCTOWL
	db 22, QUAGSIRE
	db 24, QUAGSIRE
	db 24, QUAGSIRE
	db 25, CHANSEY
	ENDC

	map_id ROUTE_16
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 26, GRIMER
	db 27, FEAROW
	db 28, GRIMER
	db 29, FEAROW
	db 27, SLUGMA
	db 30, MUK
	db 30, MUK
	; day
	db 26, GRIMER
	db 27, FEAROW
	db 28, GRIMER
	db 29, FEAROW
	db 27, SLUGMA
	db 30, MUK
	db 30, MUK
	; nite
	db 26, GRIMER
	db 27, GRIMER
	db 28, GRIMER
	db 28, MURKROW
	db 27, SLUGMA
	db 30, MUK
	db 30, MUK

	map_id ROUTE_17
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 28, FEAROW
	db 27, GRIMER
	db 29, GRIMER
	db 30, FEAROW
	db 29, SLUGMA
	db 32, MUK
	db 32, MUK
	; day
	db 28, FEAROW
	db 27, SLUGMA
	db 29, GRIMER
	db 30, FEAROW
	db 25, SLUGMA
	db 32, MUK
	db 32, MUK
	; nite
	db 28, GRIMER
	db 27, GRIMER
	db 29, GRIMER
	db 30, MUK
	db 29, SLUGMA
	db 32, MUK
	db 32, MUK

	map_id ROUTE_18
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 26, GRIMER
	db 27, FEAROW
	db 28, GRIMER
	db 29, FEAROW
	db 27, SLUGMA
	db 30, MUK
	db 30, MUK
	; day
	db 26, GRIMER
	db 27, FEAROW
	db 28, GRIMER
	db 29, FEAROW
	db 27, SLUGMA
	db 30, MUK
	db 30, MUK
	; nite
	db 26, GRIMER
	db 27, GRIMER
	db 28, GRIMER
	db 28, MUK
	db 27, SLUGMA
	db 30, MUK
	db 30, MUK

	map_id ROUTE_21
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 30, TANGELA
	db 25, TANGELA
	db 35, TANGELA
	db 20, TANGELA
	db 30, TANGELA
	db 28, MR__MIME
	db 28, MR__MIME
	; day
	db 30, TANGELA
	db 25, TANGELA
	db 35, TANGELA
	db 20, TANGELA
	db 28, MR__MIME
	db 30, MR__MIME
	db 30, MR__MIME
	; nite
	db 30, TANGELA
	db 25, TANGELA
	db 35, TANGELA
	db 20, TANGELA
	db 30, TANGELA
	db 28, MR__MIME
	db 28, MR__MIME

	map_id ROUTE_22
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 3, RATTATA
	db 3, SPEAROW
	db 5, SPEAROW
	db 4, DODUO
	db 6, PONYTA
	db 7, FEAROW
	db 7, FEAROW
	; day
	db 3, RATTATA
	db 3, SPEAROW
	db 5, SPEAROW
	db 4, DODUO
	db 6, PONYTA
	db 7, FEAROW
	db 7, FEAROW
	; nite
	db 3, RATTATA
	db 3, RATTATA
	db 5, RATTATA
	db 4, RATTATA
	db 6, PONYTA
	db 7, RATTATA
	db 7, RATTATA

	map_id ROUTE_24
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 8, BELLSPROUT
	db 10, BELLSPROUT
	db 9, ABRA
	db 12, WEEPINBELL
	db 8, VENONAT
	db 14, WEEPINBELL
	db 14, WEEPINBELL
	; day
	db 8, BELLSPROUT
	db 10, SUNKERN
	db 9, ABRA
	db 12, WEEPINBELL
	db 10, BELLSPROUT
	db 14, WEEPINBELL
	db 14, WEEPINBELL
	; nite
	db 8, VENONAT
	db 10, ODDISH
	db 9, ABRA
	db 13, WEEPINBELL
	db 10, BELLSPROUT
	db 10, VENOMOTH
	db 10, VENOMOTH

	map_id ROUTE_25
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 8, PIDGEY
	db 10, BELLSPROUT
	db 8, VENONAT
	db 9, ABRA
	db 10, PIDGEOTTO
	db 14, WEEPINBELL
	db 14, WEEPINBELL
	; day
	db 8, PIDGEY
	db 10, BELLSPROUT
	db 10, PIDGEY
	db 9, ABRA
	db 12, PIDGEOTTO
	db 14, WEEPINBELL
	db 14, WEEPINBELL
	; nite
	db 8, VENONAT
	db 10, ODDISH
	db 10, VENOMOTH
	db 9, ABRA
	db 14, WEEPINBELL
	db 10, BELLSPROUT
	db 10, BELLSPROUT

	map_id ROUTE_26
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 28, DODUO
	db 28, SANDSLASH
	db 32, PONYTA
	db 30, DODUO
	db 30, DODRIO
	db 30, RATICATE
	db 30, QUAGSIRE
	; day
	db 28, DODUO
	db 28, SANDSLASH
	db 32, PONYTA
	db 30, DODUO
	db 30, RATICATE
	db 30, DODRIO
	db 30, DODRIO
	; nite
	db 28, RATICATE
	db 28, SANDSLASH
	db 32, PONYTA
	db 30, RATICATE
	db 30, QUAGSIRE
	db 32, QUAGSIRE
	db 32, QUAGSIRE

	ELIF DEF(_SILVER)
	; morn
	db 28, DODUO
	db 28, RATICATE
	db 32, PONYTA
	db 30, DODUO
	db 30, ARBOK
	db 30, RATICATE
	db 30, QUAGSIRE
	; day
	db 28, DODUO
	db 28, RATICATE
	db 32, PONYTA
	db 30, DODUO
	db 30, RATICATE
	db 30, ARBOK
	db 30, ARBOK
	; nite
	db 28, RATICATE
	db 28, RATICATE
	db 32, PONYTA
	db 30, RATICATE
	db 30, QUAGSIRE
	db 30, ARBOK
	db 30, ARBOK
	ENDC

	map_id ROUTE_27
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 28, DODUO
	db 28, RATICATE
	db 30, DODUO
	db 28, QUAGSIRE
	db 32, PONYTA
	db 30, SANDSLASH
	db 30, SANDSLASH
	; day
	db 28, DODUO
	db 28, RATICATE
	db 30, DODUO
	db 30, RATICATE
	db 32, PONYTA
	db 30, SANDSLASH
	db 30, SANDSLASH
	; nite
	db 28, QUAGSIRE
	db 28, RATICATE
	db 30, QUAGSIRE
	db 30, RATICATE
	db 32, PONYTA
	db 30, SANDSLASH
	db 30, SANDSLASH

	ELIF DEF(_SILVER)
	; morn
	db 28, DODUO
	db 28, ARBOK
	db 30, DODUO
	db 28, QUAGSIRE
	db 32, PONYTA
	db 30, DODRIO
	db 30, DODRIO
	; day
	db 28, DODUO
	db 28, ARBOK
	db 30, DODUO
	db 30, RATICATE
	db 32, PONYTA
	db 30, DODRIO
	db 30, DODRIO
	; nite
	db 28, QUAGSIRE
	db 28, ARBOK
	db 30, QUAGSIRE
	db 30, RATICATE
	db 32, PONYTA
	db 32, QUAGSIRE
	db 32, QUAGSIRE
	ENDC

	map_id ROUTE_28
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite

	IF DEF(_GOLD)
	; morn
	db 39, TANGELA
	db 40, PONYTA
	db 40, URSARING
	db 42, RAPIDASH
	db 41, DODUO
	db 43, DODRIO
	db 43, DODRIO
	; day
	db 39, TANGELA
	db 40, PONYTA
	db 40, URSARING
	db 42, RAPIDASH
	db 41, DODUO
	db 43, DODRIO
	db 43, DODRIO
	; nite
	db 39, TANGELA
	db 40, PONYTA
	db 40, URSARING
	db 40, SNEASEL
	db 42, RAPIDASH
	db 42, RAPIDASH
	db 42, RAPIDASH

	ELIF DEF(_SILVER)
	; morn
	db 39, TANGELA
	db 40, PONYTA
	db 40, DONPHAN
	db 42, RAPIDASH
	db 41, DODUO
	db 43, DODRIO
	db 43, DODRIO
	; day
	db 39, TANGELA
	db 40, PONYTA
	db 40, DONPHAN
	db 42, RAPIDASH
	db 41, DODUO
	db 43, DODRIO
	db 43, DODRIO
	; nite
	db 39, TANGELA
	db 40, PONYTA
	db 40, DONPHAN
	db 40, SNEASEL
	db 42, RAPIDASH
	db 42, RAPIDASH
	db 42, RAPIDASH
	ENDC

	db -1 ; end
