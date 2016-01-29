Cry_3D: ; f0941
	dbw $04, Cry_3D_Ch5
; f0944


INCBIN "baserom.gbc", $f0944, $f0947 - $f0944


Cry_3E: ; f0947
	dbw $04, Cry_3E_Ch5
; f094a

Cry_3F: ; f094a
	dbw $04, Cry_3F_Ch5
; f094d

Cry_40: ; f094d
	dbw $07, Cry_40_Ch8
; f0950

Cry_41: ; f0950
Cry_42: ; f0950
	dbw $04, Cry_41_Ch5
; f0953


INCBIN "baserom.gbc", $f0953, $f0b3f - $f0953


Cry_3A: ; f0b3f
	dbw $c4, Cry_3A_Ch5
	dbw $05, Cry_3A_Ch6
	dbw $06, Cry_3A_Ch7
	dbw $07, Cry_3A_Ch8
; f0b4b

Cry_3A_Ch5: ; f0b4b
	togglesfx
	tempo 120
	volume $77
	dutycycle $2
	notetype $8, $b1
	octave 3
	note B_, 2
	note B_, 2
	note B_, 2
	intensity $b3
	octave 4
	note G#, 12
	endchannel
; f0b5f

Cry_3A_Ch6: ; f0b5f
	togglesfx
	dutycycle $2
	notetype $8, $c1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	intensity $c3
	note B_, 12
	endchannel
; f0b6d

Cry_3A_Ch7: ; f0b6d
	togglesfx
	notetype $8, $25
	octave 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 5
	note E_, 5
	intensity $35
	note E_, 3
	note __, 4
	endchannel
; f0b7f

Cry_3A_Ch8: ; f0b7f
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 12
	endchannel
; f0b86


INCBIN "baserom.gbc", $f0b86, $f0bd5 - $f0b86


Cry_43: ; f0bd5
	dbw $c4, Cry_43_Ch5
	dbw $05, Cry_43_Ch6
	dbw $06, Cry_43_Ch7
	dbw $07, Cry_43_Ch8
; f0be1

Cry_43_Ch5: ; f0be1
	togglesfx
	tempo 104
	volume $77
	dutycycle $2
	notetype $c, $88
	octave 3
	note A_, 4
	note __, 2
	note A_, 1
	note __, 1
	note A#, 4
	note __, 2
	note A#, 1
	note __, 1
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note A#, 2
	note __, 2
	note A_, 2
	note __, 6
	endchannel
; f0bfe

Cry_43_Ch6: ; f0bfe
	togglesfx
	dutycycle $2
	notetype $c, $c1
	octave 5
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 4
	note G_, 4
	note F_, 8
	endchannel
; f0c13

Cry_43_Ch7: ; f0c13
	togglesfx
	notetype $c, $25
	octave 4
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note A_, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 2
	note __, 6
	endchannel
; f0c27

Cry_43_Ch8: ; f0c27
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0c2f

Cry_3B: ; f0c2f
	dbw $c4, Cry_3B_Ch5
	dbw $05, Cry_3B_Ch6
	dbw $06, Cry_3B_Ch7
	dbw $07, Cry_3B_Ch8
; f0c3b

Cry_3B_Ch5: ; f0c3b
	togglesfx
	tempo 108
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $8, $b2
	octave 4
	note C_, 6
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 4
	note G_, 4
	note G_, 4
	note F_, 12
	note __, 12
	endchannel
; f0c54

Cry_3B_Ch6: ; f0c54
	togglesfx
	vibrato $8, $27
	dutycycle $2
	notetype $8, $c3
	octave 4
	note A_, 6
	note A_, 2
	note A_, 2
	note A_, 2
	note A#, 4
	note A#, 4
	note A#, 4
	note A_, 12
	note __, 12
	endchannel
; f0c68

Cry_3B_Ch7: ; f0c68
	togglesfx
	notetype $8, $25
	octave 4
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 6
	intensity $35
	note F_, 4
	note __, 14
	endchannel
; f0c81

Cry_3B_Ch8: ; f0c81
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0c89

Cry_3C: ; f0c89
	dbw $c4, Cry_3C_Ch5
	dbw $05, Cry_3C_Ch6
	dbw $06, Cry_3C_Ch7
	dbw $07, Cry_3C_Ch8
; f0c95

Cry_3C_Ch5: ; f0c95
	togglesfx
	tempo 112
	volume $77
	vibrato $8, $27
	dutycycle $2
	notetype $8, $b3
	octave 4
	note C_, 6
	octave 3
	note A_, 6
	note F_, 12
	intensity $b1
	octave 4
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note G_, 2
	intensity $b3
	note F_, 12
	endchannel
; f0cb5

Cry_3C_Ch6: ; f0cb5
	togglesfx
	dutycycle $2
	vibrato $8, $27
	notetype $8, $c3
	octave 4
	note A_, 6
	note F_, 6
	note C_, 12
	intensity $c1
	note A#, 2
	note A#, 2
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	intensity $c3
	note A_, 12
	endchannel
; f0cce

Cry_3C_Ch7: ; f0cce
	togglesfx
	notetype $8, $25
	octave 3
	note C_, 12
	note C_, 6
	octave 2
	note A_, 2
	octave 3
	note C_, 2
	note F_, 2
	note G_, 6
	note A#, 6
	note A_, 6
	intensity $35
	note A_, 3
	note __, 3
	endchannel
; f0ce2

Cry_3C_Ch8: ; f0ce2
	togglesfx
	sfxtogglenoise $4
	notetype $c
	note C_, 16
	note __, 16
	endchannel
; f0cea


INCBIN "baserom.gbc", $f0cea, $f1cd0 - $f0cea


Cry_40_Ch8: ; f1cd0
	noise $1, $e2, $33
	noise $8, $e1, $22
	endchannel
; f1cd7


INCBIN "baserom.gbc", $f1cd7, $f1d1e - $f1cd7


Cry_3D_Ch5: ; f1d1e
	dutycycle $2
	soundinput $3a
	sound $4, $f2, $0200
	soundinput $22
	sound $8, $e2, $0200
	soundinput $8
	endchannel
; f1d2f


INCBIN "baserom.gbc", $f1d2f, $f1d87 - $f1d2f


Cry_41_Ch5: ; f1d87
Cry_42_Ch5: ; f1d87
	dutycycle $2
	sound $0, $91, $07c0
	sound $0, $81, $07d0
	sound $0, $91, $07c0
	sound $c, $a1, $07d0
	endchannel
; f1d9a

Cry_3E_Ch5: ; f1d9a
	dutycycle $2
	soundinput $17
	sound $f, $f0, $04f0
	sound $f, $f2, $0650
	soundinput $8
	endchannel
; f1da9


INCBIN "baserom.gbc", $f1da9, $f1dbc - $f1da9


Cry_3F_Ch5: ; f1dbc
	dutycycle $2
	soundinput $14
	sound $4, $f2, $0600
	sound $4, $f2, $0600
	soundinput $17
	sound $f, $f2, $0600
	soundinput $8
	endchannel
; f1dd1


INCBIN "baserom.gbc", $f1dd1, $f2d41 - $f1dd1


Cry_1C: ; f2d41
	dbw $84, Cry_1C_Ch5
	dbw $05, Cry_1C_Ch6
	dbw $07, Cry_1C_Ch8
; f2d4a

Cry_1E: ; f2d4a
	dbw $44, Cry_1E_Ch5
	dbw $05, Cry_1E_Ch6
; f2d50

Cry_22: ; f2d50
	dbw $44, Cry_22_Ch5
	dbw $05, Cry_22_Ch6
; f2d56

Cry_1D: ; f2d56
	dbw $84, Cry_1D_Ch5
	dbw $05, Cry_1D_Ch6
	dbw $07, Cry_1D_Ch8
; f2d5f

Cry_20: ; f2d5f
	dbw $84, Cry_20_Ch5
	dbw $05, Cry_20_Ch6
	dbw $07, Cry_20_Ch8
; f2d68

Cry_23: ; f2d68
	dbw $84, Cry_23_Ch5
	dbw $05, Cry_23_Ch6
	dbw $07, Cry_23_Ch8
; f2d71

Cry_24: ; f2d71
	dbw $44, Cry_24_Ch5
	dbw $05, Cry_24_Ch6
; f2d77

