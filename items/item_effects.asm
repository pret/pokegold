DoItemEffect_:: ; e7a6 (3:67a6)
	ld a, [wd002]
	ld [wd151], a
	call GetItemName
	call Function317b
	ld a, $1
	ld [wFieldMoveSucceeded], a
	ld a, [wd002]
	dec a
	ld hl, .ItemEffects
	rst JumpTable
	ret

.ItemEffects: ; e7c0
	dw MasterBall
	dw UltraBall
	dw Brightpowder
	dw GreatBall
	dw PokeBall
	dw TownMap
	dw Bicycle
	dw MoonStone
	dw Antidote
	dw BurnHeal
	dw IceHeal
	dw Awakening
	dw ParlyzHeal
	dw FullRestore
	dw MaxPotion
	dw HyperPotion
	dw SuperPotion
	dw Potion
	dw EscapeRope
	dw Repel
	dw MaxElixer
	dw FireStone
	dw Thunderstone
	dw WaterStone
	dw Item19
	dw HPUp
	dw Protein
	dw Iron
	dw Carbos
	dw LuckyPunch
	dw Calcium
	dw RareCandy
	dw XAccuracy
	dw LeafStone
	dw MetalPowder
	dw Nugget
	dw PokeDoll
	dw FullHeal
	dw Revive
	dw MaxRevive
	dw GuardSpec
	dw SuperRepel
	dw MaxRepel
	dw DireHit
	dw Item2D
	dw FreshWater
	dw SodaPop
	dw Lemonade
	dw XAttack
	dw Item32
	dw XDefend
	dw XSpeed
	dw XSpecial
	dw CoinCase
	dw Itemfinder
	dw PokeFlute
	dw ExpShare
	dw OldRod
	dw GoodRod
	dw SilverLeaf
	dw SuperRod
	dw PPUp
	dw Ether
	dw MaxEther
	dw Elixer
	dw RedScale
	dw Secretpotion
	dw SSTicket
	dw MysteryEgg
	dw Item47
	dw SilverWing
	dw MoomooMilk
	dw QuickClaw
	dw Psncureberry
	dw GoldLeaf
	dw SoftSand
	dw SharpBeak
	dw Przcureberry
	dw BurntBerry
	dw IceBerry
	dw PoisonBarb
	dw KingsRock
	dw BitterBerry
	dw MintBerry
	dw RedApricorn
	dw Tinymushroom
	dw BigMushroom
	dw Silverpowder
	dw BluApricorn
	dw Item5A
	dw AmuletCoin
	dw YlwApricorn
	dw GrnApricorn
	dw CleanseTag
	dw MysticWater
	dw Twistedspoon
	dw WhtApricorn
	dw Blackbelt
	dw BlkApricorn
	dw Item64
	dw PnkApricorn
	dw Blackglasses
	dw Slowpoketail
	dw PinkBow
	dw Stick
	dw SmokeBall
	dw Nevermeltice
	dw Magnet
	dw Miracleberry
	dw Pearl
	dw BigPearl
	dw Everstone
	dw SpellTag
	dw Ragecandybar
	dw Item73
	dw Item74
	dw MiracleSeed
	dw ThickClub
	dw FocusBand
	dw Item78
	dw Energypowder
	dw EnergyRoot
	dw HealPowder
	dw RevivalHerb
	dw HardStone
	dw LuckyEgg
	dw CardKey
	dw MachinePart
	dw Item81
	dw LostItem
	dw Stardust
	dw StarPiece
	dw BasementKey
	dw Pass
	dw Item87
	dw Item88
	dw Item89
	dw Charcoal
	dw BerryJuice
	dw ScopeLens
	dw Item8D
	dw Item8E
	dw MetalCoat
	dw DragonFang
	dw Item91
	dw Leftovers
	dw Item93
	dw Item94
	dw Item95
	dw Mysteryberry
	dw DragonScale
	dw BerserkGene
	dw Item99
	dw Item9A
	dw Item9B
	dw SacredAsh
	dw HeavyBall
	dw FlowerMail
	dw LevelBall
	dw LureBall
	dw FastBall
	dw ItemA2
	dw LightBall
	dw FriendBall
	dw MoonBall
	dw LoveBall
	dw NormalBox
	dw GorgeousBox
	dw SunStone
	dw PolkadotBow
	dw ItemAB
	dw UpGrade
	dw Berry
	dw GoldBerry
	dw Squirtbottle
	dw ItemB0
	dw ParkBall
	dw RainbowWing
	dw ItemB3

