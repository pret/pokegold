Music_Credits: ; 1f84c
	dbw $c0, Music_Credits_Ch1
	dbw $01, Music_Credits_Ch2
	dbw $02, Music_Credits_Ch3
	dbw $03, Music_Credits_Ch4
; 1f858

Music_Credits_Ch1: ; 1f858
	tempo 139
	volume $77
	stereopanning $f
	dutycycle $3
	notetype $c, $2f
	octave 2
	note G_, 16
	notetype $6, $a7
	octave 3
	note B_, 12
	note A#, 2
	note A_, 2
	note B_, 1
	octave 4
	note C_, 7
	note D_, 8
	callchannel Music_Credits_branch_1f9b3
	note __, 4
	octave 3
	note B_, 2
	note __, 2
	note A_, 2
	note B_, 2
	note __, 2
	note A_, 2
	note B_, 2
	intensity $96
	note A_, 1
	note G_, 1
	octave 3
	note D_, 1
	note C_, 1
	octave 2
	note B_, 1
	note A_, 1
	intensity $94
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 1
	note B_, 1
	note A_, 1
	octave 3
	note __, 1
	intensity $a7
	callchannel Music_Credits_branch_1f9b3
	callchannel Music_Credits_branch_1fa1d
	intensity $97
	callchannel Music_Credits_branch_1fa28
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note B_, 2
	octave 4
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note E_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note B_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note B_, 2
	note G_, 2
	note A_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note G#, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	note F#, 2
	note E_, 2
	note C_, 2
	octave 3
	note B_, 2
	callchannel Music_Credits_branch_1fa28
	callchannel Music_Credits_branch_1fa89
	note B_, 1
	octave 4
	note C_, 7
	note D_, 8
	intensity $a7
	octave 5
	note E_, 2
	note C#, 2
	octave 4
	note A_, 2
	note E_, 2
	octave 5
	note C#, 2
	octave 4
	note A_, 2
	note E_, 2
	note C#, 2
	note C#, 1
	note D_, 7
	note E_, 7
	octave 3
	note __, 1
	forceoctave $2
	callchannel Music_Credits_branch_1f9b3
	callchannel Music_Credits_branch_1fa1d
	callchannel Music_Credits_branch_1fa28
	callchannel Music_Credits_branch_1fa89
	forceoctave $0
	octave 3
	note A_, 12
	notetype $8, $a7
	note D_, 1
	note D_, 1
	note D_, 1
	callchannel Music_Credits_branch_1fab2
	octave 3
	note B_, 6
	note A_, 6
	note A_, 6
	note G_, 6
	note A#, 6
	note A#, 6
	note A_, 6
	octave 4
	note C#, 6
	callchannel Music_Credits_branch_1fab2
	tempo 143
	octave 4
	note D_, 6
	octave 3
	note B_, 6
	note G_, 6
	octave 4
	note D_, 6
	tempo 146
	note E_, 6
	note F#, 6
	note A_, 6
	octave 5
	note C#, 6
	notetype $c, $a7
Music_Credits_branch_1f937: ; 1f937
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	loopchannel 6, Music_Credits_branch_1f937
	notetype $8, $a7
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	tempo 153
	notetype $c, $a7
	octave 3
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	octave 3
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	octave 3
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	notetype $8, $a7
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	notetype $c, $a7
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note E_, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $8, $a7
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	tempo 160
	notetype $c, $a7
	octave 2
	note G_, 1
	note __, 3
	note E_, 1
	note __, 3
	notetype $8, $a7
	octave 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 2
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $a7
	octave 2
	note D_, 1
	note __, 7
	intensity $c7
	octave 2
	note D_, 16
	intensity $b8
	intensity $b7
	note __, 16
	note __, 16
	note __, 16
	endchannel
; 1f9b3

Music_Credits_branch_1f9b3: ; 1f9b3
	note C_, 16
	note F#, 1
	note G_, 3
	note E_, 4
	note D_, 4
	note E_, 4
	note D_, 4
	octave 3
	note B_, 2
	note __, 2
	note A#, 2
	note B_, 2
	note __, 2
	note A#, 2
	note B_, 4
	note G_, 4
	note __, 4
	octave 4
	note D_, 4
	note __, 4
	note E_, 4
	octave 3
	note A#, 4
	note G_, 4
	note E_, 4
	note G_, 4
	octave 4
	note G_, 4
	note C_, 4
	note D_, 4
	note C_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note C_, 4
	octave 3
	note A_, 4
	note __, 4
	octave 4
	note C_, 4
	octave 3
	note G#, 8
	note F_, 4
	note C_, 7
	note G#, 1
	note A_, 1
	note A#, 7
	note G#, 4
	note __, 4
	octave 4
	note C_, 4
	octave 3
	note G_, 4
	note E_, 4
	note C_, 4
	note E_, 4
	note G_, 4
	octave 4
	note C_, 4
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	endchannel
; 1fa1d