Cry_25: ; f2d77
	dbw $84, Cry_25_Ch5
	dbw $05, Cry_25_Ch6
	dbw $07, Cry_25_Ch8
; f2d80

Cry_21: ; f2d80
	dbw $44, Cry_21_Ch5
	dbw $05, Cry_21_Ch6
; f2d86

Cry_26: ; f2d86
	dbw $84, Cry_26_Ch5
	dbw $05, Cry_26_Ch6
	dbw $07, Cry_26_Ch8
; f2d8f

Cry_27: ; f2d8f
	dbw $84, Cry_27_Ch5
	dbw $05, Cry_27_Ch6
	dbw $07, Cry_27_Ch8
; f2d98

Cry_29: ; f2d98
	dbw $44, Cry_29_Ch5
	dbw $07, Cry_29_Ch8
; f2d9e

Cry_1F: ; f2d9e
	dbw $84, Cry_1F_Ch5
	dbw $05, Cry_1F_Ch6
	dbw $07, Cry_1F_Ch8
; f2da7

Cry_2B: ; f2da7
	dbw $44, Cry_2B_Ch5
	dbw $07, Cry_2B_Ch8
; f2dad

Cry_2C: ; f2dad
	dbw $84, Cry_2C_Ch5
	dbw $05, Cry_2C_Ch6
	dbw $07, Cry_2C_Ch8
; f2db6

Cry_2E: ; f2db6
	dbw $84, Cry_2E_Ch5
	dbw $05, Cry_2E_Ch6
	dbw $07, Cry_2E_Ch8
; f2dbf

Cry_39: ; f2dbf
	dbw $84, Cry_39_Ch5
	dbw $05, Cry_39_Ch6
	dbw $07, Cry_39_Ch8
; f2dc8

Cry_30: ; f2dc8
	dbw $84, Cry_30_Ch5
	dbw $05, Cry_30_Ch6
	dbw $07, Cry_30_Ch8
; f2dd1

Cry_31: ; f2dd1
	dbw $84, Cry_31_Ch5
	dbw $05, Cry_31_Ch6
	dbw $07, Cry_31_Ch8
; f2dda

Cry_32: ; f2dda
	dbw $84, Cry_32_Ch5
	dbw $05, Cry_32_Ch6
	dbw $07, Cry_32_Ch8
; f2de3

Cry_33: ; f2de3
	dbw $84, Cry_33_Ch5
	dbw $05, Cry_33_Ch6
	dbw $07, Cry_33_Ch8
; f2dec

Cry_34: ; f2dec
	dbw $84, Cry_34_Ch5
	dbw $05, Cry_34_Ch6
	dbw $07, Cry_34_Ch8
; f2df5

Cry_28: ; f2df5
	dbw $84, Cry_28_Ch5
	dbw $05, Cry_28_Ch6
	dbw $07, Cry_28_Ch8
; f2dfe

Cry_2A: ; f2dfe
	dbw $84, Cry_2A_Ch5
	dbw $05, Cry_2A_Ch6
	dbw $07, Cry_2A_Ch8
; f2e07

Cry_36: ; f2e07
	dbw $84, Cry_36_Ch5
	dbw $05, Cry_36_Ch6
	dbw $07, Cry_36_Ch8
; f2e10

Cry_37: ; f2e10
	dbw $84, Cry_37_Ch5
	dbw $05, Cry_37_Ch6
	dbw $07, Cry_37_Ch8
; f2e19

Cry_38: ; f2e19
	dbw $84, Cry_38_Ch5
	dbw $05, Cry_38_Ch6
	dbw $07, Cry_38_Ch8
; f2e22

Cry_35: ; f2e22
	dbw $84, Cry_35_Ch5
	dbw $05, Cry_35_Ch6
	dbw $07, Cry_35_Ch8
; f2e2b

Cry_2D: ; f2e2b
	dbw $84, Cry_2D_Ch5
	dbw $05, Cry_2D_Ch6
	dbw $07, Cry_2D_Ch8
; f2e34

Cry_2F: ; f2e34
	dbw $84, Cry_2F_Ch5
	dbw $05, Cry_2F_Ch6
	dbw $07, Cry_2F_Ch8
; f2e3d

Cry_2D_Ch5: ; f2e3d
	soundinput $ff
	unknownmusic0xde $63
	sound $1, $f8, $05f8
	sound $8, $9f, $04d8
	sound $6, $f8, $05c4
	sound $14, $f2, $0574
	soundinput $88
	endchannel
; f2e54

Cry_2D_Ch6: ; f2e54
	unknownmusic0xde $33
	sound $1, $c8, $0640
	sound $6, $ff, $0668
	sound $7, $a8, $0534
	sound $14, $a2, $04a4
	endchannel
; f2e67

Cry_2D_Ch8: ; f2e67
	noise $a, $d6, $6a
	noise $6, $bc, $6c
	noise $6, $e2, $5c
	noise $20, $b4, $6c
	endchannel
; f2e74

Cry_35_Ch5: ; f2e74
	unknownmusic0xde $c4
	sound $4, $af, $0720
	sound $2, $f8, $071c
	sound $2, $f8, $0718
	sound $2, $f8, $0708
	sound $2, $f8, $070e
	sound $c, $c8, $0712
	sound $4, $91, $070e
	endchannel
; f2e93

Cry_35_Ch6: ; f2e93
	unknownmusic0xde $a
	sound $1, $b8, $0710
	sound $3, $d8, $072c
	sound $4, $d8, $0665
	sound $1, $b8, $0656
	sound $1, $d8, $065c
	sound $c, $f8, $0760
	sound $4, $c1, $0750
	endchannel
; f2eb2

Cry_35_Ch8: ; f2eb2
	noise $2, $e8, $3b
Cry_35_branch_f2eb5: ; f2eb5
	noise $1, $f1, $4e
	loopchannel 5, Cry_35_branch_f2eb5
	noise $2, $d8, $3f
	noise $14, $c2, $5f
	endchannel
; f2ec3

Cry_38_Ch5: ; f2ec3
	unknownmusic0xde $22
	sound $1, $f8, $05b0
	sound $1, $f8, $04b4
	sound $1, $f8, $05b8
	sound $3, $f8, $05c0
	sound $8, $c8, $0490
	sound $8, $c8, $0480
	soundinput $fe
	sound $10, $c3, $0490
	soundinput $88
	endchannel
; f2ee6

Cry_38_Ch6: ; f2ee6
	unknownmusic0xde $22
	sound $8, $b8, $04c8
	sound $20, $b5, $0410
	endchannel
; f2ef1

Cry_38_Ch8: ; f2ef1
	noise $3, $ff, $4b
	noise $3, $ef, $4c
	noise $20, $b5, $5f
	endchannel
; f2efb

Cry_25_Ch5: ; f2efb
	unknownmusic0xde $33
	sound $2, $f1, $0550
	sound $2, $f1, $0530
	sound $2, $f1, $0510
	sound $2, $f2, $0650
	sound $2, $f2, $0640
	sound $2, $f2, $0630
	sound $10, $f2, $0550
	endchannel
; f2f1a

Cry_25_Ch6: ; f2f1a
	unknownmusic0xde $f2
	sound $4, $e1, $0620
	sound $5, $e2, $0500
	sound $6, $e1, $0620
	sound $2, $e1, $0520
	sound $10, $e2, $0500
	endchannel
; f2f31

Cry_25_Ch8: ; f2f31
	noise $2, $8a, $5d
	noise $2, $9a, $4c
	noise $5, $9a, $5d
	noise $2, $9a, $4d
	noise $2, $9a, $4b
	noise $2, $9a, $4d
	noise $2, $9a, $5f
	noise $10, $b2, $6f
	endchannel
; f2f4a

Cry_36_Ch5: ; f2f4a
	dutycycle $0
	soundinput $f7
	sound $2, $f8, $078d
	sound $2, $f8, $0791
	soundinput $ff
	sound $2, $f8, $07ad
	soundinput $88
	sound $2, $f8, $07b4
	soundinput $f7
	sound $2, $f8, $07b8
	soundinput $88
	endchannel
; f2f6b

Cry_36_Ch6: ; f2f6b
	unknownmusic0xde $10
	sound $2, $c8, $076d
	sound $2, $c8, $0771
	sound $2, $c8, $078d
	sound $2, $c8, $0794
	sound $2, $c8, $0798
	endchannel
; f2f82

