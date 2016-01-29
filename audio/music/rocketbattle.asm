Music_RocketBattle: ; e9b18
	dbw $80, Music_RocketBattle_Ch1
	dbw $01, Music_RocketBattle_Ch2
	dbw $02, Music_RocketBattle_Ch3
; e9b21

Music_RocketBattle_Ch1: ; e9b21
	tempo 101
	volume $77
	dutycycle $3
	tone $0002
	vibrato $10, $15
	notetype $c, $b2
	octave 4
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note B_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 2
	note B_, 1
Music_RocketBattle_branch_e9b56: ; e9b56
	intensity $b2
	octave 3
	note C_, 6
	note C_, 4
	note E_, 2
	intensity $b7
	note D_, 4
	loopchannel 3, Music_RocketBattle_branch_e9b56
	intensity $b2
	note C_, 6
	note C_, 6
	intensity $b7
	note D_, 4
Music_RocketBattle_branch_e9b6a: ; e9b6a
	intensity $b2
	octave 4
	note E_, 6
	note E_, 4
	note G_, 2
	intensity $b7
	note F_, 4
	loopchannel 3, Music_RocketBattle_branch_e9b6a
	intensity $b2
	note E_, 6
	note E_, 4
	intensity $b7
	note D_, 2
	note D#, 4
	intensity $b3
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note E_, 2
	note A#, 2
	note F_, 2
	note F_, 2
	note A_, 2
	note D_, 2
	note D_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	intensity $b5
	note G_, 4
	intensity $b3
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	intensity $b5
	note D#, 4
	intensity $b3
	note D#, 2
	note D_, 2
	note F_, 2
Music_RocketBattle_branch_e9bab: ; e9bab
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note E_, 2
	octave 4
	note D_, 2
	octave 3
	note F_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note D_, 2
	note D_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note E_, 2
	octave 4
	note D_, 2
	octave 3
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	intensity $b5
	note G_, 4
	intensity $b3
	note G_, 2
	note F_, 2
	octave 4
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	intensity $b5
	note F_, 4
	intensity $b2
	octave 3
	note F_, 2
	note G_, 2
	note G#, 4
	intensity $b5
	note D_, 4
	note C_, 4
	note D_, 4
	note E_, 2
	intensity $b2
	note F_, 2
	note A_, 4
	intensity $b7
	note A_, 4
	intensity $b5
	note A_, 2
	note G_, 2
	note F_, 4
	note D_, 4
	note C_, 4
	note D_, 4
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note A#, 2
	note G_, 2
	note A_, 2
	note A#, 2
	intensity $b7
	octave 4
	note E_, 6
	note D_, 4
	octave 3
	note G_, 2
	note A#, 4
	note A_, 6
	note G_, 4
	note E_, 2
	note F_, 4
	note E_, 6
	note D_, 6
	note D#, 4
	intensity $a0
	note E_, 8
	intensity $a7
	note E_, 8
	intensity $b7
	octave 2
	note A_, 8
	note G_, 8
	note A_, 8
	note A#, 8
	note A_, 8
	note G_, 8
	note A_, 8
	octave 3
	note C#, 8
	note D_, 8
	note C#, 8
	octave 2
	note A#, 8
	note A_, 8
	octave 3
	note D_, 8
	note C#, 8
	note D_, 8
	note E_, 8
	octave 2
	note A#, 6
	octave 3
	note D_, 6
	note C_, 4
	intensity $b5
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note E_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note A_, 2
	octave 4
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note A#, 2
	note G_, 2
	intensity $b2
	note E_, 6
	note E_, 6
	note E_, 4
	note E_, 6
	note E_, 4
	intensity $b7
	note G_, 2
	note F_, 4
	intensity $b2
	note E_, 6
	note E_, 4
	intensity $b7
	note G_, 2
	note F_, 4
	intensity $b2
	note E_, 6
	octave 4
	note D_, 1
	note D#, 1
	intensity $a0
	note E_, 8
	intensity $b2
	octave 3
	note F_, 6
	note F_, 4
	intensity $b7
	note A#, 2
	note G_, 4
