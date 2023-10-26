MACRO tilecoll
; used in data/tilesets/*_collision.asm
	db COLL_\1, COLL_\2, COLL_\3, COLL_\4
ENDM


SECTION "Tileset Data 1", ROMX

Tileset0GFX::
TilesetNihonGFX::
INCBIN "gfx/tilesets/nihon.2bpp.lz"

Tileset0Meta::
TilesetNihonMeta::
INCBIN "data/tilesets/nihon_metatiles.bin"

Tileset0Coll::
TilesetNihonColl::
INCLUDE "data/tilesets/nihon_collision.asm"

TilesetNihonOldGFX::
INCBIN "gfx/tilesets/nihon_old.2bpp.lz"

TilesetNihonOldMeta::
INCBIN "data/tilesets/nihon_old_metatiles.bin"

TilesetNihonOldColl::
INCLUDE "data/tilesets/nihon_old_collision.asm"

TilesetKantoGFX::
INCBIN "gfx/tilesets/kanto.2bpp.lz"

TilesetKantoMeta::
INCBIN "data/tilesets/kanto_metatiles.bin"

TilesetKantoColl::
INCLUDE "data/tilesets/kanto_collision.asm"


SECTION "Tileset Data 2", ROMX

TilesetGateMeta::
INCBIN "data/tilesets/gate_metatiles.bin"

TilesetGateColl::
INCLUDE "data/tilesets/gate_collision.asm"

TilesetPokecenterGFX::
INCBIN "gfx/tilesets/pokecenter.2bpp.lz"

TilesetPokecenterMeta::
INCBIN "data/tilesets/pokecenter_metatiles.bin"

TilesetPokecenterColl::
INCLUDE "data/tilesets/pokecenter_collision.asm"

TilesetPortGFX::
INCBIN "gfx/tilesets/port.2bpp.lz"

TilesetPortMeta::
INCBIN "data/tilesets/port_metatiles.bin"

TilesetPortColl::
INCLUDE "data/tilesets/port_collision.asm"

TilesetNihonWestGFX::
INCBIN "gfx/tilesets/nihon_west.2bpp.lz"

TilesetNihonWestMeta::
INCBIN "data/tilesets/nihon_west_metatiles.bin"

TilesetNihonWestColl::
INCLUDE "data/tilesets/nihon_west_collision.asm"

TilesetNihonHiTechGFX::
INCBIN "gfx/tilesets/nihon_hitech.2bpp.lz"

TilesetNihonHiTechMeta::
INCBIN "data/tilesets/nihon_hitech_metatiles.bin"

TilesetNihonHiTechColl::
INCLUDE "data/tilesets/nihon_hitech_collision.asm"

TilesetCaveGFX::
INCBIN "gfx/tilesets/cave.2bpp.lz"

TilesetDarkCaveGFX::
INCBIN "gfx/tilesets/dark_cave.2bpp.lz"

TilesetCaveMeta::
TilesetDarkCaveMeta::
INCBIN "data/tilesets/cave_metatiles.bin"

TilesetCaveColl::
TilesetDarkCaveColl::
INCLUDE "data/tilesets/cave_collision.asm"


SECTION "Tileset Data 3", ROMX

TilesetTraditionalHouseGFX::
INCBIN "gfx/tilesets/traditional_house.2bpp.lz"

TilesetTraditionalHouseMeta::
INCBIN "data/tilesets/traditional_house_metatiles.bin"

TilesetTraditionalHouseColl::
INCLUDE "data/tilesets/traditional_house_collision.asm"

TilesetTowerGFX::
INCBIN "gfx/tilesets/tower.2bpp.lz"

TilesetTowerMeta::
INCBIN "data/tilesets/tower_metatiles.bin"

TilesetTowerColl::
INCLUDE "data/tilesets/tower_collision.asm"

TilesetLabGFX::
INCBIN "gfx/tilesets/lab.2bpp.lz"

TilesetLabMeta::
INCBIN "data/tilesets/lab_metatiles.bin"

TilesetLabColl::
INCLUDE "data/tilesets/lab_collision.asm"

TilesetOfficeGFX::
INCBIN "gfx/tilesets/office.2bpp.lz"

TilesetOfficeMeta::
INCBIN "data/tilesets/office_metatiles.bin"

TilesetOfficeColl::
INCLUDE "data/tilesets/office_collision.asm"

TilesetMartGFX::
INCBIN "gfx/tilesets/mart.2bpp.lz"

TilesetMartMeta::
INCBIN "data/tilesets/mart_metatiles.bin"

TilesetMartColl::
INCLUDE "data/tilesets/mart_collision.asm"

TilesetAquariumGFX::
INCBIN "gfx/tilesets/aquarium.2bpp.lz"

TilesetAquariumMeta::
INCBIN "data/tilesets/aquarium_metatiles.bin"

TilesetAquariumColl::
INCLUDE "data/tilesets/aquarium_collision.asm"

TilesetTrainStationGFX::
INCBIN "gfx/tilesets/train_station.2bpp.lz"

TilesetTrainStationMeta::
INCBIN "data/tilesets/train_station_metatiles.bin"

TilesetTrainStationColl::
INCLUDE "data/tilesets/train_station_collision.asm"


SECTION "Tileset Data 4", ROMX

TilesetGymGFX::
INCBIN "gfx/tilesets/gym.2bpp.lz"

TilesetNihonFontGFX::
INCBIN "gfx/tilesets/nihon_font.2bpp.lz"

TilesetNihonFontMeta::
INCBIN "data/tilesets/nihon_font_metatiles.bin"

TilesetNihonFontColl::
INCLUDE "data/tilesets/nihon_font_collision.asm"

TilesetRuinsGFX::
INCBIN "gfx/tilesets/ruins.2bpp.lz"

TilesetRuinsMeta::
INCBIN "data/tilesets/ruins_metatiles.bin"

TilesetRuinsColl::
INCLUDE "data/tilesets/ruins_collision.asm"

TilesetRadioTowerGFX::
INCBIN "gfx/tilesets/radio_tower.2bpp.lz"

TilesetRadioTowerMeta::
INCBIN "data/tilesets/radio_tower_metatiles.bin"

TilesetRadioTowerColl::
INCLUDE "data/tilesets/radio_tower_collision.asm"

TilesetRocketHideoutGFX::
INCBIN "gfx/tilesets/rocket_hideout.2bpp.lz"

TilesetRocketHideoutMeta::
INCBIN "data/tilesets/rocket_hideout_metatiles.bin"

TilesetRocketHideoutColl::
INCLUDE "data/tilesets/rocket_hideout_collision.asm"

TilesetNihonBirdonGFX::
INCBIN "gfx/tilesets/nihon_birdon.2bpp.lz"

TilesetNihonBirdonMeta::
INCBIN "data/tilesets/nihon_birdon_metatiles.bin"

TilesetNihonBirdonColl::
INCLUDE "data/tilesets/nihon_birdon_collision.asm"

TilesetForestGFX::
INCBIN "gfx/tilesets/forest.2bpp.lz"

TilesetForestMeta::
INCBIN "data/tilesets/forest_metatiles.bin"

TilesetForestColl::
INCLUDE "data/tilesets/forest_collision.asm"


SECTION "Tileset Data 5", ROMX

TilesetDeptStoreGFX::
INCBIN "gfx/tilesets/dept_store.2bpp.lz"

TilesetDeptStoreMeta::
INCBIN "data/tilesets/dept_store_metatiles.bin"

TilesetDeptStoreColl::
INCLUDE "data/tilesets/dept_store_collision.asm"

TilesetNihonNorthMeta::
INCBIN "data/tilesets/nihon_north_metatiles.bin"

TilesetNihonNorthColl::
INCLUDE "data/tilesets/nihon_north_collision.asm"

TilesetHouseGFX::
INCBIN "gfx/tilesets/house.2bpp.lz"

TilesetShipGFX::
INCBIN "gfx/tilesets/ship.2bpp.lz"

TilesetShipMeta::
INCBIN "data/tilesets/ship_metatiles.bin"

TilesetShipColl::
INCLUDE "data/tilesets/ship_collision.asm"

TilesetPowerPlantGFX::
INCBIN "gfx/tilesets/power_plant.2bpp.lz"

TilesetPowerPlantMeta::
INCBIN "data/tilesets/power_plant_metatiles.bin"

TilesetPowerPlantColl::
INCLUDE "data/tilesets/power_plant_collision.asm"


SECTION "Tileset Data 6", ROMX

TilesetHouseMeta::
INCBIN "data/tilesets/house_metatiles.bin"

TilesetHouseColl::
INCLUDE "data/tilesets/house_collision.asm"

TilesetGateGFX::
INCBIN "gfx/tilesets/gate.2bpp.lz"

TilesetGymMeta::
INCBIN "data/tilesets/gym_metatiles.bin"

TilesetGymColl::
INCLUDE "data/tilesets/gym_collision.asm"

TilesetNihonNorthGFX::
INCBIN "gfx/tilesets/nihon_north.2bpp.lz"

TilesetNihonSouthGFX::
INCBIN "gfx/tilesets/nihon_south.2bpp.lz"

TilesetNihonSouthColl::
INCLUDE "data/tilesets/nihon_south_collision.asm"

TilesetNihonSouthMeta::
INCBIN "data/tilesets/nihon_south_metatiles.bin"