Cry_36_Ch8: ; f2f82
	noise $2, $b8, $1
	noise $2, $b8, $19
	noise $2, $c8, $18
	noise $2, $b8, $10
	noise $8, $c2, $18
	endchannel
; f2f92

Cry_1C_Ch5: ; f2f92
	unknownmusic0xde $22
	sound $2, $88, $06d8
	sound $8, $e2, $06e0
	sound $2, $61, $06e5
	sound $2, $e8, $06c0
	sound $2, $e8, $06b8
	sound $2, $d8, $06b0
	sound $8, $c1, $06aa
	endchannel
; f2fb1

Cry_1C_Ch6: ; f2fb1
	unknownmusic0xde $63
	sound $2, $68, $06b1
	sound $5, $c1, $06b9
	sound $5, $99, $0760
	sound $2, $b8, $068c
	sound $2, $a8, $0684
	sound $a, $92, $067b
	endchannel
; f2fcc

Cry_1C_Ch8: ; f2fcc
	noise $1, $99, $6c
	noise $1, $92, $5c
	noise $a, $62, $4c
	noise $2, $68, $6a
	noise $2, $68, $6b
	noise $a, $62, $6c
	endchannel
; f2fdf

Cry_1E_Ch5: ; f2fdf
	tone $0002
Cry_1E_Ch6: ; f2fe2
Cry_22_branch_f2fe2: ; f2fe2
	unknownmusic0xde $52
	sound $4, $f1, $0796
	sound $4, $f1, $072d
	sound $7, $0, $0000
	sound $10, $f1, $07a7
	endchannel
; f2ff5

Cry_22_Ch5: ; f2ff5
	tone $0002
Cry_22_Ch6: ; f2ff8
Cry_22_branch_f2ff8: ; f2ff8
	callchannel Cry_22_branch_f2fe2
	loopchannel 2, Cry_22_branch_f2ff8
	sound $e, $0, $0000
	sound $8, $f2, $07c2
	endchannel
; f3008

Cry_1D_Ch5: ; f3008
	dutycycle $1
	sound $3, $2c, $07c4
	sound $1, $0, $0001
	sound $5, $59, $07b9
	sound $6, $b4, $07bb
	endchannel
; f301b

Cry_1D_Ch6: ; f301b
	unknownmusic0xde $2a
	sound $3, $2c, $07c7
	sound $1, $0, $0000
	sound $5, $59, $07be
	sound $6, $b4, $07bd
	endchannel
; f302e

Cry_1D_Ch8: ; f302e
	noise $3, $92, $10
	noise $1, $39, $0
	noise $5, $69, $10
	noise $6, $93, $0
	endchannel
; f303b

Cry_20_Ch5: ; f303b
	unknownmusic0xde $f8
	sound $2, $f1, $04b0
	sound $2, $f7, $0590
	sound $8, $f8, $0510
	sound $3, $f2, $06c0
	sound $3, $f8, $06ba
	sound $3, $f2, $06b0
	sound $10, $f2, $0690
	endchannel
; f305a

Cry_20_Ch6: ; f305a
	unknownmusic0xde $f2
	sound $2, $f1, $0720
	sound $2, $e1, $0650
	sound $4, $f1, $0750
	sound $4, $d1, $03a0
	sound $3, $f1, $0670
	sound $3, $e1, $0680
	sound $3, $f2, $0690
	sound $10, $e2, $06a0
	endchannel
; f307d

Cry_20_Ch8: ; f307d
	noise $2, $89, $2e
	noise $2, $99, $1f
	noise $4, $89, $4e
	noise $4, $89, $7b
	noise $3, $d8, $4b
	noise $3, $e7, $4c
	noise $3, $ec, $4d
	noise $10, $d2, $4f
	endchannel
; f3096

Cry_23_Ch5: ; f3096
	unknownmusic0xde $66
	sound $4, $78, $0650
	sound $4, $f8, $0660
	sound $4, $f8, $065c
	sound $1, $f8, $067c
	sound $4, $f8, $0680
	sound $4, $f8, $067c
	sound $4, $f8, $0678
	sound $4, $f1, $0674
	endchannel
; f30b9

Cry_23_Ch6: ; f30b9
	unknownmusic0xde $22
Cry_23_branch_f30bb: ; f30bb
	sound $2, $a1, $0600
	loopchannel 3, Cry_23_branch_f30bb
Cry_23_branch_f30c3: ; f30c3
	sound $2, $a1, $0630
	loopchannel 4, Cry_23_branch_f30c3
	sound $4, $a2, $0634
	sound $4, $91, $0638
	endchannel
; f30d4

Cry_23_Ch8: ; f30d4
	noise $1, $68, $36
	noise $10, $88, $6a
	noise $1, $98, $5e
	noise $10, $a7, $6e
	endchannel
; f30e1

Cry_24_Ch5: ; f30e1
	tone $0020
	dutycycle $0
	jumpchannel Cry_24_branch_f30eb
; f30e9

Cry_24_Ch6: ; f30e9
	unknownmusic0xde $1b
Cry_24_branch_f30eb: ; f30eb
	sound $8, $39, $072d
	sound $8, $f1, $0720
	endchannel
; f30f4


INCBIN "baserom.gbc", $f30f4, $f30fb - $f30f4


Cry_21_Ch5: ; f30fb
	tone $0020
	dutycycle $0
	jumpchannel Cry_21_branch_f3105
; f3103

Cry_21_Ch6: ; f3103
	unknownmusic0xde $1
Cry_21_branch_f3105: ; f3105
Cry_29_branch_f3105: ; f3105
	sound $4, $3a, $073d
	sound $6, $f8, $0762
	sound $6, $f8, $0760
	sound $6, $f1, $075e
	endchannel
; f3116

Cry_26_Ch5: ; f3116
	tone $0020
Cry_26_Ch6: ; f3119
	dutycycle $2
	sound $8, $2f, $0107
Cry_26_branch_f311f: ; f311f
	sound $0, $e1, $0483
	sound $0, $51, $044e
	loopchannel 4, Cry_26_branch_f311f
Cry_26_branch_f312b: ; f312b
	sound $0, $e1, $03da
	sound $1, $51, $0312
	loopchannel 4, Cry_26_branch_f312b
Cry_2E_Ch8: ; f3134
	noise $4, $2b, $71
	endchannel
; f3138

Cry_26_Ch8: ; f3138
Cry_29_Ch8: ; f3138
	noise $8, $3f, $52
	noise $20, $93, $4f
	endchannel
; f313f

Cry_27_Ch5: ; f313f
	tone $0020
Cry_27_Ch6: ; f3142
	unknownmusic0xde $21
	sound $2, $c8, $0641
	sound $2, $48, $0641
	sound $6, $f8, $0790
	sound $4, $f8, $078e
	sound $4, $f1, $078b
	endchannel
; f3159

Cry_27_Ch8: ; f3159
	noise $4, $91, $10
	noise $8, $94, $3
	endchannel
; f3160

Cry_29_Ch5: ; f3160
	unknownmusic0xde $a2
	jumpchannel Cry_29_branch_f3105
; f3165

Cry_1F_Ch5: ; f3165
	dutycycle $1
	tone $0004
	jumpchannel Cry_1F_branch_f316f
; f316d

Cry_1F_Ch6: ; f316d
	unknownmusic0xde $41
Cry_1F_branch_f316f: ; f316f
	sound $4, $68, $0758
	sound $2, $e8, $0760
	sound $2, $e8, $0767
	sound $2, $e8, $076c
	sound $7, $f1, $0767
	endchannel
; f3184

Cry_1F_Ch8: ; f3184
	noise $4, $29, $0
	noise $2, $39, $1
	noise $2, $49, $2
	noise $2, $59, $1
	noise $7, $41, $0
	endchannel
; f3194

Cry_2B_Ch5: ; f3194
	unknownmusic0xde $91
	sound $c, $f2, $07a6
	sound $4, $f8, $07b0
	sound $4, $e8, $03b0
	sound $6, $f8, $03a0
	sound $8, $e1, $0290
	endchannel
; f31ab

Cry_2B_Ch8: ; f31ab
	noise $c, $b2, $50
	noise $8, $a8, $60
	noise $6, $a8, $5b
	noise $8, $a1, $5c
	endchannel
; f31b8

Cry_2C_Ch5: ; f31b8
	tone $0002
	dutycycle $2
	jumpchannel Cry_2C_branch_f31c2