Music_RocketBattle_branch_e9c6e: ; e9c6e
	intensity $b2
	note F_, 6
	note F_, 4
	intensity $b7
	note A_, 2
	note G_, 4
	loopchannel 2, Music_RocketBattle_branch_e9c6e
	intensity $b2
	note F_, 6
	octave 4
	note D_, 1
	note E_, 1
	intensity $a0
	note F_, 8
	intensity $b3
	note D_, 2
	octave 3
	note A_, 2
	note E_, 2
	note A_, 4
	note A_, 2
	intensity $b7
	octave 4
	note D_, 4
	intensity $b3
	note D#, 2
	octave 3
	note A#, 2
	note G_, 2
	note A#, 4
	note A#, 2
	intensity $b7
	octave 4
	note D_, 4
	intensity $b3
	note E_, 2
	note C_, 2
	octave 3
	note A_, 2
	octave 4
	note C_, 4
	note C_, 2
	intensity $b7
	note D#, 4
	intensity $a0
	note E_, 4
	intensity $a7
	note E_, 6
	intensity $a0
	octave 3
	note G#, 6
	intensity $b3
	note C_, 2
	note E_, 2
	note E_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note F_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note D_, 2
	note C_, 2
	note E_, 2
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	note C_, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note C_, 2
	intensity $b5
	note D_, 4
	intensity $b3
	note D_, 2
	note C_, 2
	octave 2
	note A#, 2
	octave 3
	note D_, 2
	note C#, 2
	note D_, 2
	intensity $b5
	note D#, 4
	intensity $b3
	note D#, 2
	note D_, 2
	note F_, 2
	loopchannel 0, Music_RocketBattle_branch_e9bab
; e9ce7

Music_RocketBattle_Ch2: ; e9ce7
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $b2
	octave 4
	note A_, 4
	note A#, 4
	note B_, 4
	octave 5
	note C_, 1
	intensity $82
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $c2
	octave 5
	note C#, 1
	intensity $92
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $c2
	octave 5
	note D_, 1
	intensity $a2
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $c2
	octave 5
	note D#, 1
	intensity $b2
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
	intensity $c2
	octave 5
	note E_, 1
	octave 4
	note G#, 1
	note A_, 1
	note G#, 1
Music_RocketBattle_branch_e9d24: ; e9d24
	intensity $c2
	octave 3
	note A_, 6
	note A_, 4
	octave 4
	note C_, 2
	intensity $c7
	octave 3
	note A#, 4
	loopchannel 3, Music_RocketBattle_branch_e9d24
	intensity $c2
	note A_, 6
	note A_, 6
	intensity $4a
	note G#, 4
Music_RocketBattle_branch_e9d3a: ; e9d3a
	intensity $c2
	octave 4
	note A_, 6
	note A_, 4
	octave 5
	note C_, 2
	intensity $c7
	octave 4
	note A#, 4
	loopchannel 3, Music_RocketBattle_branch_e9d3a
	intensity $c2
	note A_, 6
	note A_, 4
	intensity $c7
	note G_, 2
	note G#, 4
	callchannel Music_RocketBattle_branch_e9e49
	intensity $b0
	note F_, 16
	intensity $b7
	note F_, 16