Music_Credits_branch_1fa1d: ; 1fa1d
	octave 4
	note C_, 4
	octave 3
	note D_, 4
	note G_, 4
	note B_, 8
	octave 4
	note D_, 4
	note C_, 4
	note D#, 4
	endchannel
; 1fa28

Music_Credits_branch_1fa28: ; 1fa28
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	note C_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note C_, 2
	note E_, 2
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 4
	note B_, 2
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note F_, 2
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	note B_, 2
	octave 4
	note D_, 2
	note F_, 2
	note F#, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note C_, 2
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	note G_, 4
	note A_, 2
	note B_, 2
	octave 3
	note A_, 4
	octave 4
	note C_, 4
	note E_, 4
	octave 3
	note G#, 8
	octave 4
	note C_, 8
	note E_, 4
	octave 3
	note A_, 2
	octave 4
	note F_, 2
	note C_, 2
	note F_, 2
	note D_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	octave 3
	note A_, 2
	octave 4
	note F_, 2
	note C_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	endchannel
; 1fa89

Music_Credits_branch_1fa89: ; 1fa89
	octave 3
	note A_, 2
	octave 4
	note F#, 2
	note C_, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	note E_, 2
	note F#, 2
	note C_, 2
	note F#, 2
	octave 3
	note A_, 2
	octave 4
	note F#, 2
	note C_, 2
	note F#, 2
	note C_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	octave 3
	note B_, 12
	note A#, 2
	note A_, 2
	endchannel
; 1fab2

Music_Credits_branch_1fab2: ; 1fab2
	note __, 6
	octave 3
	note D_, 6
	note E_, 6
	note F_, 6
	note F#, 6
	note A_, 6
	octave 4
	note F#, 6
	note C#, 6
	endchannel
; 1fabd

Music_Credits_Ch2: ; 1fabd
	dutycycle $1
	vibrato $14, $23
	notetype $c, $2f
	stereopanning $f0
	octave 4
	note G_, 16
	intensity $c7
	octave 5
	note G_, 8
	octave 3
	note G_, 4
	note F_, 4
	notetype $6, $c7
	callchannel Music_Credits_branch_1fbfb
	octave 1
	note G_, 2
	note __, 2
	octave 2
	note G_, 2
	note __, 2
	note F#, 2
	note G_, 2
	note __, 2
	octave 3
	note C_, 2
	octave 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	intensity $97
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	intensity $c7
	callchannel Music_Credits_branch_1fbfb
	callchannel Music_Credits_branch_1fc6f
	callchannel Music_Credits_branch_1fc78
	octave 4
	note B_, 1
	octave 5
	note C_, 11
	octave 4
	note B_, 8
	note A_, 8
	note B_, 4
	note F#, 1
	note G_, 15
	notetype $c, $c7
	octave 5
	note E_, 15
	notetype $6, $c7
	note G_, 1
	note G#, 1
	note A_, 2
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	octave 5
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	note E_, 2
	callchannel Music_Credits_branch_1fc78
	octave 4
	note B_, 1
	octave 5
	note C_, 11
	octave 4
	note B_, 8
	octave 5
	note C_, 12
	notetype $c, $c7
	note D_, 16
	note G_, 8
	octave 3
	note G_, 4
	note F_, 4
	octave 5
	note A_, 1
	note E_, 1
	note C#, 1
	octave 4
	note A_, 1
	octave 5
	note E_, 1
	note C#, 1
	octave 4
	note A_, 1
	note E_, 1
	octave 3
	note A_, 4
	note G_, 4
	notetype $6, $c7
	forceoctave $2
	callchannel Music_Credits_branch_1fbfb
	callchannel Music_Credits_branch_1fc6f
	callchannel Music_Credits_branch_1fc78
	forceoctave $0
	octave 5
	note C#, 1
	note D_, 11
	note C#, 8
	note D_, 12
	notetype $c, $c7
	note E_, 16
	note A_, 14
	notetype $8, $c7
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 6
	octave 3
	note F#, 6
	note G_, 6
	note G#, 6
	note A_, 6
	octave 4
	note C#, 6
	note A_, 6
	note G_, 6
	note G_, 6
	note F#, 6
	note F#, 6
	note E_, 6
	note E_, 6
	note D_, 6
	note C#, 6
	note E_, 6
	octave 1
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note D_, 3
	note __, 3
	note F#, 3
	note __, 3
	note F#, 3
	note __, 3
	note F#, 3
	notetype $c, $c7
	octave 2
	note F#, 1
	note __, 1
	octave 1
	note F#, 2
	octave 2
	note F#, 1
	note __, 1