; f31c0

Cry_2C_Ch6: ; f31c0
	unknownmusic0xde $1
Cry_2C_branch_f31c2: ; f31c2
	sound $3, $f8, $0791
	sound $3, $d8, $078d
	sound $2, $0, $0000
	sound $1, $78, $06c1
	sound $1, $f8, $0741
	sound $4, $e1, $0751
	endchannel
; f31db

Cry_2C_Ch8: ; f31db
	noise $3, $59, $21
	noise $3, $81, $0
	noise $2, $20, $0
	noise $1, $80, $21
	noise $1, $80, $10
	noise $4, $87, $0
	endchannel
; f31ee

Cry_2E_Ch5: ; f31ee
Cry_39_Ch5: ; f31ee
	dutycycle $2
	sound $2, $99, $0718
	sound $4, $ab, $0722
	sound $8, $ab, $0734
	sound $4, $d6, $0716
	sound $8, $d1, $0712
	sound $8, $0, $0000
	endchannel
; f3209

Cry_2E_Ch6: ; f3209
Cry_39_Ch6: ; f3209
	unknownmusic0xde $7
	sound $2, $b9, $0738
	sound $4, $cb, $0742
	sound $8, $cb, $0754
	sound $4, $f6, $0736
	sound $8, $f1, $0732
	sound $8, $0, $0000
	endchannel
; f3224

Cry_2E_Ch8: ; f3224
	noise $2, $5b, $4
	noise $4, $68, $13
	noise $8, $68, $20
	noise $4, $68, $13
	noise $10, $51, $4
	endchannel
; f3234

Cry_39_Ch8: ; f3234
	noise $2, $8b, $59
	noise $4, $a8, $6a
	noise $8, $a8, $70
	noise $4, $a8, $69
	noise $10, $92, $6c
	endchannel
; f3244

Cry_30_Ch5: ; f3244
Cry_32_Ch5: ; f3244
	unknownmusic0xde $12
Cry_30_branch_f3246: ; f3246
Cry_32_branch_f3246: ; f3246
	sound $3, $c1, $0791
	loopchannel 3, Cry_30_branch_f3246
Cry_30_branch_f324e: ; f324e
Cry_32_branch_f324e: ; f324e
	sound $3, $d1, $04b1
	loopchannel 6, Cry_30_branch_f324e
Cry_30_branch_f3256: ; f3256
Cry_32_branch_f3256: ; f3256
	sound $1, $d1, $0491
	sound $1, $b1, $0451
	loopchannel 6, Cry_30_branch_f3256
Cry_30_branch_f3262: ; f3262
Cry_32_branch_f3262: ; f3262
	sound $1, $a3, $0471
	sound $1, $81, $0441
	loopchannel 6, Cry_30_branch_f3262
Cry_30_branch_f326e: ; f326e
Cry_32_branch_f326e: ; f326e
	sound $1, $41, $0421
	sound $1, $21, $0401
	loopchannel 4, Cry_30_branch_f326e
	endchannel
; f327b

Cry_30_Ch6: ; f327b
Cry_32_Ch6: ; f327b
	unknownmusic0xde $78
	sound $8, $99, $0740
	sound $8, $79, $0746
	sound $10, $f6, $078d
	sound $8, $f8, $0791
	sound $8, $f8, $078d
	sound $8, $f8, $0787
	sound $18, $e2, $0783
	endchannel
; f329a

Cry_30_Ch8: ; f329a
	noise $10, $a6, $16
	noise $18, $98, $3d
	noise $20, $98, $5c
	noise $20, $75, $5f
	endchannel
; f32a7

Cry_31_Ch5: ; f32a7
	unknownmusic0xde $de
Cry_2F_branch_f32a9: ; f32a9
Cry_33_branch_f32a9: ; f32a9
	sound $4, $f8, $07b1
	sound $4, $f8, $07b0
	sound $4, $48, $07af
Cry_2F_branch_f32b5: ; f32b5
	sound $4, $f8, $07b2
	sound $4, $f8, $07b3
	sound $4, $48, $07b4
	endchannel
; f32c2

Cry_2F_branch_f32c2: ; f32c2
Cry_31_Ch6: ; f32c2
Cry_33_Ch6: ; f32c2
	unknownmusic0xde $f2
	sound $4, $f8, $07b2
	sound $4, $f8, $07b1
	sound $4, $28, $07b0
Cry_2F_branch_f32d0: ; f32d0
	sound $4, $f8, $07b4
	sound $4, $f8, $07b6
	sound $4, $48, $07b8
	endchannel
; f32dd

Cry_2F_branch_f32dd: ; f32dd
Cry_31_Ch8: ; f32dd
Cry_33_Ch8: ; f32dd
	noise $4, $88, $5
	noise $4, $88, $4
	noise $4, $38, $3
Cry_2F_branch_f32e6: ; f32e6
	noise $4, $88, $5
	noise $4, $88, $4
	noise $4, $87, $4
	endchannel
; f32f0

Cry_32_Ch8: ; f32f0
	noise $8, $a6, $3a
	noise $8, $a1, $5a
	endchannel
; f32f7

Cry_33_Ch5: ; f32f7
	dutycycle $0
	jumpchannel Cry_33_branch_f32a9
; f32fc

Cry_2F_Ch5: ; f32fc
	dutycycle $0
	callchannel Cry_2F_branch_f32a9
	callchannel Cry_2F_branch_f32b5
	endchannel
; f3305

Cry_2F_Ch6: ; f3305
	callchannel Cry_2F_branch_f32c2
	callchannel Cry_2F_branch_f32d0
	endchannel
; f330c

Cry_2F_Ch8: ; f330c
	callchannel Cry_2F_branch_f32dd
	callchannel Cry_2F_branch_f32e6
	endchannel
; f3313

Cry_34_Ch5: ; f3313
	unknownmusic0xde $de
Cry_34_branch_f3315: ; f3315
	sound $1, $c1, $0520
	sound $1, $a1, $0420
	loopchannel 4, Cry_34_branch_f3315
	dutycycle $0
	sound $4, $78, $0760
	sound $4, $78, $0730
	sound $18, $c2, $0420
	endchannel
; f3330

Cry_34_Ch6: ; f3330
	unknownmusic0xde $32
	sound $8, $f8, $0700
	sound $7, $f8, $0720
	sound $4, $f8, $0790
	sound $4, $f8, $0760
	sound $18, $f2, $0730
	endchannel
; f3347

Cry_34_Ch8: ; f3347
	noise $4, $88, $6d
	noise $4, $d8, $68
	noise $7, $c8, $69
	noise $4, $98, $3a
	noise $4, $98, $3c
	noise $18, $d2, $5b
	endchannel
; f335a

Cry_28_Ch5: ; f335a
	unknownmusic0xde $32
	sound $8, $f8, $0330
	sound $8, $f8, $0340
	sound $8, $c8, $07b2
	sound $8, $b8, $07b3
	sound $20, $b2, $07b4
	endchannel
; f3371

Cry_28_Ch6: ; f3371
	unknownmusic0xde $12
	sound $8, $e8, $0320
	sound $8, $e8, $0328
	sound $8, $98, $0780
	sound $8, $88, $0782
	sound $20, $72, $0784
	endchannel
; f3388

Cry_28_Ch8: ; f3388
	noise $2, $be, $49
	noise $5, $be, $3a
	noise $2, $be, $29
	noise $28, $d3, $6e
	endchannel
; f3395

Cry_2A_Ch5: ; f3395
	unknownmusic0xde $39
	soundinput $ff
	sound $2, $f8, $0720
	sound $2, $f8, $0727
	sound $2, $f8, $0780
	soundinput $88
	sound $2, $f8, $0779
	sound $4, $f8, $0740
	sound $4, $f8, $073c
	soundinput $ff
	sound $8, $f1, $0737
	soundinput $88
	endchannel
; f33bc

Cry_2A_Ch6: ; f33bc
	unknownmusic0xde $22
	sound $6, $b2, $071e
	sound $5, $92, $0779
	sound $4, $82, $073e
	sound $8, $a1, $0735
	endchannel
; f33cf

Cry_2A_Ch8: ; f33cf
	noise $2, $64, $7f
	noise $2, $84, $7d
	noise $2, $a4, $6f
	noise $2, $64, $6c
	noise $2, $94, $6f
	noise $2, $61, $6b
	endchannel
