; Pokémon swarms in grass

SwarmGrassWildMons:

; Yanma swarm
	def_grass_wildmons ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, PIDGEY
	db 10, DITTO
	db 10, DITTO
	; day
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, PIDGEY
	db 10, DITTO
	db 10, DITTO
	; nite
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, HOOTHOOT
	db 10, DITTO
	db 10, DITTO
	end_grass_wildmons

; Snubbull swarm
	def_grass_wildmons ROUTE_38
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	IF DEF(_GOLD)
	; morn
	db 16, SNUBBULL
	db 16, RATICATE
	db 16, MAGNEMITE
	db 16, FARFETCH_D
	db 13, MILTANK
	db 13, TAUROS
	db 13, TAUROS
	; day
	db 16, SNUBBULL
	db 16, RATICATE
	db 16, MAGNEMITE
	db 16, FARFETCH_D
	db 13, MILTANK
	db 13, TAUROS
	db 13, TAUROS
	; nite
	db 16, SNUBBULL
	db 16, RATICATE
	db 16, MAGNEMITE
	db 16, RATTATA
	db 13, MILTANK
	db 13, TAUROS
	db 13, TAUROS
	ELIF DEF(_SILVER)
	; morn
	db 16, SNUBBULL
	db 16, MEOWTH
	db 16, MAGNEMITE
	db 16, FARFETCH_D
	db 13, MILTANK
	db 13, TAUROS
	db 13, TAUROS
	; day
	db 16, SNUBBULL
	db 16, MEOWTH
	db 16, MAGNEMITE
	db 16, FARFETCH_D
	db 13, MILTANK
	db 13, TAUROS
	db 13, TAUROS
	; nite
	db 16, SNUBBULL
	db 16, MEOWTH
	db 16, MAGNEMITE
	db 16, MEOWTH
	db 13, MILTANK
	db 13, TAUROS
	db 13, TAUROS
	ENDC
	end_grass_wildmons

; Dunsparce swarm
	def_grass_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 3, GEODUDE
	db 3, DUNSPARCE
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, DUNSPARCE
	db 4, DUNSPARCE
	db 4, DUNSPARCE
	; day
	db 3, GEODUDE
	db 3, DUNSPARCE
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, DUNSPARCE
	db 4, DUNSPARCE
	db 4, DUNSPARCE
	; nite
	db 3, GEODUDE
	db 3, DUNSPARCE
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, DUNSPARCE
	db 4, DUNSPARCE
	db 4, DUNSPARCE
	end_grass_wildmons

; Marill swarm
	def_grass_wildmons MOUNT_MORTAR_1F_OUTSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	db 13, MARILL
	db 15, ZUBAT
	db 14, MACHOP
	db 15, MARILL
	db 14, GEODUDE
	db 16, RATTATA
	db 16, RATTATA
	; day
	db 13, MARILL
	db 15, ZUBAT
	db 14, MACHOP
	db 15, MARILL
	db 14, GEODUDE
	db 16, RATTATA
	db 16, RATTATA
	; nite
	db 13, MARILL
	db 15, ZUBAT
	db 14, MACHOP
	db 15, MARILL
	db 14, GEODUDE
	db 16, RATTATA
	db 16, RATTATA
	end_grass_wildmons

	db -1 ; end