IF DEF(GOLD)
FastBall: ; e926
FriendBall: ; e926
GreatBall: ; e926
HeavyBall: ; e926
LevelBall: ; e926
LoveBall: ; e926
LureBall: ; e926
MasterBall: ; e926
MoonBall: ; e926
ParkBall: ; e926
PokeBall: ; e926
UltraBall: ; e926
	dr $e926, $ee55

TownMap: ; ee55
	dr $ee55, $ee5c

Bicycle: ; ee5c
	dr $ee5c, $ee63

FireStone: ; ee63
LeafStone: ; ee63
MoonStone: ; ee63
SunStone: ; ee63
Thunderstone: ; ee63
WaterStone: ; ee63
	dr $ee63, $ee91

Calcium: ; ee91
Carbos: ; ee91
HPUp: ; ee91
Iron: ; ee91
Protein: ; ee91
	dr $ee91, $ef68

RareCandy: ; ef68
	dr $ef68, $f003

HealPowder: ; f003
	dr $f003, $f022

Antidote: ; f022
Awakening: ; f022
BurnHeal: ; f022
BurntBerry: ; f022
FullHeal: ; f022
IceBerry: ; f022
IceHeal: ; f022
MintBerry: ; f022
Miracleberry: ; f022
ParlyzHeal: ; f022
Przcureberry: ; f022
Psncureberry: ; f022
	dr $f022, $f0ff

RevivalHerb: ; f0ff
	dr $f0ff, $f11e

MaxRevive: ; f11e
Revive: ; f11e
	dr $f11e, $f17e

FullRestore: ; f17e
	dr $f17e, $f1c0

BitterBerry: ; f1c0
	dr $f1c0, $f1dc

Berry: ; f1dc
BerryJuice: ; f1dc
FreshWater: ; f1dc
GoldBerry: ; f1dc
HyperPotion: ; f1dc
Lemonade: ; f1dc
MaxPotion: ; f1dc
MoomooMilk: ; f1dc
Potion: ; f1dc
Ragecandybar: ; f1dc
SodaPop: ; f1dc
SuperPotion: ; f1dc
	dr $f1dc, $f1e2

Energypowder: ; f1e2
	dr $f1e2, $f1e6

EnergyRoot: ; f1e6
	dr $f1e6, $f4a5

EscapeRope: ; f4a5
	dr $f4a5, $f4b8

SuperRepel: ; f4b8
	dr $f4b8, $f4bc

MaxRepel: ; f4bc
	dr $f4bc, $f4c0

Repel: ; f4c0
	dr $f4c0, $f4d8

XAccuracy: ; f4d8
	dr $f4d8, $f4e5

PokeDoll: ; f4e5
	dr $f4e5, $f4fb

GuardSpec: ; f4fb
	dr $f4fb, $f508

DireHit: ; f508
	dr $f508, $f515

XAttack: ; f515
XDefend: ; f515
XSpecial: ; f515
XSpeed: ; f515
	dr $f515, $f55c

PokeFlute: ; f55c
	dr $f55c, $f5e1

CoinCase: ; f5e1
	dr $f5e1, $f5ec

OldRod: ; f5ec
	dr $f5ec, $f5f0

GoodRod: ; f5f0
	dr $f5f0, $f5f4

SuperRod: ; f5f4
	dr $f5f4, $f5ff

Itemfinder: ; f5ff
	dr $f5ff, $f606

Elixer: ; f606
Ether: ; f606
MaxElixer: ; f606
MaxEther: ; f606
Mysteryberry: ; f606
PPUp: ; f606
	dr $f606, $f785

Squirtbottle: ; f785
	dr $f785, $f78c

CardKey: ; f78c
	dr $f78c, $f793

BasementKey: ; f793
	dr $f793, $f79a

SacredAsh: ; f79a
	dr $f79a, $f7aa

NormalBox: ; f7aa
	dr $f7aa, $f7ae

GorgeousBox: ; f7ae
	dr $f7ae, $f7c4