; f33e2

Cry_37_Ch5: ; f33e2
	unknownmusic0xde $d2
	sound $3, $f8, $06b0
	sound $1, $f8, $06a5
	sound $1, $f8, $069d
	sound $7, $f1, $068a
	sound $3, $f8, $0736
	sound $3, $f8, $0720
	sound $14, $f2, $070e
	endchannel
; f3401

Cry_37_Ch6: ; f3401
	unknownmusic0xde $27
Cry_37_branch_f3403: ; f3403
	sound $1, $f1, $07b4
	loopchannel 8, Cry_37_branch_f3403
Cry_37_branch_f340b: ; f340b
	sound $1, $c1, $0790
	loopchannel 3, Cry_37_branch_f340b
Cry_37_branch_f3413: ; f3413
	sound $1, $b1, $078d
	loopchannel 2, Cry_37_branch_f3413
	sound $10, $92, $0795
	endchannel
; f3420

Cry_37_Ch8: ; f3420
Cry_37_branch_f3420: ; f3420
	noise $0, $f1, $28
	loopchannel 4, Cry_37_branch_f3420
	noise $0, $91, $49
	noise $1, $a8, $4a
	noise $0, $e1, $4b
	noise $5, $d2, $4f
	noise $3, $c2, $4e
	noise $3, $b2, $4d
	noise $14, $a3, $4c
	endchannel
; f343d


INCBIN "baserom.gbc", $f343d, $f3497 - $f343d


Cry_00: ; f3497
	dbw $84, Cry_00_Ch5
	dbw $05, Cry_00_Ch6
	dbw $07, Cry_00_Ch8
; f34a0

Cry_01: ; f34a0
	dbw $84, Cry_01_Ch5
	dbw $05, Cry_01_Ch6
	dbw $07, Cry_01_Ch8
; f34a9

Cry_02: ; f34a9
	dbw $84, Cry_02_Ch5
	dbw $05, Cry_02_Ch6
	dbw $07, Cry_02_Ch8
; f34b2

Cry_03: ; f34b2
	dbw $84, Cry_03_Ch5
	dbw $05, Cry_03_Ch6
	dbw $07, Cry_03_Ch8
; f34bb

Cry_04: ; f34bb
	dbw $84, Cry_04_Ch5
	dbw $05, Cry_04_Ch6
	dbw $07, Cry_04_Ch8
; f34c4

Cry_05: ; f34c4
	dbw $84, Cry_05_Ch5
	dbw $05, Cry_05_Ch6
	dbw $07, Cry_05_Ch8
; f34cd

Cry_06: ; f34cd
	dbw $84, Cry_06_Ch5
	dbw $05, Cry_06_Ch6
	dbw $07, Cry_06_Ch8
; f34d6

Cry_07: ; f34d6
	dbw $84, Cry_07_Ch5
	dbw $05, Cry_07_Ch6
	dbw $07, Cry_07_Ch8
; f34df

Cry_08: ; f34df
	dbw $84, Cry_08_Ch5
	dbw $05, Cry_08_Ch6
	dbw $07, Cry_08_Ch8
; f34e8

Cry_09: ; f34e8
	dbw $84, Cry_09_Ch5
	dbw $05, Cry_09_Ch6
	dbw $07, Cry_09_Ch8
; f34f1

Cry_0A: ; f34f1
	dbw $84, Cry_0A_Ch5
	dbw $05, Cry_0A_Ch6
	dbw $07, Cry_0A_Ch8
; f34fa

Cry_0B: ; f34fa
	dbw $84, Cry_0B_Ch5
	dbw $05, Cry_0B_Ch6
	dbw $07, Cry_0B_Ch8
; f3503

Cry_0C: ; f3503
	dbw $84, Cry_0C_Ch5
	dbw $05, Cry_0C_Ch6
	dbw $07, Cry_0C_Ch8
; f350c

Cry_0D: ; f350c
	dbw $84, Cry_0D_Ch5
	dbw $05, Cry_0D_Ch6
	dbw $07, Cry_0D_Ch8
; f3515

Cry_0E: ; f3515
	dbw $84, Cry_0E_Ch5
	dbw $05, Cry_0E_Ch6
	dbw $07, Cry_0E_Ch8
; f351e

Cry_0F: ; f351e
	dbw $84, Cry_0F_Ch5
	dbw $05, Cry_0F_Ch6
	dbw $07, Cry_0F_Ch8
; f3527

Cry_10: ; f3527
	dbw $84, Cry_10_Ch5
	dbw $05, Cry_10_Ch6
	dbw $07, Cry_10_Ch8
; f3530

Cry_11: ; f3530
	dbw $84, Cry_11_Ch5
	dbw $05, Cry_11_Ch6
	dbw $07, Cry_11_Ch8
; f3539

Cry_12: ; f3539
	dbw $84, Cry_12_Ch5
	dbw $05, Cry_12_Ch6
	dbw $07, Cry_12_Ch8
; f3542

Cry_13: ; f3542
	dbw $84, Cry_13_Ch5
	dbw $05, Cry_13_Ch6
	dbw $07, Cry_13_Ch8
; f354b

Cry_14: ; f354b
	dbw $84, Cry_14_Ch5
	dbw $05, Cry_14_Ch6
	dbw $07, Cry_14_Ch8
; f3554

Cry_15: ; f3554
	dbw $84, Cry_15_Ch5
	dbw $05, Cry_15_Ch6
	dbw $07, Cry_15_Ch8
; f355d

Cry_16: ; f355d
	dbw $84, Cry_16_Ch5
	dbw $05, Cry_16_Ch6
	dbw $07, Cry_16_Ch8
; f3566

Cry_17: ; f3566
	dbw $84, Cry_17_Ch5
	dbw $05, Cry_17_Ch6
	dbw $07, Cry_17_Ch8
; f356f

Cry_18: ; f356f
	dbw $84, Cry_18_Ch5
	dbw $05, Cry_18_Ch6
	dbw $07, Cry_18_Ch8
; f3578

Cry_19: ; f3578
	dbw $84, Cry_19_Ch5
	dbw $05, Cry_19_Ch6
	dbw $07, Cry_19_Ch8
; f3581

Cry_1A: ; f3581
	dbw $84, Cry_1A_Ch5
	dbw $05, Cry_1A_Ch6
	dbw $07, Cry_1A_Ch8
; f358a

Cry_1B: ; f358a
	dbw $84, Cry_1B_Ch5
	dbw $05, Cry_1B_Ch6
	dbw $07, Cry_1B_Ch8
; f3593


INCBIN "baserom.gbc", $f3593, $f35d3 - $f3593


Unknown_Cry_Ch5: ; f35d3
	octave 8
	sound $2c, $6, $4ce6
	sound $c, $7d, $0f4c
	octave 5
	sound $4c, $ff, $f0de
	sound $f, $f7, $07a0
	sound $6, $e6, $07a3
	sound $a, $f4, $07a0
	unknownmusic0xde $a5
Unknown_Cry_Ch6: ; f35ee
	sound $a5, $a, $d8f6
	sound $a, $f6, $07d8
	sound $7, $4, $d7e3
	sound $4, $e3, $07d7
	sound $7, $f, $d8f2
	sound $f, $f2, $07d8
	sound $7, $ff, $05de
	endchannel
; f35fc


INCBIN "baserom.gbc", $f35fc, $f35fe - $f35fc


	sound $2, $8, $0000
	sound $f, $a7, $06a1
	sound $6, $86, $06a2
Unknown_Cry_Ch8: ; f3609
	noise $6, $a, $74
	sound $a, $74, $06a1
	noise $a1, $6, $de
	unknownmusic0xde $5f
	noise $5f, $a, $76
	sound $a, $76, $06d6
	octave 2
	noise $6, $4, $83
	sound $4, $83, $06d9
	forceoctave $6
	noise $f, $a2, $d7
	sound $f, $a2, $06d7
	noise $6, $ff, $2
	endchannel
; f361d


INCBIN "baserom.gbc", $f361d, $f361e - $f361d


	music0xf2
	noise $3c, $8, $e4
	noise $3e, $f, $d7
	noise $3c, $6, $c5
	noise $3b, $6, $e4
	noise $3d, $8, $b6
	noise $3c, $6, $d4
	noise $3d, $8, $c1
	noise $3b, $ff, $de