Music_RocketBattle_branch_e9d5a: ; e9d5a
	callchannel Music_RocketBattle_branch_e9e49
	intensity $b0
	note F_, 8
	intensity $b7
	note F_, 8
	intensity $b0
	note A#, 8
	intensity $b7
	note A#, 8
	intensity $c4
	octave 3
	note A_, 2
	note G_, 2
	note A_, 2
	intensity $c7
	octave 4
	note C_, 4
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	intensity $c2
	note A_, 2
	octave 4
	note C_, 4
	intensity $b0
	note C_, 6
	intensity $b7
	note C_, 4
	intensity $c4
	octave 3
	note A#, 2
	note A_, 2
	note A#, 2
	intensity $c7
	octave 4
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	intensity $c2
	note A#, 2
	octave 4
	note D_, 4
	intensity $b0
	note D_, 4
	intensity $b7
	note D_, 6
	intensity $4f
	note A_, 6
	intensity $a0
	note G_, 6
	note F_, 4
	note E_, 6
	note F_, 6
	note G_, 4
	note A_, 6
	note A#, 6
	note G#, 4
	note A_, 6
	intensity $a7
	note A_, 10
	intensity $3f
	octave 3
	note D_, 8
	intensity $b7
	note D_, 8
	intensity $3f
	note C#, 8
	intensity $b7
	note C#, 8
	intensity $3f
	note D_, 8
	intensity $b7
	note D_, 8
	intensity $3f
	note E_, 8
	intensity $b7
	note E_, 8
	intensity $4e
	note F_, 8
	intensity $a0
	note F_, 8
	note E_, 16
	note F_, 16
	note A_, 16
	intensity $3f
	note F_, 16
	intensity $c7
	octave 4
	note D_, 8
	note C#, 8
	intensity $b0
	note E_, 8
	intensity $b7
	note E_, 8
	intensity $3c
	note A_, 6
	intensity $c7
	note A_, 10
	intensity $c2
	octave 3
	note A_, 6
	note A_, 6
	note A_, 4
	note A_, 6
	note A_, 4
	intensity $c7
	octave 4
	note C_, 2
	octave 3
	note A#, 4
	intensity $c2
	note A_, 6
	note A_, 4
	intensity $c7
	octave 4
	note C_, 2
	octave 3
	note A#, 4
	intensity $c2
	note A_, 6
	intensity $c7
	octave 4
	note G_, 1
	note G#, 1
	note A_, 8
Music_RocketBattle_branch_e9e03: ; e9e03
	intensity $c2
	octave 3
	note A#, 6
	note A#, 4
	intensity $c7
	octave 4
	note D_, 2
	note C_, 4
	loopchannel 3, Music_RocketBattle_branch_e9e03
	intensity $c2
	octave 3
	note A#, 6
	intensity $c7
	octave 4
	note G_, 1
	note A_, 1
	note A#, 8
	intensity $c7
	note A_, 6
	note G_, 6
	note A_, 4
	note A#, 6
	octave 5
	note D_, 6
	octave 4
	note A#, 4
	note A_, 6
	note G_, 6
	intensity $c5
	note A_, 4
	intensity $b0
	note A_, 8
	intensity $b7
	note A_, 8
	intensity $c6
	octave 3
	note A_, 6
	note G#, 6
	note E_, 4
	note A_, 6
	note G#, 6
	note E_, 4
	intensity $b0
	note F_, 8
	intensity $b7
	note F_, 8
	intensity $3d
	note A#, 8
	intensity $c7
	note A#, 8
	loopchannel 0, Music_RocketBattle_branch_e9d5a
; e9e49

Music_RocketBattle_branch_e9e49: ; e9e49
	intensity $c6
	octave 4
	note A_, 6
	note G#, 6
	note E_, 4
	note A_, 6
	note G#, 6
	note E_, 4
	endchannel
; e9e53

Music_RocketBattle_Ch3: ; e9e53
	notetype $c, $19
	octave 3
	note A_, 2
	octave 4
	note E_, 2
	octave 3
	note G#, 2
	octave 4
	note E_, 2
	octave 3
	note G_, 2
	octave 4
	note E_, 2
	octave 3
	note F#, 2
	octave 4
	note E_, 2
	octave 3
	note F_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	octave 2
	note B_, 2
	note A#, 2