AmuletCoin: ; f7c4
BerserkGene: ; f7c4
BigMushroom: ; f7c4
BigPearl: ; f7c4
Blackbelt: ; f7c4
Blackglasses: ; f7c4
BlkApricorn: ; f7c4
BluApricorn: ; f7c4
Brightpowder: ; f7c4
Charcoal: ; f7c4
CleanseTag: ; f7c4
DragonFang: ; f7c4
DragonScale: ; f7c4
Everstone: ; f7c4
ExpShare: ; f7c4
FlowerMail: ; f7c4
FocusBand: ; f7c4
GoldLeaf: ; f7c4
GrnApricorn: ; f7c4
HardStone: ; f7c4
Item19: ; f7c4
Item2D: ; f7c4
Item32: ; f7c4
Item47: ; f7c4
Item5A: ; f7c4
Item64: ; f7c4
Item73: ; f7c4
Item74: ; f7c4
Item78: ; f7c4
Item81: ; f7c4
Item87: ; f7c4
Item88: ; f7c4
Item89: ; f7c4
Item8D: ; f7c4
Item8E: ; f7c4
Item91: ; f7c4
Item93: ; f7c4
Item94: ; f7c4
Item95: ; f7c4
Item99: ; f7c4
Item9A: ; f7c4
Item9B: ; f7c4
ItemA2: ; f7c4
ItemAB: ; f7c4
ItemB0: ; f7c4
ItemB3: ; f7c4
KingsRock: ; f7c4
Leftovers: ; f7c4
LightBall: ; f7c4
LostItem: ; f7c4
LuckyEgg: ; f7c4
LuckyPunch: ; f7c4
MachinePart: ; f7c4
Magnet: ; f7c4
MetalCoat: ; f7c4
MetalPowder: ; f7c4
MiracleSeed: ; f7c4
MysteryEgg: ; f7c4
MysticWater: ; f7c4
Nevermeltice: ; f7c4
Nugget: ; f7c4
Pass: ; f7c4
Pearl: ; f7c4
PinkBow: ; f7c4
PnkApricorn: ; f7c4
PoisonBarb: ; f7c4
PolkadotBow: ; f7c4
QuickClaw: ; f7c4
RainbowWing: ; f7c4
RedApricorn: ; f7c4
RedScale: ; f7c4
SSTicket: ; f7c4
ScopeLens: ; f7c4
Secretpotion: ; f7c4
SharpBeak: ; f7c4
SilverLeaf: ; f7c4
SilverWing: ; f7c4
Silverpowder: ; f7c4
Slowpoketail: ; f7c4
SmokeBall: ; f7c4
SoftSand: ; f7c4
SpellTag: ; f7c4
StarPiece: ; f7c4
Stardust: ; f7c4
Stick: ; f7c4
ThickClub: ; f7c4
Tinymushroom: ; f7c4
Twistedspoon: ; f7c4
UpGrade: ; f7c4
WhtApricorn: ; f7c4
YlwApricorn: ; f7c4
	dr $f7c4, $f900
ENDC

IF DEF(SILVER)

FastBall ; e924
FriendBall ; e924
GreatBall ; e924
HeavyBall ; e924
LevelBall ; e924
LoveBall ; e924
LureBall ; e924
MasterBall ; e924
MoonBall ; e924
ParkBall ; e924
PokeBall ; e924
UltraBall ; e924
	dr $e924, $ee53

TownMap ; ee53
	dr $ee53, $ee5a

Bicycle ; ee5a
	dr $ee5a, $ee61

FireStone ; ee61
LeafStone ; ee61
MoonStone ; ee61
SunStone ; ee61
Thunderstone ; ee61
WaterStone ; ee61
	dr $ee61, $ee8f

Calcium ; ee8f
Carbos ; ee8f
HPUp ; ee8f
Iron ; ee8f
Protein ; ee8f
	dr $ee8f, $ef66

RareCandy ; ef66
	dr $ef66, $f001

HealPowder ; f001
	dr $f001, $f020

Antidote ; f020
Awakening ; f020
BurnHeal ; f020
BurntBerry ; f020
FullHeal ; f020
IceBerry ; f020
IceHeal ; f020
MintBerry ; f020
Miracleberry ; f020
ParlyzHeal ; f020
Przcureberry ; f020
Psncureberry ; f020
	dr $f020, $f0fd

RevivalHerb ; f0fd
	dr $f0fd, $f11c

MaxRevive ; f11c
Revive ; f11c
	dr $f11c, $f17c

FullRestore ; f17c
	dr $f17c, $f1be

BitterBerry ; f1be
	dr $f1be, $f1da

Berry ; f1da
BerryJuice ; f1da
FreshWater ; f1da
GoldBerry ; f1da
HyperPotion ; f1da
Lemonade ; f1da
MaxPotion ; f1da
MoomooMilk ; f1da
Potion ; f1da
Ragecandybar ; f1da
SodaPop ; f1da
SuperPotion ; f1da
	dr $f1da, $f1e0

Energypowder ; f1e0
	dr $f1e0, $f1e4

