MapSetup_Sound_Off:: ; 3d4f (0:3d4f)
	push hl
	push de
	push bc
	push af
	ld a, [hROMBank]
	push af
	ld a, BANK(_MapSetup_Sound_Off)
	ld [hROMBank], a
	ld [MBC3RomBank], a
	call _MapSetup_Sound_Off
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	pop af
	pop bc
	pop de
	pop hl
	ret

UpdateSound:: ; 3d6b (0:3d6b)
	push hl
	push de
	push bc
	push af
	ld a, [hROMBank]
	push af
	ld a, BANK(_UpdateSound)
	ld [hROMBank], a
	ld [MBC3RomBank], a
	call _UpdateSound
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	pop af
	pop bc
	pop de
	pop hl
	ret

_LoadMusicByte::
	ld [hROMBank], a
	ld [MBC3RomBank], a

	ld a, [de]
	ld [wCurMusicByte], a
	ld a, BANK(_UpdateSound)

	ld [hROMBank], a
	ld [MBC3RomBank], a
	ret

PlayMusic:: ; 3d98 (0:3d98)
	push hl
	push de
	push bc
	push af
	ld a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic)
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ld a, e
	and a
	jr z, .asm_3daf
	call _PlayMusic ; $4b30
	jr .asm_3db2

.asm_3daf
	call _MapSetup_Sound_Off
.asm_3db2
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	pop af
	pop bc
	pop de
	pop hl
	ret

PlayMusic2::
	push hl
	push de
	push bc
	push af
	ld a, [hROMBank]
	push af
	ld a, BANK(_PlayMusic)
	ld [hROMBank], a
	ld [MBC3RomBank], a
	push de
	ld de, MUSIC_NONE
	call _PlayMusic
	call DelayFrame
	pop de
	call _PlayMusic
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	pop af
	pop bc
	pop de
	pop hl
	ret

PlayCry:: ; 3de4 (0:3de4)
	push hl
	push de
	push bc
	push af
	ld a, [hROMBank]
	push af
	ld a, BANK(CryHeaders) ; $3c
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ld hl, CryHeaders ; $6747
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hli]
	ld [wCryPitch], a
	ld a, [hli]
	ld [wCryPitch + 1], a
	ld a, [hli]
	ld [wCryLength], a
	ld a, [hl]
	ld [wCryLength + 1], a
	ld a, BANK(_PlayCry)
	ld [hROMBank], a
	ld [MBC3RomBank], a
	call _PlayCry
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
	pop af
	pop bc
	pop de
	pop hl
	ret

PlaySFX:: ; 3e24 (0:3e24)
	push hl
	push de
	push bc
	push af
	call CheckSFX
	jr nc, .asm_3e33
	ld a, [wCurSFX]
	cp e
	jr c, .asm_3e4a
.asm_3e33
	ld a, [hROMBank]
	push af
	ld a, BANK(_PlaySFX) ; $3a
	ld [hROMBank], a
	ld [MBC3RomBank], a
	ld a, e
	ld [wCurSFX], a
	call _PlaySFX ; $4c04
	pop af
	ld [hROMBank], a
	ld [MBC3RomBank], a
.asm_3e4a
	pop af
	pop bc
	pop de
	pop hl
	ret

WaitPlaySFX::
	call WaitSFX
	call PlaySFX
	ret

WaitSFX:: ; 3e56 (0:3e56)
	push hl
.asm_3e57
	ld hl, wChannel5Flags1
	bit 0, [hl]
	jr nz, .asm_3e57
	ld hl, wChannel6Flags1
	bit 0, [hl]
	jr nz, .asm_3e57
	ld hl, wChannel7Flags1
	bit 0, [hl]
	jr nz, .asm_3e57
	ld hl, wChannel8Flags1
	bit 0, [hl]
	jr nz, .asm_3e57
	pop hl
	ret

MaxVolume::
	ld a, $77
	ld [wVolume], a
	ret

LowVolume::
	ld a, $33
	ld [wVolume], a
	ret

VolumeOff::
	xor a
	ld [wVolume], a
	ret

FadeOutMusic::
	ld a, $4
	ld [wMusicFade], a
	ret

FadeInMusic::
	ld a, 4 | 1 << 7
	ld [wMusicFade], a
	ret