Music_Credits_branch_1fb87: ; 1fb87
	octave 1
	note G_, 2
	octave 2
	note G_, 1
	note __, 1
	loopchannel 4, Music_Credits_branch_1fb87
	octave 1
	note A_, 1
	octave 2
	note A_, 1
	note E_, 1
	note A_, 1
	octave 1
	note A_, 1
	octave 2
	note A_, 1
	note E_, 1
	note A_, 1
	octave 1
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C#, 1
	octave 5
	note D_, 12
	notetype $8, $c7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $c7
	note D_, 12
	notetype $8, $c7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	note D_, 9
	notetype $c, $c7
	octave 4
	note F#, 1
	note A_, 1
	octave 5
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $8, $c7
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $c, $c7
	note C_, 1
	note __, 3
	note C_, 1
	note __, 3
	notetype $8, $c7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	notetype $c, $c7
	note D_, 1
	note __, 7
	intensity $c8
	intensity $c7
	octave 1
	note D_, 16
	intensity $c7
	note __, 16
	note __, 16
	note __, 16
	endchannel
; 1fbfb

Music_Credits_branch_1fbfb: ; 1fbfb
	octave 2
	note C_, 4
	intensity $b1
	octave 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note G_, 2
	note __, 2
	intensity $c7
	octave 2
	note C_, 1
	note __, 1
	note C_, 4
	note __, 12
	octave 1
	note B_, 4
	note __, 10
	note B_, 1
	note __, 1
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	octave 2
	note G_, 2
	octave 1
	note B_, 6
	note A#, 4
	intensity $b1
	octave 5
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 2
	note __, 2
	intensity $c7
	octave 1
	note A#, 1
	note __, 1
	note A#, 4
	note __, 12
	note A_, 4
	note __, 10
	note A_, 1
	note __, 1
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 2
	note F_, 2
	octave 1
	note A_, 6
	note G#, 4
	intensity $b1
	octave 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	octave 5
	note C_, 2
	note __, 2
	intensity $c7
	octave 1
	note G#, 1
	note __, 1
	note G#, 4
	note __, 12
	note G_, 4
	note __, 10
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 2
	note E_, 2
	octave 1
	note G_, 6
	note F#, 4
	note __, 2
	note F#, 2
	note F#, 2
	octave 2
	note D_, 2
	octave 1
	note F#, 4
	note A_, 2
	octave 2
	note D_, 2
	note F#, 2
	note A_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 3
	note C_, 2
	endchannel
; 1fc6f

Music_Credits_branch_1fc6f: ; 1fc6f
	octave 1
	note G_, 4
	note __, 4
	note G_, 2
	note __, 2
	octave 2
	note G_, 12
	note F#, 8
	endchannel
; 1fc78

Music_Credits_branch_1fc78: ; 1fc78
	octave 4
	note A_, 8
	note B_, 8
	octave 5
	note C_, 8
	note E_, 8
	notetype $c, $c7
	note D_, 16
	octave 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 5
	note D_, 4
	note C_, 10
	notetype $6, $c7
	octave 4
	note B_, 1
	octave 5
	note C_, 3
	octave 4
	note B_, 4
	octave 5
	note C_, 4
	notetype $c, $c7
	octave 4
	note A_, 10
	notetype $6, $c7
	note G#, 1
	note A_, 3
	note B_, 4
	octave 5
	note C_, 4
	endchannel
; 1fca2

