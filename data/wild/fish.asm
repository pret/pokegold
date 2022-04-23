time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod
	db \1
	dw \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH, FishGroups
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Qwilfish_Swarm_Old,   .Qwilfish_Swarm_Good,   .Qwilfish_Swarm_Super
	fishgroup 50 percent + 1, .Remoraid_Swarm_Old,   .Remoraid_Swarm_Good,   .Remoraid_Swarm_Super
	fishgroup 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	fishgroup 50 percent + 1, .Qwilfish_Old,         .Qwilfish_Good,         .Qwilfish_Super
	fishgroup 50 percent + 1, .Remoraid_Old,         .Remoraid_Good,         .Remoraid_Super
	fishgroup 50 percent + 1, .Qwilfish_NoSwarm_Old, .Qwilfish_NoSwarm_Good, .Qwilfish_NoSwarm_Super
	assert_table_length NUM_FISHGROUPS

.Shore_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     KRABBY,     15
.Shore_Good:
	db  35 percent,     MAGIKARP,   28
	db  70 percent,     KRABBY,     28
	db  90 percent + 1, KRABBY,     28
	db 100 percent,     time_group 0
.Shore_Super:
	db  40 percent,     KRABBY,     45
	db  70 percent,     time_group 1
	db  90 percent + 1, KRABBY,     45
	db 100 percent,     KINGLER,    45

.Ocean_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     TENTACOOL,  15
.Ocean_Good:
	db  35 percent,     MAGIKARP,   28
	db  70 percent,     TENTACOOL,  28
	db  90 percent + 1, CHINCHOU,   28
	db 100 percent,     time_group 2
.Ocean_Super:
	db  40 percent,     CHINCHOU,   45
	db  70 percent,     time_group 3
	db  90 percent + 1, TENTACRUEL, 45
	db 100 percent,     LANTURN,    45

.Lake_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     GOLDEEN,    15
.Lake_Good:
	db  35 percent,     MAGIKARP,   27
	db  70 percent,     GOLDEEN,    27
	db  90 percent + 1, GOLDEEN,    27
	db 100 percent,     time_group 4
.Lake_Super:
	db  40 percent,     GOLDEEN,    45
	db  70 percent,     time_group 5
	db  90 percent + 1, MAGIKARP,   45
	db 100 percent,     SEAKING,    45

.Pond_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     POLIWAG,    15
.Pond_Good:
	db  35 percent,     MAGIKARP,   27
	db  70 percent,     POLIWAG,    27
	db  90 percent + 1, POLIWAG,    27
	db 100 percent,     time_group 6
.Pond_Super:
	db  40 percent,     POLIWAG,    45
	db  70 percent,     time_group 7
	db  90 percent + 1, MAGIKARP,   45
	db 100 percent,     POLIWAG,    45

.Dratini_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     MAGIKARP,   15
.Dratini_Good:
	db  35 percent,     MAGIKARP,   25
	db  70 percent,     MAGIKARP,   25
	db  90 percent + 1, MAGIKARP,   25
	db 100 percent,     time_group 8
.Dratini_Super:
	db  40 percent,     MAGIKARP,   45
	db  70 percent,     time_group 9
	db  90 percent + 1, MAGIKARP,   45
	db 100 percent,     DRAGONAIR,  45

.Qwilfish_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     QWILFISH,   15
.Qwilfish_Swarm_Good:
	db  35 percent,     MAGIKARP,   25
	db  70 percent,     QWILFISH,   25
	db  90 percent + 1, QWILFISH,   25
	db 100 percent,     time_group 10
.Qwilfish_Swarm_Super:
	db  40 percent,     QWILFISH,   45
	db  70 percent,     time_group 11
	db  90 percent + 1, QWILFISH,   45
	db 100 percent,     QWILFISH,   45

.Remoraid_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     REMORAID,   15
.Remoraid_Swarm_Good:
	db  35 percent,     MAGIKARP,   27
	db  70 percent,     REMORAID,   27
	db  90 percent + 1, REMORAID,   27
	db 100 percent,     time_group 12
.Remoraid_Swarm_Super:
	db  40 percent,     REMORAID,   46
	db  70 percent,     time_group 13
	db  90 percent + 1, REMORAID,   46
	db 100 percent,     REMORAID,   46

