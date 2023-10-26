MACRO tilepal
; used in gfx/tilesets/*_palette_map.asm
; vram bank, pals
	DEF x = \1 << OAM_TILE_BANK
	rept (_NARG - 1) / 2
		dn (x | PAL_BG_\3), (x | PAL_BG_\2)
		shift 2
	endr
ENDM

Tileset0PalMap:
TilesetNihonPalMap:
TilesetNihonOldPalMap:
TilesetNihonWestPalMap:
TilesetNihonHiTechPalMap:
TilesetNihonFontPalMap:
TilesetNihonBirdonPalMap:
TilesetNihonNorthPalMap:
TilesetKantoPalMap:
TilesetNihonSouthPalMap:
TilesetHousePalMap:
TilesetLabPalMap:
TilesetTraditionalHousePalMap:
TilesetPokecenterPalMap:
TilesetMartPalMap:
TilesetAquariumPalMap:
TilesetTowerPalMap:
TilesetDeptStorePalMap:
TilesetGatePalMap:
TilesetRadioTowerPalMap:
TilesetRocketHideoutPalMap:
TilesetGymPalMap:
TilesetOfficePalMap:
TilesetRuinsPalMap:
TilesetCavePalMap:
TilesetDarkCavePalMap:
TilesetPowerPlantPalMap:
TilesetShipPalMap:
TilesetPortPalMap:
TilesetForestPalMap:
TilesetTrainStationPalMap:
INCLUDE "gfx/tilesets/blank_palette_map.asm"

MapGroupPalettes:
; entries correspond to MAPGROUP_* constants
rept NUM_MAP_GROUPS
	db PAL_BG_ROOF
endr
