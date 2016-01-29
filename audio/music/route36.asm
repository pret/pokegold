Music_Route36: ; e9492
	dbw $c0, Music_Route36_Ch1
	dbw $01, Music_Route36_Ch2
	dbw $02, Music_Route36_Ch3
	dbw $03, Music_Route36_Ch4
; e949e

Music_Route36_Ch1: ; e949e
	tempo 144
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f
	notetype $c, $b3
	octave 3
	note C_, 4
	note C_, 6
	note F_, 1
	note E_, 1
	intensity $b5
	note F_, 8
	intensity $b3
	note F_, 6
	note A#, 1
	note A_, 1
	intensity $5d
	note A#, 4
Music_Route36_branch_e94c0: ; e94c0
	intensity $b5
	note F_, 4
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	note D#, 2
	note A#, 4
	note A_, 4
	note G_, 2
	note A#, 4
	note F_, 4
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	note G_, 2
	note A#, 4
	note A_, 4
	octave 4
	note D#, 4
	octave 3
	note A#, 2
	intensity $b6
	octave 4
	note F_, 10
	intensity $b5
	note C_, 2
	note F_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 4
	note D_, 4
	note C_, 2
	octave 3
	note A#, 4
	intensity $b4
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	intensity $a4
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note F#, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	note F#, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 2
	stereopanning $f0
	intensity $95
	octave 3
	note D_, 6
	octave 2
	note A_, 6
	octave 3
	note D_, 4
	octave 2
	note A_, 6
	octave 3
	note D_, 6
	note E_, 4
	intensity $b5
	note D_, 6
	note A_, 6
	note G_, 4
	intensity $a5
	octave 2
	note A_, 6
	octave 3
	note F#, 6
	note E_, 4
	note D_, 6
	octave 2
	note A_, 6
	octave 3
	note D_, 4
	intensity $b5
	note F#, 6
	note E_, 6
	note C#, 4
	note D_, 6
	note A_, 6
	note G_, 4
	octave 2
	note A_, 6
	octave 3
	note F#, 6
	note D_, 4
	note C_, 6
	note G_, 6
	note C_, 2
	note E_, 2
	intensity $b7
	note C_, 6
	note G_, 4
	note D_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	octave 4
	note D_, 6
	note C_, 2
	octave 3
	note B_, 2
	note A_, 6
	note D_, 6
	stereopanning $f
	intensity $b5
	note D#, 2
	note E_, 2
	loopchannel 0, Music_Route36_branch_e94c0
; e9558

Music_Route36_Ch2: ; e9558
	dutycycle $3
	vibrato $10, $36
	stereopanning $f0
	notetype $c, $c2
	octave 3
	note F_, 2
	note C_, 1
	note F_, 1
	intensity $c7
	note A_, 8
	note C_, 4
	intensity $c3
	octave 4
	note C_, 2
	octave 3
	note A_, 1
	octave 4
	note C_, 1
	intensity $c7
	note F_, 8
	octave 3
	note G_, 4
Music_Route36_branch_e9577: ; e9577
	intensity $c7
	octave 4
	note C_, 10
	intensity $c4
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	note A_, 2
	note G_, 3
	intensity $c2
	note D#, 1
	intensity $c7
	note D#, 12
	note C_, 10
	intensity $c4
	octave 3
	note A_, 2
	octave 4
	note C_, 2
	note F_, 2
	intensity $c2
	note D#, 2
	note D#, 1
	note F_, 1
	intensity $c7
	note G_, 12
	note A_, 10
	intensity $c4
	note F_, 2
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 3
	note A_, 1
	intensity $c7
	note G_, 8
	note A#, 4
	intensity $b0
	note A_, 16
	intensity $b7
	note A_, 16
	stereopanning $f
	intensity $a4
	octave 3
	note A_, 6
	note G_, 6
	note F#, 4
	note E_, 6
	note F#, 6
	note G_, 4
	intensity $b3
	note A_, 2
	note F#, 1
	note A_, 1
	intensity $b7
	octave 4
	note D_, 12
	intensity $a4
	octave 3
	note F#, 2
	note D_, 1
	note F#, 1
	intensity $a7
	note A_, 12
	intensity $c7
	note A_, 6
	note G_, 6
	note F#, 4
	note B_, 6
	note A_, 6
	note G_, 4
	intensity $c3
	note A_, 2
	note F#, 1
	note A_, 1
	intensity $c7
	octave 4
	note D_, 12
	intensity $c3
	octave 3
	note F#, 2
	note D_, 1
	note F#, 1
	intensity $c7
	note A_, 12
	intensity $c2
	note G_, 2
	note E_, 1
	note G_, 1
	intensity $b0
	octave 4
	note C_, 2
	intensity $b7
	note C_, 10
	intensity $c5
	octave 3
	note G_, 2
	note E_, 1
	note G_, 1
	intensity $c7
	octave 4
	note C_, 8
	note C#, 4
	stereopanning $ff
	note D_, 6
	note A_, 6
	note G_, 2
	note F#, 2
	intensity $b0
	note D_, 4
	intensity $b7
	note D_, 8
	stereopanning $f0
	intensity $c4
	octave 3
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	loopchannel 0, Music_Route36_branch_e9577
; e9614