Cry_19_Ch5: ; f3636
	unknownmusic0xde $f0
	sfxtogglenoise $f
	sound $f, $f7, $07c0
	music0xf7
	noise $c0, $7, $6
	sound $6, $e4, $07c1
	panning $c1
	noise $7, $a, $f6
	sound $a, $f6, $07c0
	noise $c0, $7, $4
	sound $4, $d3, $07c2
	octave 5
	noise $c2, $7, $8
	sound $8, $c1, $07c0
	noise $c1, $c0, $7
	endchannel
; f364d

Cry_19_Ch6: ; f364d
	unknownmusic0xde $5f
	sound $f, $97, $0781
	sound $6, $84, $0780
	sound $a, $96, $0781
	sound $f, $83, $0781
	endchannel
; f3660

Cry_19_Ch8: ; f3660
	noise $3, $f2, $3c
	noise $d, $e6, $2c
	noise $f, $d7, $3c
	noise $8, $c1, $2c
	endchannel
; f366d

Cry_1A_Ch5: ; f366d
	unknownmusic0xde $f0
	sound $f, $f7, $0680
	sound $a, $e6, $0684
	sound $f, $d7, $0690
	sound $8, $d5, $0690
	sound $6, $c4, $0688
	sound $5, $d3, $0670
	sound $4, $d3, $0660
	sound $8, $c1, $0640
	endchannel
; f3690

Cry_1A_Ch6: ; f3690
	unknownmusic0xde $5
	sound $f, $b7, $0641
	sound $a, $96, $0642
	sound $f, $a7, $0651
	sound $8, $a5, $0651
	sound $6, $94, $0647
	sound $5, $a3, $0631
	sound $4, $93, $0622
	sound $8, $71, $0601
	endchannel
; f36b3

Cry_1A_Ch8: ; f36b3
	noise $f, $e4, $3c
	noise $a, $c7, $4c
	noise $a, $c7, $3c
	noise $c, $b7, $4c
	noise $f, $a2, $5c
	endchannel
; f36c3

Cry_07_Ch5: ; f36c3
	unknownmusic0xde $f0
	sound $6, $f7, $07a0
	sound $8, $e6, $07a4
	sound $4, $d6, $07a0
	sound $f, $d3, $0720
	sound $8, $c3, $0723
	sound $2, $c2, $0728
	sound $8, $b1, $0730
	endchannel
; f36e2

Cry_07_Ch6: ; f36e2
	unknownmusic0xde $a
	sound $4, $8, $0000
	sound $6, $a7, $0741
	sound $8, $86, $0743
	sound $4, $76, $0741
	sound $d, $83, $06c2
	sound $7, $73, $06c1
	sound $3, $82, $06cc
	sound $8, $71, $06d8
	endchannel
; f3705

Cry_07_Ch8: ; f3705
	noise $2, $f2, $4c
	noise $6, $e6, $3a
	noise $4, $d7, $3a
	noise $6, $d6, $2c
	noise $8, $e5, $3c
	noise $c, $d2, $3d
	noise $8, $d1, $2c
	endchannel
; f371b

Cry_1B_Ch5: ; f371b
	unknownmusic0xde $a5
	sound $6, $f4, $0740
	sound $f, $e3, $0730
	sound $4, $f4, $0740
	sound $5, $b3, $0748
	sound $8, $d1, $0750
	endchannel
; f3732

Cry_1B_Ch6: ; f3732
	unknownmusic0xde $77
	sound $6, $c3, $0712
	sound $f, $b3, $0704
	sound $3, $c3, $0712
	sound $4, $c3, $0721
	sound $8, $b1, $0732
	endchannel
; f3749

Cry_1B_Ch8: ; f3749
	noise $8, $d6, $2c
	noise $c, $c6, $3c
	noise $a, $b6, $2c
	noise $8, $91, $1c
	endchannel
; f3756


INCBIN "baserom.gbc", $f3756, $f37a1 - $f3756


Cry_05_Ch5: ; f37a1
	unknownmusic0xde $f1
	sound $4, $f7, $07c0
	sound $c, $e6, $07c2
	sound $6, $b5, $0680
	sound $4, $c4, $0670
	sound $4, $b5, $0660
	sound $8, $c1, $0640
	endchannel
; f37bc

Cry_05_Ch6: ; f37bc
	unknownmusic0xde $cc
	sound $3, $c7, $0781
	sound $c, $b6, $0780
	sound $6, $a5, $0641
	sound $4, $c4, $0632
	sound $6, $b5, $0621
	sound $8, $a1, $0602
	endchannel
; f37d7

Cry_05_Ch8: ; f37d7
	noise $3, $e4, $3c
	noise $c, $d6, $2c
	noise $4, $e4, $3c
	noise $8, $b7, $5c
	noise $f, $c2, $5d
	endchannel
; f37e7

Cry_06_Ch5: ; f37e7
	unknownmusic0xde $c9
	sound $8, $f7, $0680
	sound $2, $f7, $0660
	sound $1, $e7, $0640
	sound $1, $e7, $0620
	sound $f, $d1, $0600
	sound $4, $c7, $0740
	sound $4, $a7, $0730
	sound $f, $91, $0720
	endchannel
; f380a

Cry_06_Ch6: ; f380a
	unknownmusic0xde $79
	sound $a, $e7, $0682
	sound $2, $e7, $0662
	sound $1, $d7, $0642
	sound $1, $d7, $0622
	sound $f, $c1, $0602
	sound $4, $b7, $0742
	sound $2, $97, $0732
	sound $f, $81, $0722
	endchannel
; f382d

Cry_06_Ch8: ; f382d
	noise $4, $74, $21
	noise $4, $74, $10
	noise $4, $71, $20
	endchannel
; f3837


INCBIN "baserom.gbc", $f3837, $f385f - $f3837


Cry_04_Ch5: ; f385f
	unknownmusic0xde $a5
	sound $4, $e1, $0700
	sound $4, $f2, $0780
	sound $2, $92, $0740
	sound $8, $e1, $0600
	endchannel
; f3872

Cry_04_Ch6: ; f3872
	unknownmusic0xde $a
	sound $4, $b1, $06e1
	sound $3, $c2, $06e1
	sound $3, $62, $0681
	sound $8, $b1, $05e1
	endchannel
; f3885

Cry_04_Ch8: ; f3885
	noise $2, $61, $32
	noise $2, $61, $21
	noise $8, $61, $11
	endchannel
; f388f


INCBIN "baserom.gbc", $f388f, $f390b - $f388f


Cry_01_Ch5: ; f390b
	unknownmusic0xde $cc
	sound $4, $f1, $0700
	sound $4, $e1, $0780
	sound $4, $d1, $0740
	sound $4, $e1, $0740
	sound $4, $f1, $0780
	sound $4, $d1, $0700
	sound $4, $f1, $0701
	sound $4, $d1, $0782
	sound $4, $c1, $0742
	sound $8, $b1, $0741
	endchannel
; f3936

Cry_01_Ch6: ; f3936
	unknownmusic0xde $44
	sound $c, $8, $0000
	sound $4, $f1, $0701
	sound $4, $e1, $0782
	sound $4, $d1, $0741
	sound $4, $e1, $0741
	sound $4, $f1, $0782
	sound $8, $d1, $0701
	endchannel
; f3955

Cry_01_Ch8: ; f3955
	noise $f, $8, $0
	noise $4, $8, $0
	noise $4, $d1, $4c
	noise $4, $b1, $2c
	noise $4, $d1, $3c
	noise $4, $b1, $3c
	noise $4, $c1, $2c
	noise $8, $a1, $4c
	endchannel
; f396e

Cry_02_Ch5: ; f396e
	unknownmusic0xde $cc
	sound $8, $f5, $0600
	sound $2, $d2, $0638
	sound $2, $c2, $0630
	sound $2, $c2, $0628
	sound $2, $b2, $0620
	sound $2, $b2, $0610
	sound $2, $a2, $0618
	sound $2, $b2, $0610
	sound $8, $c1, $0620
	endchannel
; f3995

Cry_02_Ch6: ; f3995
	unknownmusic0xde $44
	sound $c, $c3, $05c0
	sound $3, $b1, $05f9
	sound $2, $a1, $05f1
	sound $2, $a1, $05e9
	sound $2, $91, $05e1
	sound $2, $91, $05d9
	sound $2, $81, $05d1
	sound $2, $91, $05d9
	sound $8, $91, $05e1