Music_Credits_Ch3: ; 1fca2
	vibrato $16, $23
	notetype $c, $34
	stereopanning $ff
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	intensity $24
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	intensity $14
	octave 6
	note G_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	octave 6
	note G_, 1
	note D_, 1
	octave 5
	note B_, 1
	note G_, 1
	octave 6
	note D_, 1
	octave 5
	note B_, 1
	note G_, 1
	note D_, 1
	notetype $6, $14
	note D#, 1
	note E_, 7
	note F_, 8
	callchannel Music_Credits_branch_1fdda
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	note F#, 1
	note G_, 1
	note __, 1
	note F#, 1
	note G_, 1
	notetype $6, $14
	intensity $24
	note F_, 1
	note E_, 1
	intensity $14
	note E_, 4
	note __, 4
	note F_, 4
	callchannel Music_Credits_branch_1fdda
	callchannel Music_Credits_branch_1fe0b
	callchannel Music_Credits_branch_1fe17
	callchannel Music_Credits_branch_1fe64
	octave 2
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
	note G_, 2
	octave 3
	note G_, 2
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 4
	note B_, 2
	octave 3
	note D_, 2
	note F#, 2
	note G_, 2
	octave 2
	note E_, 4
	note __, 2
	note E_, 1
	note __, 1
	note E_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note E_, 1
	note __, 1
	note E_, 2
	octave 3
	note E_, 2
	octave 2
	note E_, 4
	note G#, 2
	note B_, 2
	octave 3
	note D#, 2
	note E_, 2
	octave 2
	note A_, 4
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note G#, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note G#, 2
	note G_, 2
	octave 3
	note E_, 2
	note __, 2
	octave 2
	note G_, 2
	note F#, 4
	octave 3
	note E_, 4
	callchannel Music_Credits_branch_1fe17
	callchannel Music_Credits_branch_1fe64
	callchannel Music_Credits_branch_1fe7b
	octave 5
	note D#, 1
	note E_, 7
	note F_, 8
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note E_, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 4
	note C#, 2
	note __, 2
	octave 5
	note F_, 1
	note F#, 7
	note G_, 8
	forceoctave $2
	callchannel Music_Credits_branch_1fdda
	callchannel Music_Credits_branch_1fe0b
	forceoctave $12
	callchannel Music_Credits_branch_1fe17
	forceoctave $2
	callchannel Music_Credits_branch_1fe64
	callchannel Music_Credits_branch_1fe7b
	forceoctave $0
	octave 6
	note C#, 2
	octave 5
	note A_, 2
	note E_, 2
	note C#, 2
	note A_, 2
	note E_, 2
	notetype $8, $14
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	notetype $c, $14
	note D_, 16
	note F#, 16
	note G_, 16
	note G_, 8
	note A_, 8
	note __, 4
	octave 4
	note F#, 4
	note G_, 4
	note G#, 4
	note A_, 4
	octave 5
	note C#, 4
	note A_, 4
	note G_, 4
	note G_, 4
	note F#, 4
	note E_, 4
	note G_, 4
	note A_, 4
	note B_, 4
	octave 6
	note C#, 4
	note E_, 4
	intensity $15
	octave 4
	note D_, 6
	note F#, 2
	note A_, 8
	note E_, 6
	note G_, 2
	octave 5
	note C_, 6
	octave 4
	note B_, 1
	note A#, 1
	note A_, 8
	intensity $14
	octave 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	notetype $8, $14
	octave 3
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	notetype $c, $14
	octave 5
	note G_, 1
	note __, 3
	note E_, 1
	note __, 3
	notetype $8, $14
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	notetype $c, $14
	note A_, 1
	note __, 16
	note __, 16
	note __, 16
	endchannel
; 1fdda

Music_Credits_branch_1fdda: ; 1fdda
	note G_, 16
	octave 6
	note C#, 1
	note D_, 3
	note C_, 4
	octave 5
	note B_, 4
	octave 6
	note C_, 4
	notetype $c, $14
	octave 5
	note G_, 10
	note E_, 2
	note __, 2
	note F_, 2
	note G_, 10
	notetype $6, $14
	note G#, 1
	note A_, 7
	note E_, 4
	note G_, 12
	note F_, 8
	note D_, 4
	note __, 4
	note E_, 4
	notetype $c, $14
	note F_, 10
	notetype $6, $14
	note F#, 1
	note G_, 7
	note F_, 4
	note E_, 4
	note D#, 4
	note E_, 4
	note B_, 12
	note A_, 8
	notetype $c, $14
	note D_, 16
	endchannel
; 1fe0b

Music_Credits_branch_1fe0b: ; 1fe0b
	notetype $6, $14
	note F#, 1
	note G_, 3
	octave 4
	note G_, 4
	octave 5
	note D_, 4
	note G_, 12
	note G#, 8
	endchannel
; 1fe17

