BattleIntroSlidingPics:
	ld b, $70
	ld c, $90
	ld a, c
	ldh [hSCX], a
	call DelayFrame
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals

.loop1
	push bc
	ld h, b
	ld l, $40
	call .subfunction2
	ld h, $00
	ld l, $60
	call .subfunction2
	call .subfunction1
	pop bc
	ld a, c
	ldh [hSCX], a
	inc b
	inc b
	dec c
	dec c
	jr nz, .loop1
	ret

.subfunction1
	push bc
	ld hl, wShadowOAMSprite00XCoord
	ld c, $12 ; 18
	ld de, OBJ_SIZE
.loop2
	dec [hl]
	dec [hl]
	add hl, de
	dec c
	jr nz, .loop2
	pop bc
	ret

.subfunction2
.loop3
	ldh a, [rLY]
	cp l
	jr nz, .loop3
	ld a, h
	ldh [rSCX], a

.loop4
	ldh a, [rLY]
	cp h
	jr z, .loop4
	ret