Function3e92:: ; 3e92 (0:3e92)
	and a
	ret z
	dec a
	call UpdateSound
	jr Function3e92

FadeToMapMusic::
	push hl
	push de
	push bc
	push af
	call GetMapMusic
	ld a, [wMapMusic]
	cp e
	jr z, .asm_3eb8
	ld a, $8
	ld [wMusicFade], a
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a
	ld a, e
	ld [wChannelsEnd], a
.asm_3eb8
	pop af
	pop bc
	pop de
	pop hl
	ret

PlayMapMusic::
	push hl
	push de
	push bc
	push af
	call GetMapMusic
	ld a, [wMapMusic]
	cp e
	jr z, .asm_3edc
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
.asm_3edc
	pop af
	pop bc
	pop de
	pop hl
	ret

EnterMapMusic::
	push hl
	push de
	push bc
	push af
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld de, MUSIC_BICYCLE
	ld a, [wPlayerState]
	cp $1
	jr z, .asm_3ef6
	call GetMapMusic
.asm_3ef6
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	ld a, e
	ld [wChannelsEnd], a
	call PlayMusic
	pop af
	pop bc
	pop de
	pop hl
	ret

TryRestartMapMusic::
	ld a, [wDontPlayMapMusicOnReload]
	and a
	jr z, RestartMapMusic
	xor a
	ld [wChannelsEnd], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ret

RestartMapMusic::
	push hl
	push de
	push bc
	push af
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld a, [wChannelsEnd]
	ld e, a
	ld d, $0
	call PlayMusic
	pop af
	pop bc
	pop de
	pop hl
	ret

SpecialMapMusic:: ; 3f40 (0:3f40)
	ld a, [wPlayerState]
	cp PLAYER_SURF
	jr z, .surf
	cp PLAYER_SURF_PIKA
	jr z, .surf
	CheckFlag ENGINE_BUG_CONTEST_TIMER
	jr nz, .contest
.normal
	and a
	ret

.bike
	ld de, MUSIC_BICYCLE
	scf
	ret

.surf
	ld de, MUSIC_SURF
	scf
	ret

.contest
	ld a, [wMapGroup]
	cp GROUP_ROUTE_35_NATIONAL_PARK_GATE
	jr nz, .normal
	ld a, [wMapNumber]
	cp MAP_ROUTE_35_NATIONAL_PARK_GATE
	jr z, .ranking
	cp MAP_ROUTE_36_NATIONAL_PARK_GATE
	jr nz, .normal
.ranking
	ld de, MUSIC_BUG_CATCHING_CONTEST_RANKING
	scf
	ret

GetMapMusic:: ; 3f75 (0:3f75)
	call SpecialMapMusic
	ret c
	call GetMapHeaderMusic
	ret

Function3f7d::
	ld a, $20
	ld [$c398], a
	ld [$c39c], a
	ld a, $50
	ld [$c399], a
	ld a, $58
	ld [$c39d], a
	xor a
	ld [$c39b], a
	ld [$c39f], a
	ld a, [wc196]
	cp $64
	jr nc, .asm_3fb3
	add $1
	daa
	ld b, a
	swap a
	and $f
	add $f6
	ld [$c39a], a
	ld a, b
	and $f
	add $f6
	ld [$c39e], a
	ret

.asm_3fb3
	ld a, $ff
	ld [$c39a], a
	ld [$c39e], a
	ret

CheckSFX:: ; 3fbc (0:3fbc)
	ld a, [wChannel5Flags1]
	bit 0, a
	jr nz, .asm_3fda
	ld a, [wChannel6Flags1]
	bit 0, a
	jr nz, .asm_3fda
	ld a, [wChannel7Flags1]
	bit 0, a
	jr nz, .asm_3fda
	ld a, [wChannel8Flags1]
	bit 0, a
	jr nz, .asm_3fda
	and a
	ret

.asm_3fda
	scf
	ret

TerminateExpBarSound::
	xor a
	ld [wChannel5Flags1], a
	ld [wSoundInput], a
	ld [rNR10], a
	ld [rNR11], a
	ld [rNR12], a
	ld [rNR13], a
	ld [rNR14], a
	ret
