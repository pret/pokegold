; Game Boy hardware interrupts

SECTION "vblank", ROM0[$40]
	jp VBlank ; $0150

SECTION "lcd", ROM0[$48]
	jp LCD ; $041b

SECTION "timer", ROM0[$50]
	reti

SECTION "serial", ROM0[$58]
	jp Serial ; $06aa

SECTION "joypad", ROM0[$60]
	jp JoypadInt ; $08df