Cry_02_Ch8: ; f39bb
	endchannel
; f39bc


INCBIN "baserom.gbc", $f39bc, $f39da - $f39bc


Cry_03_Ch5: ; f39da
Cry_03_branch_f39da: ; f39da
	unknownmusic0xde $88
	sound $5, $f2, $0650
	sound $9, $d1, $0660
	sound $5, $e2, $0612
	sound $9, $c1, $0622
	sound $5, $f2, $0610
	sound $6, $d1, $0620
	loopchannel 2, Cry_03_branch_f39da
	endchannel
; f39f9

Cry_03_Ch6: ; f39f9
	unknownmusic0xde $40
	sound $4, $8, $0000
	sound $5, $f2, $0651
	sound $9, $d1, $0661
	sound $5, $e2, $0614
	sound $8, $c1, $0624
	sound $5, $f2, $0611
	sound $c, $d1, $0621
	sound $5, $e2, $0614
	sound $8, $c1, $0624
	sound $5, $f2, $0611
	sound $4, $d1, $0621
	endchannel
; f3a28

Cry_03_Ch8: ; f3a28
	noise $6, $d2, $1c
	noise $9, $b1, $2c
	noise $8, $c2, $2c
	noise $9, $b1, $3c
	noise $6, $c2, $2c
	noise $9, $a2, $3c
	noise $7, $c2, $2c
	noise $5, $a1, $3c
	noise $9, $c2, $2c
	noise $4, $a1, $3c
	endchannel
; f3a47


INCBIN "baserom.gbc", $f3a47, $f3a7a - $f3a47


Cry_00_Ch5: ; f3a7a
	unknownmusic0xde $f0
	sound $8, $f7, $06e0
	sound $6, $e6, $06e5
	sound $3, $f4, $06e0
	sound $3, $f6, $06d0
	sound $3, $e3, $06c0
	sound $4, $f2, $06b0
	sound $f, $a2, $06c8
	endchannel
; f3a99

Cry_00_Ch6: ; f3a99
	unknownmusic0xde $5
	sound $3, $8, $0000
	sound $8, $a7, $06a1
	sound $6, $86, $06a3
	sound $3, $74, $06a1
	sound $3, $76, $0691
	sound $3, $83, $0682
	sound $4, $a2, $0671
	sound $f, $72, $0689
	endchannel
; f3abc

Cry_00_Ch8: ; f3abc
	noise $2, $f2, $3c
	noise $8, $e4, $3e
	noise $8, $d7, $3c
	noise $5, $c5, $3b
	noise $3, $d4, $2c
	noise $2, $b6, $3c
	noise $3, $a4, $2c
	noise $8, $91, $3c
	endchannel
; f3ad5


INCBIN "baserom.gbc", $f3ad5, $f3b56 - $f3ad5


Cry_0F_Ch5: ; f3b56
	unknownmusic0xde $1b
	sound $7, $d2, $0740
	sound $f, $e5, $0760
	sound $18, $c1, $0730
	endchannel
; f3b65

Cry_0F_Ch6: ; f3b65
	unknownmusic0xde $81
	sound $2, $c2, $0701
	sound $4, $c2, $0708
	sound $f, $d7, $0741
	sound $18, $a2, $0701
Cry_0F_Ch8: ; f3b77
	endchannel
; f3b78

Cry_0C_Ch5: ; f3b78
	unknownmusic0xde $f0
	sound $f, $d7, $0780
	sound $4, $e6, $07a0
	sound $f, $d2, $0740
	endchannel
; f3b87

Cry_0C_Ch6: ; f3b87
	unknownmusic0xde $5a
	sound $f, $c7, $0753
	sound $5, $b6, $0772
	sound $f, $c2, $0711
	endchannel
; f3b96

Cry_0C_Ch8: ; f3b96
	noise $d, $f6, $4c
	noise $4, $e6, $3c
	noise $f, $f2, $4c
	endchannel
; f3ba0

Cry_11_Ch5: ; f3ba0
	unknownmusic0xde $f0
	sound $6, $f7, $06c0
	sound $f, $e7, $0700
	sound $4, $f4, $06f0
	sound $4, $e4, $06e0
	sound $8, $d1, $06d0
	endchannel
; f3bb7

Cry_11_Ch6: ; f3bb7
	unknownmusic0xde $a
	sound $7, $e6, $0681
	sound $e, $d5, $06c1
	sound $4, $c4, $06b1
	sound $4, $d4, $06a1
	sound $8, $c1, $0691
	endchannel
; f3bce

Cry_11_Ch8: ; f3bce
	noise $a, $a6, $3c
	noise $e, $94, $2c
	noise $5, $a3, $3c
	noise $8, $91, $2c
	endchannel
; f3bdb

Cry_08_Ch5: ; f3bdb
	unknownmusic0xde $a5
	sound $c, $f2, $0440
	sound $f, $e3, $04a0
	sound $4, $d2, $0490
	sound $8, $d1, $0480
	endchannel
; f3bee

Cry_08_Ch6: ; f3bee
	unknownmusic0xde $ee
	sound $b, $d2, $0438
	sound $e, $c6, $0498
	sound $3, $b2, $0488
	sound $8, $b1, $0478
	endchannel
; f3c01

Cry_08_Ch8: ; f3c01
	noise $a, $e6, $6c
	noise $f, $d2, $5c
	noise $3, $c2, $6c
	noise $8, $d1, $5c
	endchannel
; f3c0e

Cry_09_Ch5: ; f3c0e
	unknownmusic0xde $33
	sound $f, $f6, $05c0
	sound $8, $e3, $05bc
	sound $6, $d2, $05d0
	sound $6, $b2, $05e0
	sound $6, $c2, $05f0
	sound $8, $b1, $0600
	endchannel
; f3c29

Cry_09_Ch6: ; f3c29
	unknownmusic0xde $99
	sound $e, $c6, $04b1
	sound $7, $c3, $04ad
	sound $5, $b2, $04c1
	sound $8, $92, $04d1
	sound $6, $a2, $04e1
	sound $8, $91, $04f1
	endchannel
; f3c44

Cry_09_Ch8: ; f3c44
	noise $a, $e6, $5c
	noise $a, $d6, $6c
	noise $4, $c2, $4c
	noise $6, $d3, $5c
	noise $8, $b3, $4c
	noise $8, $a1, $5c
	endchannel
; f3c57

Cry_0A_Ch5: ; f3c57
	unknownmusic0xde $f0
	sound $8, $e4, $0790
	sound $f, $f5, $07c0
	sound $8, $d1, $07d8
	endchannel
; f3c66

Cry_0A_Ch6: ; f3c66
	unknownmusic0xde $a5
	sound $a, $c4, $0771
	sound $f, $b6, $07a2
	sound $8, $a1, $07b7
	endchannel
; f3c75

Cry_0A_Ch8: ; f3c75
	noise $8, $e4, $4c
	noise $e, $c4, $3c
	noise $8, $d1, $2c
	endchannel
; f3c7f

Cry_14_Ch5: ; f3c7f
	unknownmusic0xde $f0
	sound $6, $f2, $0600
	sound $6, $e2, $0640
	sound $6, $d2, $0680
	sound $6, $e2, $06c0
	sound $6, $d2, $0700
	sound $6, $c2, $0740
	sound $6, $b2, $0780
	sound $8, $a1, $07c0
	endchannel
; f3ca2

Cry_14_Ch6: ; f3ca2
	unknownmusic0xde $11
	sound $3, $8, $0001
	sound $6, $c2, $05c1
	sound $6, $b2, $0602
	sound $6, $a2, $0641
	sound $6, $b2, $0682
	sound $6, $a2, $06c2
	sound $6, $92, $0701
	sound $6, $a2, $0742
	sound $8, $81, $0781
	endchannel
; f3cc9

Cry_14_Ch8: ; f3cc9
	noise $6, $8, $1
	noise $5, $e2, $5c
	noise $5, $c2, $4c
	noise $5, $d2, $3c
	noise $5, $b2, $2c
	noise $5, $c2, $1c
	noise $5, $a2, $1b
	noise $5, $92, $1a
	noise $8, $81, $18
	endchannel
; f3ce5

