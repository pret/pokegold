; these blocks all use COLL_CUT_TREE in one quadrant
CutTreeBlockPointers:
; tileset, block list pointer
	dbw TILESET_NIHON,        .nihon
	dbw TILESET_NIHON_OLD,    .nihon_old
	dbw TILESET_NIHON_WEST,   .nihon_south
	dbw TILESET_NIHON_HITECH, .nihon_north
	dbw TILESET_NIHON_FONT,   .nihon_north
	dbw TILESET_NIHON_BIRDON, .nihon
	dbw TILESET_NIHON_NORTH,  .nihon_north
	dbw TILESET_NIHON_SOUTH,  .nihon_south
	dbw TILESET_KANTO,        .nihon
	dbw TILESET_GYM,          .gym
	dbw TILESET_CAVE,         .cave
	dbw TILESET_DARK_CAVE,    .cave
	dbw TILESET_FOREST,       .forest
	db -1 ; end

.nihon:
; facing block, replacement block, animation
	db $3b, $04, 1 ; grass
	db $30, $25, 0 ; tree
	db $31, $2a, 0 ; tree
	db $32, $34, 0 ; tree
	db $33, $35, 0 ; tree
	db $4c, $4d, 0 ; tree
	db -1 ; end

.nihon_old:
	db $3b, $04, 1 ; grass
	db $30, $25, 0 ; tree
	db $31, $2a, 0 ; tree
	db $32, $34, 0 ; tree
	db $33, $35, 0 ; tree
	db $43, $04, 0 ; tree (no corresponding block)
	db $6c, $04, 0 ; tree (no corresponding block)
	db $6d, $04, 0 ; tree (no corresponding block)
	db -1 ; end

.nihon_north:
	db $3b, $04, 1 ; grass
	db $30, $25, 0 ; tree
	db $31, $2a, 0 ; tree
	db $32, $34, 0 ; tree
	db $33, $35, 0 ; tree
	db -1 ; end

.nihon_south:
	db $3b, $04, 1 ; grass
	db $30, $25, 0 ; tree
	db $31, $2a, 0 ; tree
	db $32, $34, 0 ; tree
	db $33, $35, 0 ; tree
	db $43, $04, 0 ; tree (no corresponding block)
	db -1 ; end

.gym:
; facing block, replacement block, animation
	db $2e, $2c, 1 ; grass
	db $2f, $2d, 1 ; grass
	db $30, $31, 1 ; grass
	db $32, $31, 1 ; grass
	db -1 ; end

.cave:
; facing block, replacement block, animation
	db $47, $1d, 1 ; grass
	db $78, $1d, 1 ; grass
	db -1 ; end

.forest:
; facing block, replacement block, animation
	db $0c, $04, 1 ; grass
	db -1 ; end

; these blocks all use COLL_WHIRLPOOL in one quadrant
WhirlpoolBlockPointers:
	dbw TILESET_NIHON_HITECH, .nihon_hitech
	dbw TILESET_NIHON_NORTH,  .nihon_north
	db -1 ; end

.nihon_hitech:
; facing block, replacement block, animation
	db $68, $21, 0
	db -1 ; end

.nihon_north:
; facing block, replacement block, animation
	db $5b, $21, 0
	db $5f, $21, 0
	db -1 ; end