.Gyarados_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     MAGIKARP,   15
.Gyarados_Good:
	db  35 percent,     MAGIKARP,   26
	db  70 percent,     MAGIKARP,   26
	db  90 percent + 1, MAGIKARP,   26
	db 100 percent,     time_group 14
.Gyarados_Super:
	db  40 percent,     MAGIKARP,   45
	db  70 percent,     time_group 15
	db  90 percent + 1, MAGIKARP,   45
	db 100 percent,     MAGIKARP,   45

.Dratini_2_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     MAGIKARP,   15
.Dratini_2_Good:
	db  35 percent,     MAGIKARP,   15
	db  70 percent,     MAGIKARP,   15
	db  90 percent + 1, MAGIKARP,   15
	db 100 percent,     time_group 16
.Dratini_2_Super:
	db  40 percent,     MAGIKARP,   15
	db  70 percent,     time_group 17
	db  90 percent + 1, MAGIKARP,   15
	db 100 percent,     DRAGONAIR,  15

.WhirlIslands_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     KRABBY,     15
.WhirlIslands_Good:
	db  35 percent,     MAGIKARP,   25
	db  70 percent,     KRABBY,     25
	db  90 percent + 1, KRABBY,     25
	db 100 percent,     time_group 18
.WhirlIslands_Super:
	db  40 percent,     KRABBY,     45
	db  70 percent,     time_group 19
	db  90 percent + 1, KINGLER,    45
	db 100 percent,     SEADRA,     45

.Qwilfish_NoSwarm_Old:
.Qwilfish_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     TENTACOOL,  15
.Qwilfish_NoSwarm_Good:
.Qwilfish_Good:
	db  35 percent,     MAGIKARP,   25
	db  70 percent,     TENTACOOL,  25
	db  90 percent + 1, TENTACOOL,  25
	db 100 percent,     time_group 20
.Qwilfish_NoSwarm_Super:
.Qwilfish_Super:
	db  40 percent,     TENTACOOL,  45
	db  70 percent,     time_group 21
	db  90 percent + 1, MAGIKARP,   45
	db 100 percent,     QWILFISH,   45

.Remoraid_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     POLIWAG,    15
.Remoraid_Good:
	db  35 percent,     MAGIKARP,   27
	db  70 percent,     POLIWAG,    27
	db  90 percent + 1, POLIWAG,    27
	db 100 percent,     time_group 6
.Remoraid_Super:
	db  40 percent,     POLIWAG,    45
	db  70 percent,     time_group 7
	db  90 percent + 1, MAGIKARP,   45
	db 100 percent,     REMORAID,   45

TimeFishGroups:
	;  day              nite
	db CORSOLA,    28,  STARYU,     28 ; 0
	db CORSOLA,    45,  STARYU,     45 ; 1
	db SHELLDER,   27,  SHELLDER,   28 ; 2
	db SHELLDER,   45,  SHELLDER,   45 ; 3
	db GOLDEEN,    27,  GOLDEEN,    28 ; 4
	db GOLDEEN,    40,  GOLDEEN,    40 ; 5
	db POLIWAG,    27,  POLIWAG,    28 ; 6
	db POLIWAG,    45,  POLIWAG,    45 ; 7
	db DRATINI,    27,  DRATINI,    28 ; 8
	db DRATINI,    45,  DRATINI,    45 ; 9
	db QWILFISH,   27,  QWILFISH,   28 ; 10
	db QWILFISH,   40,  QWILFISH,   40 ; 11
	db REMORAID,   27,  REMORAID,   28 ; 12
	db REMORAID,   40,  REMORAID,   40 ; 13
	db GYARADOS,   27,  GYARADOS,   28 ; 14
	db GYARADOS,   40,  GYARADOS,   40 ; 15
	db DRATINI,    26,  DRATINI,    26 ; 16
	db DRATINI,    26,  DRATINI,    26 ; 17
	db HORSEA,     27,  HORSEA,     26 ; 18
	db HORSEA,     40,  HORSEA,     40 ; 19
	db TENTACOOL,  27,  TENTACOOL,  27 ; 20
	db TENTACOOL,  40,  TENTACOOL,  40 ; 21