Cry_0B_Ch5: ; f3ce5
	unknownmusic0xde $f0
	sound $4, $f3, $0780
	sound $f, $e7, $0700
	sound $8, $d3, $0710
	sound $4, $c2, $0700
	sound $4, $d2, $06f0
	sound $8, $c1, $06e0
	endchannel
; f3d00

Cry_0B_Ch6: ; f3d00
	unknownmusic0xde $5a
	sound $6, $c3, $0701
	sound $e, $b7, $0681
	sound $7, $b3, $0692
	sound $3, $a2, $0681
	sound $4, $b2, $0672
	sound $8, $a1, $0661
	endchannel
; f3d1b

Cry_0B_Ch8: ; f3d1b
	noise $6, $e3, $5c
	noise $e, $d6, $4c
	noise $6, $c6, $3c
	noise $3, $b3, $4c
	noise $3, $a2, $5c
	noise $8, $b1, $6c
	endchannel
; f3d2e

Cry_0D_Ch5: ; f3d2e
	unknownmusic0xde $f
	sound $f, $f7, $0500
	sound $f, $e7, $0508
	sound $8, $b4, $0480
	sound $f, $a2, $0460
	endchannel
; f3d41

Cry_0D_Ch6: ; f3d41
	unknownmusic0xde $44
	sound $e, $d7, $0481
	sound $e, $c7, $0489
	sound $a, $b4, $0401
	sound $f, $c2, $03e1
	endchannel
; f3d54

Cry_0D_Ch8: ; f3d54
	noise $e, $f7, $7c
	noise $c, $f6, $6c
	noise $9, $e4, $7c
	noise $f, $e2, $6c
	endchannel
; f3d61

Cry_12_Ch5: ; f3d61
	unknownmusic0xde $f5
	sound $7, $d6, $07e1
	sound $6, $c6, $07e2
	sound $9, $d6, $07e1
	sound $7, $c6, $07e0
	sound $5, $b6, $07e2
	sound $7, $c6, $07e1
	sound $6, $b6, $07e0
	sound $8, $a1, $07df
	endchannel
; f3d84

Cry_12_Ch6: ; f3d84
	unknownmusic0xde $44
	sound $6, $c3, $07c9
	sound $6, $b3, $07c7
	sound $a, $c4, $07c3
	sound $8, $b4, $07c7
	sound $6, $c3, $07c9
	sound $f, $a2, $07c5
	endchannel
; f3d9f

Cry_12_Ch8: ; f3d9f
	noise $d, $19, $7c
	noise $d, $f7, $8c
	noise $c, $d6, $7c
	noise $8, $c4, $6c
	noise $f, $b3, $5c
	endchannel
; f3daf

Cry_10_Ch5: ; f3daf
	unknownmusic0xde $f0
	sound $6, $f7, $0740
	sound $c, $e6, $0744
	sound $6, $d5, $0750
	sound $4, $c3, $0760
	sound $3, $c3, $0780
	sound $8, $d1, $07a0
	endchannel
; f3dca

Cry_10_Ch6: ; f3dca
	unknownmusic0xde $a
	sound $6, $c7, $0701
	sound $b, $b6, $0702
	sound $6, $a5, $0711
	sound $4, $93, $0721
	sound $3, $a3, $0741
	sound $8, $91, $0762
	endchannel
; f3de5

Cry_10_Ch8: ; f3de5
	noise $3, $e2, $3c
	noise $8, $d6, $4c
	noise $5, $d4, $3c
	noise $c, $c7, $4c
	noise $2, $e2, $3c
	noise $8, $d1, $2c
	endchannel
; f3df8

Cry_13_Ch5: ; f3df8
	unknownmusic0xde $f4
	sound $f, $f0, $0705
	sound $a, $e0, $0700
	sound $6, $b4, $0710
	sound $4, $d3, $0700
	sound $6, $b2, $0620
	sound $8, $a1, $0624
	endchannel
; f3e13

Cry_13_Ch6: ; f3e13
	unknownmusic0xde $22
	sound $f, $b0, $06c3
	sound $a, $a0, $06c1
	sound $6, $84, $06d2
	sound $4, $93, $06c1
	sound $6, $82, $05e1
	sound $8, $61, $05e8
	endchannel
; f3e2e

Cry_13_Ch8: ; f3e2e
	noise $6, $e6, $4c
	noise $f, $d6, $3c
	noise $a, $c5, $4a
	noise $1, $b2, $5b
	noise $f, $c2, $4c
	endchannel
; f3e3e

Cry_0E_Ch5: ; f3e3e
	unknownmusic0xde $50
	sound $a, $f5, $0680
	sound $3, $e2, $06a0
	sound $3, $f2, $06c0
	sound $3, $e2, $06e0
	sound $3, $d2, $0700
	sound $3, $c2, $06e0
	sound $3, $d2, $06c0
	sound $8, $c1, $06a0
	endchannel
; f3e61

Cry_0E_Ch6: ; f3e61
	unknownmusic0xde $f
	sound $9, $d5, $0631
	sound $3, $d2, $0652
	sound $3, $e2, $0671
	sound $3, $b2, $0691
	sound $3, $c2, $06b2
	sound $3, $b2, $0691
	sound $3, $c2, $0671
	sound $8, $b1, $0651
	endchannel
; f3e84

Cry_0E_Ch8: ; f3e84
	noise $6, $e3, $4c
	noise $4, $c3, $3c
	noise $5, $d4, $3c
	noise $4, $c4, $2c
	noise $6, $b4, $3c
	noise $8, $c1, $2c
	endchannel
; f3e97

Cry_15_Ch5: ; f3e97
	unknownmusic0xde $a5
	sound $3, $f4, $0641
	sound $d, $d6, $0721
	sound $8, $f4, $0719
	sound $8, $c1, $071a
	endchannel
; f3eaa

Cry_15_Ch6: ; f3eaa
	unknownmusic0xde $cc
	sound $4, $f4, $0580
	sound $e, $e6, $06e0
	sound $8, $d5, $06d8
	sound $8, $d1, $06dc
	endchannel
; f3ebd

Cry_15_Ch8: ; f3ebd
	noise $5, $c4, $46
	noise $d, $a5, $44
	noise $8, $c4, $45
	noise $8, $b1, $44
	endchannel
; f3eca

Cry_16_Ch5: ; f3eca
	unknownmusic0xde $f0
	sound $d, $f1, $0511
	sound $d, $e1, $0515
	sound $d, $e1, $0511
	sound $8, $d1, $0511
	endchannel
; f3edd

Cry_16_Ch6: ; f3edd
	unknownmusic0xde $15
	sound $c, $e1, $050c
	sound $c, $d1, $0510
	sound $e, $c1, $050c
	sound $8, $c1, $050a
	endchannel
; f3ef0

Cry_16_Ch8: ; f3ef0
	noise $e, $f2, $65
	noise $d, $e2, $55
	noise $e, $d2, $56
	noise $8, $d1, $66
	endchannel
; f3efd

Cry_17_Ch5: ; f3efd
	unknownmusic0xde $1b
	sound $3, $f3, $0564
	sound $2, $e2, $0544
	sound $5, $d1, $0522
	sound $2, $b2, $0484
	sound $8, $d1, $04a2
	sound $3, $f3, $0524
	sound $4, $e4, $04e4
	sound $8, $d1, $0502
	endchannel
; f3f20

Cry_17_Ch6: ; f3f20
	unknownmusic0xde $cc
	sound $3, $d3, $0560
	sound $2, $c2, $0540
	sound $5, $c1, $0520
	sound $2, $92, $0480
	sound $8, $c1, $04a0
	sound $3, $d3, $0520
	sound $3, $c4, $04e0
	sound $8, $c1, $0500
Cry_17_Ch8: ; f3f42
	endchannel
; f3f43

Cry_18_Ch5: ; f3f43
	unknownmusic0xde $11
	sound $2, $3d, $0381
	sound $7, $f5, $0601
	sound $1, $c2, $0481
	sound $8, $91, $0381
	endchannel
; f3f56

Cry_18_Ch6: ; f3f56
	unknownmusic0xde $ee
	sound $2, $3e, $05b0
	sound $7, $d5, $075d
	sound $1, $b2, $06b0
	sound $8, $61, $05b0
	endchannel
; f3f69

Cry_18_Ch8: ; f3f69
	noise $2, $92, $49
	noise $7, $b5, $29
	noise $1, $a2, $39
	noise $8, $91, $49
	endchannel
; f3f76
