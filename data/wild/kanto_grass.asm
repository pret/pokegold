; Kanto Pokémon in grass

KantoGrassWildMons:

	def_grass_wildmons DIGLETTS_CAVE
	db 4 percent, 2 percent, 8 percent ; encounter rates: morn/day/nite
	; morn
	db 27, DIGLETT
	db 29, DIGLETT
	db 31, DIGLETT
	db 25, DIGLETT
	db 31, DUGTRIO
	db 36, DUGTRIO
	db 42, DUGTRIO
	; day
	db 27, DIGLETT
	db 29, DIGLETT
	db 31, DIGLETT
	db 25, DIGLETT
	db 31, DUGTRIO
	db 36, DUGTRIO
	db 42, DUGTRIO
	; nite
	db 27, DIGLETT
	db 29, DIGLETT
	db 31, DIGLETT
	db 25, DIGLETT
	db 31, DUGTRIO
	db 36, DUGTRIO
	db 42, DUGTRIO
	end_grass_wildmons

	def_grass_wildmons MOUNT_MOON
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 25, GOLBAT
	db 30, GRAVELER
	db 30, SANDSLASH
	db 34, PARASECT
	db 30, CHARMELEON
	db 32, CLEFAIRY
	db 35, CLEFABLE
	; day
	db 25, GOLBAT
	db 30, GRAVELER
	db 30, SANDSLASH
	db 34, PARASECT
	db 30, CHARMELEON
	db 32, CLEFAIRY
	db 35, CLEFABLE
	; nite
	db 25, GOLBAT
	db 30, GRAVELER
	db 30, SANDSLASH
	db 34, PARASECT
	db 30, CHARMELEON
	db 32, CLEFAIRY
	db 35, CLEFABLE
	ELIF DEF(_SILVER)
	; morn
	db 25, GOLBAT
	db 30, GRAVELER
	db 30, SANDSLASH
	db 34, PARASECT
	db 30, CHARMELEON
	db 32, CLEFAIRY
	db 35, CLEFABLE
	; day
	db 25, GOLBAT
	db 30, GRAVELER
	db 30, SANDSLASH
	db 34, PARASECT
	db 30, CHARMELEON
	db 32, CLEFAIRY
	db 35, CLEFABLE
	; nite
	db 25, GOLBAT
	db 30, GRAVELER
	db 30, SANDSLASH
	db 34, PARASECT
	db 30, CHARMELEON
	db 32, CLEFAIRY
	db 35, CLEFABLE
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROCK_TUNNEL_1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 30, CUBONE
	db 30, GRAVELER
	db 32, MACHOKE
	db 28, ZUBAT
	db 35, MACHOKE
	db 35, MANKEY
	db 38, MAROWAK
	; day
	db 30, CUBONE
	db 30, GRAVELER
	db 32, MACHOKE
	db 28, ZUBAT
	db 35, MACHOKE
	db 35, MANKEY
	db 38, MAROWAK
	; nite
	db 30, CUBONE
	db 30, GRAVELER
	db 32, MACHOKE
	db 28, ZUBAT
	db 35, MACHOKE
	db 35, MANKEY
	db 38, MAROWAK
	end_grass_wildmons

	def_grass_wildmons ROCK_TUNNEL_B1F
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 32, CUBONE
	db 32, RHYHORN
	db 36, ONIX
	db 30, GOLBAT
	db 34, MAROWAK
	db 34, KANGASKHAN
	db 34, KANGASKHAN
	; day
	db 32, CUBONE
	db 32, RHYHORN
	db 36, ONIX
	db 30, GOLBAT
	db 34, MAROWAK
	db 34, KANGASKHAN
	db 34, KANGASKHAN
	; nite
	db 32, CUBONE
	db 32, RHYHORN
	db 36, ONIX
	db 30, GOLBAT
	db 34, MAROWAK
	db 34, KANGASKHAN
	db 34, KANGASKHAN
	end_grass_wildmons

	def_grass_wildmons VICTORY_ROAD
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 42, GRAVELER
	db 42, GOLBAT
	db 43, URSARING
	db 44, DONPHAN
	db 46, ONIX
	db 45, RHYHORN
	db 45, RHYHORN
	; day
	db 42, GRAVELER
	db 42, GOLBAT
	db 43, URSARING
	db 44, DONPHAN
	db 46, ONIX
	db 45, RHYHORN
	db 45, RHYHORN
	; nite
	db 42, GRAVELER
	db 42, GOLBAT
	db 43, URSARING
	db 44, DONPHAN
	db 46, ONIX
	db 45, RHYHORN
	db 45, RHYHORN
	ELIF DEF(_SILVER)
	; morn
	db 42, GRAVELER
	db 42, GOLBAT
	db 43, DONPHAN
	db 44, URSARING
	db 46, ONIX
	db 45, RHYHORN
	db 45, RHYHORN
	; day
	db 42, GRAVELER
	db 42, GOLBAT
	db 43, DONPHAN
	db 44, URSARING
	db 46, ONIX
	db 45, RHYHORN
	db 45, RHYHORN
	; nite
	db 42, GRAVELER
	db 42, GOLBAT
	db 43, DONPHAN
	db 44, URSARING
	db 46, ONIX
	db 45, RHYHORN
	db 45, RHYHORN
	ENDC
	end_grass_wildmons

	def_grass_wildmons TOHJO_FALLS
	IF DEF(_GOLD)
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	ELIF DEF(_SILVER)
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	ENDC
	; morn
	db 30, PSYDUCK
	db 30, RATICATE
	db 32, GOLBAT
	db 31, SLOWPOKE
	db 30, RATICATE
	db 33, SLOWPOKE
	db 33, SLOWBRO
	; day
	db 30, PSYDUCK
	db 30, RATICATE
	db 32, GOLBAT
	db 31, SLOWPOKE
	db 30, RATICATE
	db 33, SLOWPOKE
	db 33, SLOWBRO
	; nite
	db 30, PSYDUCK
	db 30, RATICATE
	db 32, GOLBAT
	db 31, SLOWPOKE
	db 30, RATICATE
	db 33, SLOWPOKE
	db 33, SLOWBRO
	end_grass_wildmons

	def_grass_wildmons ROUTE_1
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 7, PIDGEY
	db 7, RATTATA
	db 8, SENTRET
	db 8, PIDGEY
	db 12, FURRET
	db 9, PIDGEY
	db 9, PIDGEY
	; day
	db 7, PIDGEY
	db 7, RATTATA
	db 8, SENTRET
	db 8, PIDGEY
	db 12, FURRET
	db 9, PIDGEY
	db 9, PIDGEY
	; nite
	db 7, HOOTHOOT
	db 7, RATTATA
	db 8, RATTATA
	db 8, HOOTHOOT
	db 12, RATTATA
	db 9, HOOTHOOT
	db 9, HOOTHOOT
	end_grass_wildmons

	def_grass_wildmons ROUTE_2
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 13, CATERPIE
	db 13, LEDIAN
	db 15, METAPOD
	db 17, BUTTERFREE
	db 17, PIDGEOTTO
	db 14, PIKACHU
	db 14, PIKACHU
	; day
	db 13, CATERPIE
	db 13, LEDIAN
	db 15, METAPOD
	db 17, PIDGEY
	db 17, PIDGEOTTO
	db 14, PIKACHU
	db 14, PIKACHU
	; nite
	db 13, HOOTHOOT
	db 13, SPINARAK
	db 15, HOOTHOOT
	db 17, NOCTOWL
	db 17, ARIADOS
	db 14, PIKACHU
	db 14, PIKACHU
	ELIF DEF(_SILVER)
	; morn
	db 13, WEEDLE
	db 13, LEDYBA
	db 15, KAKUNA
	db 17, BEEDRILL
	db 17, LEDIAN
	db 14, PIKACHU
	db 14, PIKACHU
	; day
	db 13, WEEDLE
	db 13, PIDGEY
	db 15, KAKUNA
	db 17, PIDGEY
	db 17, PIDGEOTTO
	db 14, PIKACHU
	db 14, PIKACHU
	; nite
	db 13, HOOTHOOT
	db 13, SPINARAK
	db 15, HOOTHOOT
	db 17, NOCTOWL
	db 17, ARIADOS
	db 14, PIKACHU
	db 14, PIKACHU
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_3
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	; day
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	; nite
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	ELIF DEF(_SILVER)
	; morn
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	; day
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	; nite
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_4
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	IF DEF(_GOLD)
	; morn
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	; day
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	; nite
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	ELIF DEF(_SILVER)
	; morn
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	; day
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	; nite
	db 15, SPEAROW
	db 15, RATTATA
	db 18, EKANS
	db 16, JIGGLYPUFF
	db 20, ARBOK
	db 18, SPEAROW
	db 18, SPEAROW
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_5
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, PIDGEY
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	; day
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, PIDGEY
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	; nite
	db 26, ODDISH
	db 28, ODDISH
	db 26, BELLSPROUT
	db 30, GLOOM
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	ELIF DEF(_SILVER)
	; morn
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, PIDGEY
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	; day
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, PIDGEY
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	; nite
	db 26, ODDISH
	db 28, ODDISH
	db 26, BELLSPROUT
	db 30, GLOOM
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_6
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, MAGNETON
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	; day
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, MAGNETON
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	; nite
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, MAGNETON
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	ELIF DEF(_SILVER)
	; morn
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, MAGNETON
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	; day
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, MAGNETON
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	; nite
	db 26, PIDGEY
	db 26, BELLSPROUT
	db 28, MEOWTH
	db 30, MAGNETON
	db 25, KADABRA
	db 27, KADABRA
	db 29, KADABRA
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_7
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 35, PERSIAN
	db 35, FEAROW
	db 38, VULPIX
	db 39, GROWLITHE
	db 39, PERSIAN
	db 35, FEAROW
	db 35, RATICATE
	; day
	db 37, RATTATA
	db 37, FEAROW
	db 38, GROWLITHE
	db 39, RATICATE
	db 39, VULPIX
	db 35, GROWLITHE
	db 35, GROWLITHE
	; nite
	db 37, PERSIAN
	db 37, MURKROW
	db 38, GROWLITHE
	db 39, RATICATE
	db 39, MURKROW
	db 35, HOUNDOUR
	db 35, HOUNDOUR
	ELIF DEF(_SILVER)
	; morn
	db 35, PERSIAN
	db 35, FEAROW
	db 38, VULPIX
	db 39, GROWLITHE
	db 39, PERSIAN
	db 35, RATICATE
	db 35, RATICATE
	; day
	db 37, PERSIAN
	db 37, FEAROW
	db 38, VULPIX
	db 39, RATICATE
	db 39, PERSIAN
	db 35, VULPIX
	db 35, VULPIX
	; nite
	db 37, PERSIAN
	db 37, MURKROW
	db 38, VULPIX
	db 39, RATICATE
	db 39, PERSIAN
	db 35, HOUNDOUR
	db 35, HOUNDOUR
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_8
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 37, PIDGEOTTO
	db 39, PIDGEOTTO
	db 35, KADABRA
	db 38, GROWLITHE
	db 37, PIDGEOTTO
	db 37, KADABRA
	db 39, KADABRA
	; day
	db 37, PIDGEOTTO
	db 39, PIDGEOTTO
	db 35, KADABRA
	db 38, GROWLITHE
	db 37, PIDGEOTTO
	db 37, KADABRA
	db 39, KADABRA
	; nite
	db 37, NOCTOWL
	db 35, HAUNTER
	db 35, KADABRA
	db 39, NOCTOWL
	db 38, GROWLITHE
	db 37, KADABRA
	db 39, KADABRA
	ELIF DEF(_SILVER)
	; morn
	db 37, PERSIAN
	db 39, PIDGEOTTO
	db 35, KADABRA
	db 38, VULPIX
	db 37, PIDGEOTTO
	db 37, KADABRA
	db 39, KADABRA
	; day
	db 37, PERSIAN
	db 39, PIDGEOTTO
	db 35, KADABRA
	db 38, VULPIX
	db 37, PIDGEOTTO
	db 37, KADABRA
	db 39, KADABRA
	; nite
	db 37, MEOWTH
	db 35, HAUNTER
	db 35, ABRA
	db 39, NOCTOWL
	db 38, VULPIX
	db 37, KADABRA
	db 39, KADABRA
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_9
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 33, MANKEY
	db 35, RATICATE
	db 33, SPEAROW
	db 35, RATICATE
	db 35, FEAROW
	db 35, PRIMEAPE
	db 37, PRIMEAPE
	; day
	db 33, MANKEY
	db 35, RATICATE
	db 33, SPEAROW
	db 35, RATICATE
	db 35, FEAROW
	db 35, PRIMEAPE
	db 37, PRIMEAPE
	; nite
	db 33, MANKEY
	db 35, RATTATA
	db 33, SPEAROW
	db 35, RATICATE
	db 35, FEAROW
	db 35, PRIMEAPE
	db 37, PRIMEAPE
	ELIF DEF(_SILVER)
	; morn
	db 33, MANKEY
	db 35, RATTATA
	db 33, SPEAROW
	db 35, RATICATE
	db 35, FEAROW
	db 35, PRIMEAPE
	db 37, PRIMEAPE
	; day
	db 33, MANKEY
	db 35, RATTATA
	db 33, SPEAROW
	db 35, RATICATE
	db 35, FEAROW
	db 35, PRIMEAPE
	db 37, PRIMEAPE
	; nite
	db 33, MANKEY
	db 35, RATTATA
	db 33, SPEAROW
	db 35, RATICATE
	db 35, FEAROW
	db 35, PRIMEAPE
	db 37, PRIMEAPE
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_10_NORTH
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 26, VOLTORB
	db 27, ELEKID
	db 36, RATICATE
	db 38, FEAROW
	db 36, QUAGSIRE
	db 31, ELECTABUZZ
	db 34, ELECTABUZZ
	; day
	db 26, VOLTORB
	db 27, ELEKID
	db 36, RATICATE
	db 38, FEAROW
	db 36, QUAGSIRE
	db 31, ELECTABUZZ
	db 34, ELECTABUZZ
	; nite
	db 26, VOLTORB
	db 27, ELEKID
	db 36, RATICATE
	db 38, FEAROW
	db 36, QUAGSIRE
	db 31, ELECTABUZZ
	db 34, ELECTABUZZ
	end_grass_wildmons

	def_grass_wildmons ROUTE_11
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 34, DROWZEE
	db 35, RATICATE
	db 35, MAGNETON
	db 36, DROWZEE
	db 36, HYPNO
	db 36, HYPNO
	db 36, HYPNO
	; day
	db 34, DROWZEE
	db 35, RATICATE
	db 35, MAGNETON
	db 36, DROWZEE
	db 36, HYPNO
	db 36, HYPNO
	db 36, HYPNO
	; nite
	db 34, DROWZEE
	db 35, RATICATE
	db 35, MAGNETON
	db 36, DROWZEE
	db 36, HYPNO
	db 36, HYPNO
	db 36, HYPNO
	end_grass_wildmons

	def_grass_wildmons ROUTE_13
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, HOPPIP
	db 37, QUAGSIRE
	db 40, CHANSEY
	; day
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, HOPPIP
	db 37, HOPPIP
	db 40, CHANSEY
	; nite
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, NOCTOWL
	db 38, QUAGSIRE
	db 37, QUAGSIRE
	db 36, QUAGSIRE
	db 40, CHANSEY
	ELIF DEF(_SILVER)
	; morn
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, HOPPIP
	db 37, QUAGSIRE
	db 40, CHANSEY
	; day
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, HOPPIP
	db 37, HOPPIP
	db 40, CHANSEY
	; nite
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, NOCTOWL
	db 38, QUAGSIRE
	db 37, QUAGSIRE
	db 36, QUAGSIRE
	db 40, CHANSEY
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_14
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, SKIPLOOM
	db 37, QUAGSIRE
	db 40, CHANSEY
	; day
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, SKIPLOOM
	db 37, SKIPLOOM
	db 40, CHANSEY
	; nite
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, NOCTOWL
	db 38, QUAGSIRE
	db 37, QUAGSIRE
	db 36, QUAGSIRE
	db 40, CHANSEY
	ELIF DEF(_SILVER)
	; morn
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, SKIPLOOM
	db 37, QUAGSIRE
	db 40, CHANSEY
	; day
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, SKIPLOOM
	db 37, SKIPLOOM
	db 40, CHANSEY
	; nite
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, NOCTOWL
	db 38, QUAGSIRE
	db 37, QUAGSIRE
	db 36, QUAGSIRE
	db 40, CHANSEY
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_15
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, SKIPLOOM
	db 37, QUAGSIRE
	db 40, CHANSEY
	; day
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, SKIPLOOM
	db 37, SKIPLOOM
	db 40, CHANSEY
	; nite
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, NOCTOWL
	db 38, QUAGSIRE
	db 37, QUAGSIRE
	db 36, QUAGSIRE
	db 40, CHANSEY
	ELIF DEF(_SILVER)
	; morn
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, SKIPLOOM
	db 37, QUAGSIRE
	db 40, CHANSEY
	; day
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, PIDGEOTTO
	db 36, HOPPIP
	db 38, SKIPLOOM
	db 37, SKIPLOOM
	db 40, CHANSEY
	; nite
	db 39, NIDORINA
	db 39, NIDORINO
	db 40, NOCTOWL
	db 38, QUAGSIRE
	db 37, QUAGSIRE
	db 36, QUAGSIRE
	db 40, CHANSEY
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_16
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 40, GRIMER
	db 41, FEAROW
	db 42, GRIMER
	db 43, FEAROW
	db 41, SLUGMA
	db 43, MUK
	db 43, MUK
	; day
	db 40, GRIMER
	db 41, FEAROW
	db 42, GRIMER
	db 43, FEAROW
	db 41, SLUGMA
	db 43, MUK
	db 43, MUK
	; nite
	db 40, GRIMER
	db 41, GRIMER
	db 42, GRIMER
	db 42, MURKROW
	db 41, SLUGMA
	db 43, MUK
	db 43, MUK
	end_grass_wildmons

	def_grass_wildmons ROUTE_17
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 40, GRIMER
	db 41, FEAROW
	db 42, GRIMER
	db 43, FEAROW
	db 41, SLUGMA
	db 45, MUK
	db 45, MUK
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
	end_grass_wildmons

	def_grass_wildmons ROUTE_18
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
	db 40, GRIMER
	db 41, FEAROW
	db 42, GRIMER
	db 43, FEAROW
	db 41, SLUGMA
	db 45, MUK
	db 45, MUK
	; nite
	db 40, GRIMER
	db 41, GRIMER
	db 42, GRIMER
	db 42, MUK
	db 41, SLUGMA
	db 43, MUK
	db 43, MUK
	end_grass_wildmons

	def_grass_wildmons ROUTE_21
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 45, TANGELA
	db 40, TANGELA
	db 50, TANGELA
	db 36, TANGELA
	db 30, TANGELA
	db 42, MR__MIME
	db 44, MR__MIME
	; day
	db 45, TANGELA
	db 40, TANGELA
	db 50, TANGELA
	db 36, TANGELA
	db 38, MR__MIME
	db 42, MR__MIME
	db 44, MR__MIME
	; nite
	db 45, TANGELA
	db 40, TANGELA
	db 50, TANGELA
	db 36, TANGELA
	db 30, TANGELA
	db 42, MR__MIME
	db 44, MR__MIME
	end_grass_wildmons

	def_grass_wildmons ROUTE_22
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 7, RATTATA
	db 7, SPEAROW
	db 10, SPEAROW
	db 9, DODUO
	db 12, PONYTA
	db 13, FEAROW
	db 13, FEAROW
	; day
	db 7, RATTATA
	db 7, SPEAROW
	db 10, SPEAROW
	db 9, DODUO
	db 12, PONYTA
	db 13, FEAROW
	db 13, FEAROW
	; nite
	db 7, RATTATA
	db 7, PONYTA
	db 10, RATTATA
	db 9, RATTATA
	db 12, PONYTA
	db 13, RATTATA
	db 13, PONYTA
	end_grass_wildmons

	def_grass_wildmons ROUTE_24
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 18, BELLSPROUT
	db 20, BELLSPROUT
	db 19, ABRA
	db 22, WEEPINBELL
	db 18, VENONAT
	db 24, WEEPINBELL
	db 24, WEEPINBELL
	; day
	db 18, BELLSPROUT
	db 20, SUNKERN
	db 19, ABRA
	db 22, WEEPINBELL
	db 20, BELLSPROUT
	db 24, WEEPINBELL
	db 24, WEEPINBELL
	; nite
	db 18, VENONAT
	db 20, ODDISH
	db 19, ABRA
	db 23, WEEPINBELL
	db 20, BELLSPROUT
	db 20, VENOMOTH
	db 20, VENOMOTH
	end_grass_wildmons

	def_grass_wildmons ROUTE_25
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 18, PIDGEY
	db 20, BELLSPROUT
	db 18, VENONAT
	db 19, ABRA
	db 20, PIDGEOTTO
	db 24, WEEPINBELL
	db 24, WEEPINBELL
	; day
	db 18, PIDGEY
	db 20, BELLSPROUT
	db 20, PIDGEY
	db 19, ABRA
	db 22, PIDGEOTTO
	db 24, WEEPINBELL
	db 24, WEEPINBELL
	; nite
	db 18, VENONAT
	db 20, ODDISH
	db 20, VENOMOTH
	db 19, ABRA
	db 24, WEEPINBELL
	db 20, BELLSPROUT
	db 20, BELLSPROUT
	end_grass_wildmons

	def_grass_wildmons ROUTE_26
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 42, DODUO
	db 42, SANDSLASH
	db 43, PONYTA
	db 45, ARBOK
	db 45, DODRIO
	db 45, RATICATE
	db 45, QUAGSIRE
	; day
	db 42, DODUO
	db 42, SANDSLASH
	db 43, PONYTA
	db 45, ARBOK
	db 45, RATICATE
	db 45, DODRIO
	db 49, DODRIO
	; nite
	db 42, RATICATE
	db 42, SANDSLASH
	db 45, PONYTA
	db 45, ARBOK
	db 45, QUAGSIRE
	db 47, QUAGSIRE
	db 49, QUAGSIRE
	ELIF DEF(_SILVER)
	; morn
	db 42, DODUO
	db 42, SANDSLASH
	db 43, PONYTA
	db 45, ARBOK
	db 45, DODRIO
	db 45, RATICATE
	db 45, QUAGSIRE
	; day
	db 42, DODUO
	db 42, SANDSLASH
	db 43, PONYTA
	db 45, ARBOK
	db 45, RATICATE
	db 45, DODRIO
	db 49, DODRIO
	; nite
	db 42, RATICATE
	db 42, SANDSLASH
	db 45, PONYTA
	db 45, ARBOK
	db 45, QUAGSIRE
	db 47, QUAGSIRE
	db 49, QUAGSIRE
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_27
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 42, DODUO
	db 42, ARBOK
	db 45, SANDSLASH
	db 42, QUAGSIRE
	db 48, PONYTA
	db 45, SANDSLASH
	db 45, DODRIO
	; day
	db 42, DODRIO
	db 42, ARBOK
	db 45, SANDSLASH
	db 45, RATICATE
	db 47, PONYTA
	db 45, ARBOK
	db 45, DODRIO
	; nite
	db 42, QUAGSIRE
	db 42, ARBOK
	db 45, QUAGSIRE
	db 45, RATICATE
	db 47, PONYTA
	db 47, SANDSLASH
	db 47, SANDSLASH
	ELIF DEF(_SILVER)
	; morn
	db 42, DODUO
	db 42, ARBOK
	db 45, SANDSLASH
	db 42, QUAGSIRE
	db 48, PONYTA
	db 45, SANDSLASH
	db 45, DODRIO
	; day
	db 42, DODRIO
	db 42, ARBOK
	db 45, SANDSLASH
	db 45, RATICATE
	db 47, PONYTA
	db 45, ARBOK
	db 45, DODRIO
	; nite
	db 42, QUAGSIRE
	db 42, ARBOK
	db 45, QUAGSIRE
	db 45, RATICATE
	db 47, PONYTA
	db 47, SANDSLASH
	db 47, SANDSLASH
	ENDC
	end_grass_wildmons

	def_grass_wildmons ROUTE_28
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 51, TANGELA
	db 52, PONYTA
	db 52, URSARING
	db 54, RAPIDASH
	db 53, DODRIO
	db 55, DONPHAN
	db 55, DODRIO
	; day
	db 51, TANGELA
	db 52, PONYTA
	db 52, URSARING
	db 54, RAPIDASH
	db 53, DODRIO
	db 55, DONPHAN
	db 55, DODRIO
	; nite
	db 51, DONPHAN
	db 52, PONYTA
	db 52, URSARING
	db 52, SNEASEL
	db 54, RAPIDASH
	db 54, RAPIDASH
	db 54, RAPIDASH
	ELIF DEF(_SILVER)
	; morn
	db 51, TANGELA
	db 52, PONYTA
	db 52, DONPHAN
	db 54, RAPIDASH
	db 53, DODRIO
	db 55, URSARING
	db 55, DODRIO
	; day
	db 51, TANGELA
	db 52, PONYTA
	db 52, DONPHAN
	db 54, RAPIDASH
	db 53, DODRIO
	db 55, URSARING
	db 55, DODRIO
	; nite
	db 51, URSARING
	db 52, PONYTA
	db 52, DONPHAN
	db 52, SNEASEL
	db 54, RAPIDASH
	db 54, RAPIDASH
	db 54, RAPIDASH
	ENDC
	end_grass_wildmons

	db -1 ; end
