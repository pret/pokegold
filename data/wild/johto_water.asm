; Johto Pokémon in water

JohtoWaterWildMons:

	def_water_wildmons RUINS_OF_ALPH_OUTSIDE
	db 2 percent ; encounter rate
	db 21, WOOPER
	db 28, QUAGSIRE
	db 21, QUAGSIRE
	end_water_wildmons

	def_water_wildmons UNION_CAVE_1F
	db 2 percent ; encounter rate
	db 21, WOOPER
	db 28, QUAGSIRE
	db 21, QUAGSIRE
	end_water_wildmons

	def_water_wildmons UNION_CAVE_B1F
	db 2 percent ; encounter rate
	db 21, WOOPER
	db 28, QUAGSIRE
	db 21, QUAGSIRE
	end_water_wildmons

	def_water_wildmons UNION_CAVE_B2F
	db 4 percent ; encounter rate
	db 21, TENTACOOL
	db 28, QUAGSIRE
	db 21, TENTACRUEL
	end_water_wildmons

	def_water_wildmons SLOWPOKE_WELL_B1F
	db 2 percent ; encounter rate
	db 21, SLOWPOKE
	db 28, SLOWPOKE
	db 15, SLOWPOKE
	end_water_wildmons

	def_water_wildmons SLOWPOKE_WELL_B2F
	IF DEF(_GOLD)
	db 4 percent ; encounter rate
	ELIF DEF(_SILVER)
	db 2 percent ; encounter rate
	ENDC
	db 21, SLOWPOKE
	db 28, SLOWPOKE
	db 28, SLOWBRO
	end_water_wildmons

	def_water_wildmons ILEX_FOREST
	db 2 percent ; encounter rate
	db 21, PSYDUCK
	db 15, PSYDUCK
	db 21, GOLDUCK
	end_water_wildmons

	def_water_wildmons MOUNT_MORTAR_1F_OUTSIDE
	db 4 percent ; encounter rate
	db 28, GOLDEEN
	db 21, GOLDEEN
	db 28, SEAKING
	end_water_wildmons

	def_water_wildmons MOUNT_MORTAR_2F_INSIDE
	db 2 percent ; encounter rate
	db 28, GOLDEEN
	db 33, GOLDEEN
	db 33, SEAKING
	end_water_wildmons

	def_water_wildmons MOUNT_MORTAR_B1F
	db 2 percent ; encounter rate
	db 28, GOLDEEN
	db 21, GOLDEEN
	db 28, SEAKING
	end_water_wildmons

	def_water_wildmons WHIRL_ISLAND_SW
	db 4 percent ; encounter rate
	db 28, TENTACOOL
	db 21, HORSEA
	db 28, TENTACRUEL
	end_water_wildmons

	def_water_wildmons WHIRL_ISLAND_B2F
	db 4 percent ; encounter rate
	db 21, HORSEA
	db 28, HORSEA
	db 28, TENTACRUEL
	end_water_wildmons

	def_water_wildmons WHIRL_ISLAND_LUGIA_CHAMBER
	db 4 percent ; encounter rate
	db 28, HORSEA
	db 28, TENTACRUEL
	db 28, SEADRA
	end_water_wildmons

	def_water_wildmons SILVER_CAVE_ROOM_2
	db 2 percent ; encounter rate
	db 43, SEAKING
	db 50, SEAKING
	db 43, GOLDEEN
	end_water_wildmons

	def_water_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 2 percent ; encounter rate
	db 21, MAGIKARP
	db 15, MAGIKARP
	db 9, MAGIKARP
	end_water_wildmons

	def_water_wildmons DARK_CAVE_BLACKTHORN_ENTRANCE
	db 2 percent ; encounter rate
	db 21, MAGIKARP
	db 15, MAGIKARP
	db 9, MAGIKARP
	end_water_wildmons

	def_water_wildmons DRAGONS_DEN_B1F
	db 4 percent ; encounter rate
	db 21, MAGIKARP
	db 15, MAGIKARP
	db 15, DRATINI
	end_water_wildmons

	def_water_wildmons ROUTE_30
	db 2 percent ; encounter rate
	db 28, POLIWAG
	db 21, POLIWAG
	db 28, POLIWHIRL
	end_water_wildmons

	def_water_wildmons ROUTE_31
	db 2 percent ; encounter rate
	db 28, POLIWAG
	db 21, POLIWAG
	db 28, POLIWHIRL
	end_water_wildmons

	def_water_wildmons ROUTE_32
	db 6 percent ; encounter rate
	db 21, TENTACOOL
	db 28, QUAGSIRE
	db 28, TENTACRUEL
	end_water_wildmons

	def_water_wildmons ROUTE_34
	db 6 percent ; encounter rate
	db 28, TENTACOOL
	db 21, TENTACOOL
	db 28, TENTACRUEL
	end_water_wildmons

	def_water_wildmons ROUTE_35
	db 4 percent ; encounter rate
	db 28, PSYDUCK
	db 21, PSYDUCK
	db 28, GOLDUCK
	end_water_wildmons

	def_water_wildmons ROUTE_40
	db 6 percent ; encounter rate
	db 28, TENTACOOL
	db 21, TENTACOOL
	db 28, TENTACRUEL
	end_water_wildmons

	def_water_wildmons ROUTE_41
	db 6 percent ; encounter rate
	IF DEF(_GOLD)
	db 30, TENTACOOL
	db 30, TENTACRUEL
	db 30, MANTINE
	ELIF DEF(_SILVER)
	db 30, TENTACOOL
	db 30, TENTACRUEL
	db 30, MANTINE
	ENDC
	end_water_wildmons

	def_water_wildmons ROUTE_42
	db 4 percent ; encounter rate
	db 28, GOLDEEN
	db 21, GOLDEEN
	db 28, SEAKING
	end_water_wildmons

	def_water_wildmons ROUTE_43
	db 2 percent ; encounter rate
	db 28, MAGIKARP
	db 21, MAGIKARP
	db 15, MAGIKARP
	end_water_wildmons

	def_water_wildmons ROUTE_44
	db 2 percent ; encounter rate
	db 33, POLIWAG
	db 28, POLIWAG
	db 33, POLIWHIRL
	end_water_wildmons

	def_water_wildmons ROUTE_45
	db 2 percent ; encounter rate
	db 28, MAGIKARP
	db 21, MAGIKARP
	db 9, MAGIKARP
	end_water_wildmons

	def_water_wildmons NEW_BARK_TOWN
	db 6 percent ; encounter rate
	db 28, TENTACOOL
	db 21, TENTACOOL
	db 28, TENTACRUEL
	end_water_wildmons

	def_water_wildmons CHERRYGROVE_CITY
	db 6 percent ; encounter rate
	db 28, TENTACOOL
	db 21, TENTACOOL
	db 28, TENTACRUEL
	end_water_wildmons

	def_water_wildmons VIOLET_CITY
	db 2 percent ; encounter rate
	db 28, POLIWAG
	db 21, POLIWAG
	db 28, POLIWHIRL
	end_water_wildmons

	def_water_wildmons CIANWOOD_CITY
	db 6 percent ; encounter rate
	db 28, TENTACOOL
	db 21, TENTACOOL
	db 28, TENTACRUEL
	end_water_wildmons

	def_water_wildmons OLIVINE_CITY
	db 6 percent ; encounter rate
	db 28, TENTACOOL
	db 21, TENTACOOL
	db 28, TENTACRUEL
	end_water_wildmons

	def_water_wildmons ECRUTEAK_CITY
	db 2 percent ; encounter rate
	db 28, POLIWAG
	db 21, POLIWAG
	db 28, POLIWHIRL
	end_water_wildmons

	def_water_wildmons LAKE_OF_RAGE
	IF DEF(_GOLD)
	db 4 percent ; encounter rate
	ELIF DEF(_SILVER)
	db 6 percent ; encounter rate
	ENDC
	db 21, MAGIKARP
	db 15, MAGIKARP
	db 21, GYARADOS
	end_water_wildmons

	def_water_wildmons BLACKTHORN_CITY
	db 4 percent ; encounter rate
	db 21, MAGIKARP
	db 15, MAGIKARP
	db 9, MAGIKARP
	end_water_wildmons

	def_water_wildmons SILVER_CAVE_OUTSIDE
	db 2 percent ; encounter rate
	db 43, POLIWHIRL
	db 50, POLIWHIRL
	db 43, POLIWAG
	end_water_wildmons

	def_water_wildmons OLIVINE_PORT
	db 2 percent ; encounter rate
	db 28, TENTACOOL
	db 21, TENTACOOL
	db 28, TENTACRUEL
	end_water_wildmons

	db -1 ; end
