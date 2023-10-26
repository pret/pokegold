; Tilesets indexes (see data/tilesets.asm)
	const_def 1
	const TILESET_NIHON                ; 00
	const TILESET_NIHON_OLD            ; 01
	const TILESET_NIHON_WEST           ; 02
	const TILESET_NIHON_HITECH         ; 03
	const TILESET_NIHON_FONT           ; 04
	const TILESET_NIHON_BIRDON         ; 05
	const TILESET_NIHON_NORTH          ; 06
	const TILESET_KANTO                ; 07
	const TILESET_NIHON_SOUTH          ; 08
	const TILESET_HOUSE                ; 09
	const TILESET_LAB                  ; 0a
	const TILESET_TRADITIONAL_HOUSE    ; 0b
	const TILESET_POKECENTER           ; 0c
	const TILESET_MART                 ; 0d
	const TILESET_AQUARIUM             ; 0e
	const TILESET_TOWER                ; 0f
	const TILESET_DEPT_STORE           ; 10
	const TILESET_GATE                 ; 11
	const TILESET_RADIO_TOWER          ; 12
	const TILESET_ROCKET_HIDEOUT       ; 13
	const TILESET_GYM                  ; 14
	const TILESET_OFFICE               ; 15
	const TILESET_RUINS                ; 16
	const TILESET_CAVE                 ; 17
	const TILESET_POWER_PLANT          ; 18
	const TILESET_SHIP                 ; 19
	const TILESET_PORT                 ; 1a
	const TILESET_FOREST               ; 1b
	const TILESET_DARK_CAVE            ; 1c
	const TILESET_TRAIN_STATION        ; 1d
DEF NUM_TILESETS EQU const_value -1

; wTileset struct size
DEF TILESET_LENGTH EQU 15

; bg palette values (see gfx/tilesets/*_palette_map.asm)
; TilesetBGPalette indexes (see gfx/tilesets/bg_tiles.pal)
	const_def
	const PAL_BG_GRAY   ; 0
	const PAL_BG_RED    ; 1
	const PAL_BG_GREEN  ; 2
	const PAL_BG_WATER  ; 3
	const PAL_BG_YELLOW ; 4
	const PAL_BG_BROWN  ; 5
	const PAL_BG_ROOF   ; 6
	const PAL_BG_TEXT   ; 7