Music_RocketBattle_branch_e9e75: ; e9e75
	callchannel Music_RocketBattle_branch_e9f8f
	loopchannel 3, Music_RocketBattle_branch_e9e75
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
Music_RocketBattle_branch_e9e88: ; e9e88
	callchannel Music_RocketBattle_branch_e9f8f
	loopchannel 3, Music_RocketBattle_branch_e9e88
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note G_, 2
	octave 2
	note G_, 2
	note A_, 2
	note A#, 2
	callchannel Music_RocketBattle_branch_e9f9c
	callchannel Music_RocketBattle_branch_e9fb9
	octave 3
	note F_, 2
	callchannel Music_RocketBattle_branch_e9fc6
Music_RocketBattle_branch_e9ea7: ; e9ea7
	callchannel Music_RocketBattle_branch_e9f9c
	callchannel Music_RocketBattle_branch_e9fb9
	octave 3
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note E_, 2
	note D_, 2
	callchannel Music_RocketBattle_branch_e9fd3
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
Music_RocketBattle_branch_e9ece: ; e9ece
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 5, Music_RocketBattle_branch_e9ece
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note A#, 2
	callchannel Music_RocketBattle_branch_e9fd3
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note F_, 2
	note E_, 2
	note D_, 2
	callchannel Music_RocketBattle_branch_e9fd3
	callchannel Music_RocketBattle_branch_e9fd3
Music_RocketBattle_branch_e9ef7: ; e9ef7
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A#, 2
	note A_, 2
	octave 3
	note D_, 2
	note G_, 2
	note F_, 2
	loopchannel 7, Music_RocketBattle_branch_e9ef7
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A#, 2
	note A_, 2
	octave 3
	note A_, 2
	note G_, 2
	note F_, 2
Music_RocketBattle_branch_e9f13: ; e9f13
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 4, Music_RocketBattle_branch_e9f13
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
Music_RocketBattle_branch_e9f25: ; e9f25
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	loopchannel 13, Music_RocketBattle_branch_e9f25
	octave 2
	note A_, 2
	octave 3
	note E_, 4
	note D_, 2
	note C_, 2
	octave 2
	note A#, 2
Music_RocketBattle_branch_e9f35: ; e9f35
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	loopchannel 4, Music_RocketBattle_branch_e9f35
	octave 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	note A#, 4
	note A_, 2
	note G_, 2
	note A#, 2
Music_RocketBattle_branch_e9f47: ; e9f47
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 7, Music_RocketBattle_branch_e9f47
	note E_, 2
	note F_, 2
Music_RocketBattle_branch_e9f51: ; e9f51
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 5, Music_RocketBattle_branch_e9f51
	octave 3
	note A#, 2
	octave 4
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	callchannel Music_RocketBattle_branch_e9fdc
	octave 3
	note E_, 2
	callchannel Music_RocketBattle_branch_e9fb9
	octave 3
	note F_, 2
	callchannel Music_RocketBattle_branch_e9fdc
	octave 3
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	callchannel Music_RocketBattle_branch_e9f9c
	callchannel Music_RocketBattle_branch_e9fb9
	octave 3
	note F_, 2
	callchannel Music_RocketBattle_branch_e9fc6
	loopchannel 0, Music_RocketBattle_branch_e9ea7
; e9f8f

Music_RocketBattle_branch_e9f8f: ; e9f8f
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D_, 2
	octave 2
	note A_, 2
	note A#, 2
	octave 3
	note E_, 2
	note G_, 2
	note F_, 2
	endchannel
; e9f9c

Music_RocketBattle_branch_e9f9c: ; e9f9c
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D#, 2
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note D#, 2
	note D_, 2
	endchannel
; e9fb9

Music_RocketBattle_branch_e9fb9: ; e9fb9
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 2
	note A#, 2
	endchannel
; e9fc6

Music_RocketBattle_branch_e9fc6: ; e9fc6
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	endchannel
; e9fd3

Music_RocketBattle_branch_e9fd3: ; e9fd3
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	loopchannel 4, Music_RocketBattle_branch_e9fd3
	endchannel
; e9fdc

Music_RocketBattle_branch_e9fdc: ; e9fdc
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note E_, 2
	note A_, 2
	octave 2
	note A_, 2
	endchannel
; e9fe9