Music_Route36_Ch3: ; e9614
	notetype $c, $25
	octave 3
	note F_, 1
	note __, 3
	note F_, 1
	note __, 1
	octave 4
	note C_, 4
	octave 3
	note C_, 2
	note F_, 2
	note C_, 2
	note D#, 1
	note __, 3
	note D#, 1
	note __, 1
	octave 4
	note F_, 4
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note E_, 2
Music_Route36_branch_e962d: ; e962d
	note F_, 4
	note C_, 2
	note F_, 4
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 4
	note D#, 2
	note G_, 4
	note D#, 2
	note G_, 2
	note D#, 2
	note F_, 4
	note C_, 2
	note F_, 4
	note C_, 2
	note F_, 2
	note C_, 2
	note G_, 4
	note D#, 2
	note G_, 4
	note D#, 2
	note G_, 2
	note D#, 2
	note A_, 4
	note F_, 2
	note A_, 4
	note F_, 2
	note A_, 2
	note F_, 2
	note A#, 4
	note G_, 2
	note A#, 4
	note G_, 2
	note A#, 2
	note G_, 2
	note F#, 4
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 2
	note D_, 2
	note D_, 4
	octave 2
	note A_, 2
	octave 3
	note D_, 4
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note F#, 4
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 2
	note D_, 2
	note G_, 4
	note E_, 2
	note G_, 4
	note E_, 2
	note G_, 2
	note E_, 2
	note F#, 4
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 4
	note D_, 2
	note E_, 2
	note A_, 2
	note F#, 4
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 2
	note D_, 2
	note G_, 4
	note E_, 2
	note G_, 4
	note E_, 2
	note G_, 2
	note E_, 2
	note F#, 4
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 2
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 4
	note D_, 2
	note F#, 2
	note D_, 2
	note G_, 4
	note C_, 2
	note G_, 4
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 4
	note C_, 2
	note G_, 4
	note C_, 2
	note E_, 2
	note G_, 2
	note A_, 6
	octave 4
	note F#, 4
	octave 3
	note D_, 2
	note A_, 2
	octave 4
	note D_, 2
	note C_, 3
	note E_, 1
	note F#, 6
	octave 3
	note D_, 2
	note D#, 2
	note E_, 2
	loopchannel 0, Music_Route36_branch_e962d
; e96b2

Music_Route36_Ch4: ; e96b2
	togglenoise $1
	notetype $c
	callchannel Music_Route36_branch_e96dd
	callchannel Music_Route36_branch_e96ea
Music_Route36_branch_e96bc: ; e96bc
	callchannel Music_Route36_branch_e96dd
	callchannel Music_Route36_branch_e96e4
	callchannel Music_Route36_branch_e96dd
	callchannel Music_Route36_branch_e96ea
	loopchannel 2, Music_Route36_branch_e96bc
Music_Route36_branch_e96cc: ; e96cc
	note A#, 4
	note A_, 2
	note F_, 4
	note B_, 1
	note B_, 1
	note A_, 4
	loopchannel 11, Music_Route36_branch_e96cc
	callchannel Music_Route36_branch_e96ea
	loopchannel 0, Music_Route36_branch_e96bc
; e96dd

Music_Route36_branch_e96dd: ; e96dd
	note A_, 4
	note A_, 6
	note A#, 1
	note A#, 1
	note A_, 2
	note A#, 2
	endchannel
; e96e4

Music_Route36_branch_e96e4: ; e96e4
	note A_, 4
	note A_, 6
	note B_, 1
	note A#, 1
	note A_, 4
	endchannel
; e96ea

Music_Route36_branch_e96ea: ; e96ea
	note A_, 4
	note A_, 6
	note A#, 1
	note A#, 1
	note A_, 2
	notetype $6
	note A#, 1
	note A#, 1
	note A_, 1
	note A_, 1
	notetype $c
	endchannel
; e96f8