Music_Credits_branch_1fe17: ; 1fe17
	octave 3
	note F_, 4
	note __, 2
	note F_, 2
	note __, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 4
	note G_, 4
	note __, 2
	note G_, 2
	note __, 2
	octave 4
	note D_, 2
	octave 3
	note B_, 2
	note G_, 2
	octave 4
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 4
	note E_, 4
	note __, 2
	note E_, 2
	note __, 2
	note B_, 2
	note G_, 2
	note E_, 2
	note B_, 2
	note __, 2
	note B_, 2
	note __, 2
	note G_, 2
	note B_, 2
	note E_, 4
	note A_, 4
	note __, 2
	note A_, 2
	note __, 2
	octave 4
	note E_, 2
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	note __, 2
	note G#, 2
	octave 4
	note C_, 2
	note E_, 2
	note C_, 2
	octave 3
	note G#, 2
	endchannel
; 1fe64

Music_Credits_branch_1fe64: ; 1fe64
	octave 2
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 2
	octave 3
	note F_, 2
	note __, 2
	octave 2
	note F_, 1
	note __, 1
	note F_, 2
	octave 3
	note F_, 2
	octave 2
	note F_, 4
	note A_, 2
	octave 3
	note C_, 2
	note E_, 2
	note F_, 2
	endchannel
; 1fe7b

Music_Credits_branch_1fe7b: ; 1fe7b
	octave 2
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note F#, 2
	note __, 2
	octave 2
	note F#, 1
	note __, 1
	note F#, 2
	octave 3
	note F#, 2
	octave 2
	note F#, 4
	note A_, 2
	octave 3
	note C_, 2
	note F_, 2
	note F#, 2
	note G_, 8
	octave 4
	note C_, 8
	note D_, 8
	note F_, 8
	octave 6
	note G_, 2
	note D_, 2
	octave 5
	note B_, 2
	note G_, 2
	octave 6
	note D_, 2
	octave 5
	note B_, 2
	note G_, 2
	note D_, 2
	endchannel
; 1fea3

Music_Credits_Ch4: ; 1fea3
	togglenoise $3
	notetype $c
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note B_, 2
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note A#, 4
	note A#, 4
	callchannel Music_Credits_branch_1ff7d
	callchannel Music_Credits_branch_1ff7d
	callchannel Music_Credits_branch_1ff7d
	callchannel Music_Credits_branch_1ff9d
	callchannel Music_Credits_branch_1ff7d
	callchannel Music_Credits_branch_1ff7d
	callchannel Music_Credits_branch_1ff7d
	callchannel Music_Credits_branch_1ff9d
Music_Credits_branch_1fed8: ; 1fed8
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note F#, 2
	loopchannel 7, Music_Credits_branch_1fed8
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note F#, 2
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
Music_Credits_branch_1fef6: ; 1fef6
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note F#, 2
	loopchannel 7, Music_Credits_branch_1fef6
	note G#, 1
	note G_, 1
	note F#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note A#, 4
	note C#, 4
	note G#, 1
	note G_, 1
	note B_, 2
	note G#, 1
	note G_, 1
	note B_, 2
	note A#, 4
	note A#, 4
	callchannel Music_Credits_branch_1ff7d
	callchannel Music_Credits_branch_1ff7d
	callchannel Music_Credits_branch_1ff7d
	callchannel Music_Credits_branch_1ff9d
Music_Credits_branch_1ff22: ; 1ff22
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note F#, 2
	loopchannel 7, Music_Credits_branch_1ff22
	note G#, 1
	note G_, 1
	note F#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 7
	notetype $8
	note A#, 1
	note A#, 1
	note A#, 1
	notetype $c
	note B_, 16
	note __, 16
	note B_, 15
	note __, 1
	note B_, 8
	note B_, 8
	note B_, 16
	note __, 16
	note B_, 16
	note B_, 8
	note B_, 6
	note D_, 1
	note D_, 1
	note B_, 12
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
	notetype $c
	note B_, 12
	notetype $8
	note D_, 2
	note D_, 2
	note D_, 2
	note B_, 12
	notetype $c
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	notetype $8
	note C#, 2
	note C#, 2
	note D_, 2
	notetype $c
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	notetype $8
	note C#, 2
	note C#, 2
	note C#, 2
	note D_, 2
	note D_, 2
	note D_, 2
	notetype $c
	note D_, 1
	note __, 7
	note A#, 8
	note __, 16
	note __, 16
	note __, 16
	endchannel
; 1ff7d

Music_Credits_branch_1ff7d: ; 1ff7d
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note F#, 2
	endchannel
; 1ff9d

Music_Credits_branch_1ff9d: ; 1ff9d
	note G#, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note G#, 1
	note D_, 1
	note F#, 2
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note A#, 1
	note D_, 1
	endchannel
; 1ffbd