EnergyRoot ; f1e4
	dr $f1e4, $f4a3

EscapeRope ; f4a3
	dr $f4a3, $f4b6

SuperRepel ; f4b6
	dr $f4b6, $f4ba

MaxRepel ; f4ba
	dr $f4ba, $f4be

Repel ; f4be
	dr $f4be, $f4d6

XAccuracy ; f4d6
	dr $f4d6, $f4e3

PokeDoll ; f4e3
	dr $f4e3, $f4f9

GuardSpec ; f4f9
	dr $f4f9, $f506

DireHit ; f506
	dr $f506, $f513

XAttack ; f513
XDefend ; f513
XSpecial ; f513
XSpeed ; f513
	dr $f513, $f55a

PokeFlute ; f55a
	dr $f55a, $f5df

CoinCase ; f5df
	dr $f5df, $f5ea

OldRod ; f5ea
	dr $f5ea, $f5ee

GoodRod ; f5ee
	dr $f5ee, $f5f2

SuperRod ; f5f2
	dr $f5f2, $f5fd

Itemfinder ; f5fd
	dr $f5fd, $f604

Elixer ; f604
Ether ; f604
MaxElixer ; f604
MaxEther ; f604
Mysteryberry ; f604
PPUp ; f604
	dr $f604, $f783

Squirtbottle ; f783
	dr $f783, $f78a

CardKey ; f78a
	dr $f78a, $f791

BasementKey ; f791
	dr $f791, $f798

SacredAsh ; f798
	dr $f798, $f7a8

NormalBox ; f7a8
	dr $f7a8, $f7ac

GorgeousBox ; f7ac
	dr $f7ac, $f7c2

AmuletCoin ; f7c2
BerserkGene ; f7c2
BigMushroom ; f7c2
BigPearl ; f7c2
Blackbelt ; f7c2
Blackglasses ; f7c2
BlkApricorn ; f7c2
BluApricorn ; f7c2
Brightpowder ; f7c2
Charcoal ; f7c2
CleanseTag ; f7c2
DragonFang ; f7c2
DragonScale ; f7c2
Everstone ; f7c2
ExpShare ; f7c2
FlowerMail ; f7c2
FocusBand ; f7c2
GoldLeaf ; f7c2
GrnApricorn ; f7c2
HardStone ; f7c2
Item19 ; f7c2
Item2D ; f7c2
Item32 ; f7c2
Item47 ; f7c2
Item5A ; f7c2
Item64 ; f7c2
Item73 ; f7c2
Item74 ; f7c2
Item78 ; f7c2
Item81 ; f7c2
Item87 ; f7c2
Item88 ; f7c2
Item89 ; f7c2
Item8D ; f7c2
Item8E ; f7c2
Item91 ; f7c2
Item93 ; f7c2
Item94 ; f7c2
Item95 ; f7c2
Item99 ; f7c2
Item9A ; f7c2
Item9B ; f7c2
ItemA2 ; f7c2
ItemAB ; f7c2
ItemB0 ; f7c2
ItemB3 ; f7c2
KingsRock ; f7c2
Leftovers ; f7c2
LightBall ; f7c2
LostItem ; f7c2
LuckyEgg ; f7c2
LuckyPunch ; f7c2
MachinePart ; f7c2
Magnet ; f7c2
MetalCoat ; f7c2
MetalPowder ; f7c2
MiracleSeed ; f7c2
MysteryEgg ; f7c2
MysticWater ; f7c2
Nevermeltice ; f7c2
Nugget ; f7c2
Pass ; f7c2
Pearl ; f7c2
PinkBow ; f7c2
PnkApricorn ; f7c2
PoisonBarb ; f7c2
PolkadotBow ; f7c2
QuickClaw ; f7c2
RainbowWing ; f7c2
RedApricorn ; f7c2
RedScale ; f7c2
SSTicket ; f7c2
ScopeLens ; f7c2
Secretpotion ; f7c2
SharpBeak ; f7c2
SilverLeaf ; f7c2
SilverWing ; f7c2
Silverpowder ; f7c2
Slowpoketail ; f7c2
SmokeBall ; f7c2
SoftSand ; f7c2
SpellTag ; f7c2
StarPiece ; f7c2
Stardust ; f7c2
Stick ; f7c2
ThickClub ; f7c2
Tinymushroom ; f7c2
Twistedspoon ; f7c2
UpGrade ; f7c2
WhtApricorn ; f7c2
YlwApricorn ; f7c2
	dr $f7c2, $f8fe
ENDC
