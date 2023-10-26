MACRO tileset
	dba \1GFX, \1Meta, \1Coll
	dw \1Anim
	dw NULL
	dw \1PalMap
ENDM

; Associated data:
; - The *GFX, *Meta, and *Coll are defined in gfx/tilesets.asm
; - The *PalMap are defined in gfx/tileset_palette_maps.asm
; - The *Anim are defined in engine/tilesets/tileset_anims.asm

Tilesets::
; entries correspond to TILESET_* constants (see constants/tileset_constants.asm)
	table_width TILESET_LENGTH, Tilesets
	tileset Tileset0
	tileset TilesetNihon
	tileset TilesetNihonOld
	tileset TilesetNihonWest
	tileset TilesetNihonHiTech
	tileset TilesetNihonFont
	tileset TilesetNihonBirdon
	tileset TilesetNihonNorth
	tileset TilesetKanto
	tileset TilesetNihonSouth
	tileset TilesetHouse
	tileset TilesetLab
	tileset TilesetTraditionalHouse
	tileset TilesetPokecenter
	tileset TilesetMart
	tileset TilesetAquarium
	tileset TilesetTower
	tileset TilesetDeptStore
	tileset TilesetGate
	tileset TilesetRadioTower
	tileset TilesetRocketHideout
	tileset TilesetGym
	tileset TilesetOffice
	tileset TilesetRuins
	tileset TilesetCave
	tileset TilesetPowerPlant
	tileset TilesetShip
	tileset TilesetPort
	tileset TilesetForest
	tileset TilesetDarkCave
	tileset TilesetTrainStation
	assert_table_length NUM_TILESETS +1
