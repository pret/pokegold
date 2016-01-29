Music_RivalBattle: ; e96f8
	dbw $80, Music_RivalBattle_Ch1
	dbw $01, Music_RivalBattle_Ch2
	dbw $02, Music_RivalBattle_Ch3
; e9701

Music_RivalBattle_Ch1: ; e9701
	tempo 102
	volume $77
	dutycycle $3
	tone $0002
	vibrato $8, $15
	notetype $c, $b2
	octave 3
	note F#, 2
	note A#, 4
	intensity $b7
	note A#, 10
	intensity $b2
	note F#, 2
	octave 4
	note C#, 4
	intensity $b7
	note C#, 6
	note E_, 4
Music_RivalBattle_branch_e9720: ; e9720
	intensity $b2
	octave 2
	note A#, 6
	intensity $b7
	octave 3
	note C#, 6
	intensity $b2
	note D#, 4
	loopchannel 3, Music_RivalBattle_branch_e9720
	intensity $b2
	octave 2
	note A#, 2
	octave 3
	note C#, 4
	intensity $b7
	note C#, 10
Music_RivalBattle_branch_e9738: ; e9738
	intensity $b2
	octave 3
	note G#, 6
	intensity $b7
	note B_, 6
	intensity $b2
	octave 4
	note C#, 4
	loopchannel 3, Music_RivalBattle_branch_e9738
	intensity $b2
	octave 3
	note G#, 2
	note B_, 4
	intensity $4d
	note B_, 10
Music_RivalBattle_branch_e974f: ; e974f
	intensity $b7
	note A#, 6
	note F#, 6
	note D#, 4
	note F_, 4
	note F#, 4
	note G#, 2
	note A#, 6
	intensity $b2
	note F_, 1
	note D#, 1
	note C#, 1
	note D#, 1
	intensity $b7
	note F_, 4
	intensity $b2
	note G#, 1
	note F#, 1
	note F_, 1
	note F#, 1
	intensity $b7
	note G#, 4
	intensity $b6
	note G#, 2
	note A#, 2
	note B_, 2
	note A#, 2
	note B_, 2
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note E_, 2
	intensity $b7
	octave 3
	note A#, 6
	note F#, 6
	note A#, 4
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	note A#, 2
	note G#, 6
	note F_, 6
	octave 4
	note C#, 6
	octave 3
	note G#, 4
	intensity $b5
	note C#, 2
	note F_, 2
	note G#, 2
	octave 4
	note C_, 2
	note C#, 2
	octave 3
	note G#, 2
	note F_, 2
	note G#, 2
	intensity $b7
	note F#, 10
	intensity $b4
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	intensity $b7
	note F_, 4
	note D#, 4
	note C#, 2
	note D#, 6
	intensity $a0
	note F_, 8
	intensity $a7
	note F_, 8
	intensity $a0
	octave 2
	note A#, 8
	intensity $a7
	note A#, 8
	intensity $b7
	octave 3
	note F#, 10
	intensity $b5
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note D#, 2
	note G#, 2
	note F#, 2
	note F_, 2
	note G#, 2
	intensity $a0
	note A#, 16
	intensity $a7
	note A#, 16
	intensity $a0
	note B_, 8
	intensity $a7
	note B_, 4
	intensity $b7
	note G#, 4
	intensity $b5
	octave 4
	note E_, 2
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note F#, 2
	note E_, 2
	note D#, 2
	note C#, 2
Music_RivalBattle_branch_e97e0: ; e97e0
	octave 3
	note A#, 2
	note E_, 2
	note A#, 2
	octave 4
	note D#, 2
	note E_, 2
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	note E_, 2
	note D#, 2
	octave 3
	note A#, 2
	note D#, 2
	note A#, 2
	octave 4
	note D#, 2
	loopchannel 2, Music_RivalBattle_branch_e97e0
	intensity $94
	octave 3
	note D#, 8
	octave 2
	note A#, 8
	octave 3
	note G_, 8
	note F_, 8
	intensity $96
	octave 2
	note G#, 8
	note A#, 8
	note B_, 8
	octave 3
	note C#, 8
	intensity $b7
	octave 4
	note D#, 8
	octave 3
	note A#, 8
	octave 4
	note G_, 8
	note F_, 8
	octave 3
	note G#, 8
	note A#, 8
	note B_, 8
	octave 4
	note C#, 8
	intensity $a0
	note D#, 8
	intensity $a7
	note D#, 8
	intensity $a0
	octave 3
	note G_, 8
	intensity $a7
	note G_, 8
	intensity $b7
	note D#, 8
	note C#, 8
	note D#, 4
	note C#, 4
	octave 2
	note B_, 4
	octave 3
	note C#, 4
	intensity $c7
	octave 2
	note A#, 6
	octave 3
	note C#, 6
	note D#, 4
	note E_, 6
	note D#, 6
	note C#, 4
	note G#, 6
	note E_, 6
	note D#, 4
	note C#, 6
	note D#, 6
	note D_, 4
	octave 2
	note G#, 6
	note B_, 6
	octave 3
	note C#, 4
	note D_, 6
	note C#, 6
	octave 2
	note B_, 4
	octave 3
	note F#, 6
	note D_, 6
	note C#, 4
	octave 2
	note B_, 6
	octave 3
	note C#, 10
	loopchannel 0, Music_RivalBattle_branch_e974f
; e9858

Music_RivalBattle_Ch2: ; e9858
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
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
	intensity $c2
	octave 4
	note D#, 6
	intensity $c7
	octave 3
	note F#, 6
	intensity $c2
	note G#, 4
Music_RivalBattle_branch_e9893: ; e9893
	intensity $c2
	note D#, 6
	intensity $c7
	note F#, 6
	intensity $c2
	note G#, 4
	loopchannel 2, Music_RivalBattle_branch_e9893
	intensity $c2
	note D#, 2
	note F#, 4
	intensity $c7
	note F#, 8
	intensity $a2
	note B_, 1
	octave 4
	note C_, 1
Music_RivalBattle_branch_e98ac: ; e98ac
	intensity $c2
	note C#, 6
	intensity $c7
	note E_, 6
	intensity $c2
	note F#, 4
	loopchannel 3, Music_RivalBattle_branch_e98ac
	intensity $c2
	note C#, 2
	note E_, 4
	intensity $b0
	note E_, 4
	intensity $b7
	note E_, 6
Music_RivalBattle_branch_e98c3: ; e98c3
	callchannel Music_RivalBattle_branch_e9989
	intensity $b0
	note G#, 8
	intensity $b7
	note G#, 8
	callchannel Music_RivalBattle_branch_e9989
	intensity $4e
	note G#, 8
	intensity $b7
	note G#, 8
	intensity $b0
	octave 3
	note B_, 10
	intensity $b7
	note B_, 6
	intensity $b0
	octave 4
	note C#, 8
	octave 3
	note B_, 8
	intensity $b0
	note A#, 10
	intensity $b7
	note A#, 6
	intensity $2f
	note D#, 10
	intensity $b7
	note D#, 6
	intensity $b0
	note B_, 10
	intensity $b7
	note B_, 6
	intensity $c7
	octave 4
	note C#, 8
	octave 3
	note B_, 8
	intensity $b0
	octave 4
	note D#, 16
	intensity $b7
	note D#, 16
	intensity $b0
	note E_, 4
	intensity $b7
	note E_, 6
	intensity $c7
	note E_, 2
	note G#, 2
	note B_, 2
	octave 5
	note C#, 8
	octave 4
	note B_, 8
	intensity $b0
	note A#, 10
	intensity $b7
	note A#, 6
	intensity $b0
	note A_, 10
	intensity $b7
	note A_, 6
	intensity $b0
	note G#, 10
	intensity $b7
	note G#, 6
	intensity $b0
	note G_, 10
	intensity $b7
	note G_, 6
	intensity $a4
	octave 3
	note G_, 8
	note D#, 8
	note A#, 8
	note G#, 8
	intensity $a6
	octave 2
	note B_, 8
	octave 3
	note C#, 8
	note D#, 8
	note F_, 8
	intensity $c7
	octave 4
	note G_, 8
	note D#, 8
	note A#, 8
	note G#, 8
	octave 3
	note B_, 8
	octave 4
	note C#, 8
	note D#, 8
	note F_, 8
	intensity $b0
	note G_, 16
	note D#, 16
	octave 3
	note B_, 8
	note A#, 8
	note G#, 8
	intensity $c7
	note F_, 8
Music_RivalBattle_branch_e994f: ; e994f
	intensity $c2
	octave 3
	note A#, 6
	intensity $c7
	octave 4
	note C#, 6
	intensity $c2
	note D#, 4
	loopchannel 3, Music_RivalBattle_branch_e994f
	intensity $c2
	octave 3
	note A#, 2
	octave 4
	note C#, 4
	intensity $b7
	note C#, 6
	intensity $9a
	note C#, 4
Music_RivalBattle_branch_e996a: ; e996a
	intensity $c2
	octave 3
	note G#, 6
	intensity $c7
	note B_, 6
	intensity $c2
	octave 4
	note C#, 4
	loopchannel 3, Music_RivalBattle_branch_e996a
	intensity $c2
	octave 3
	note G#, 2
	note B_, 4
	intensity $c7
	note B_, 6
	intensity $6a
	octave 4
	note D_, 4
	loopchannel 0, Music_RivalBattle_branch_e98c3
; e9989

Music_RivalBattle_branch_e9989: ; e9989
	intensity $c7
	note D#, 10
	intensity $c4
	octave 3
	note A#, 2
	octave 4
	note D#, 2
	note F#, 2
	intensity $c5
	note F_, 4
	note D#, 4
	intensity $c2
	note C#, 2
	intensity $c7
	note D#, 6
	intensity $b0
	note F_, 8
	intensity $b7
	note F_, 8
	endchannel
; e99a4

Music_RivalBattle_Ch3: ; e99a4
	notetype $c, $19
	octave 3
	note F#, 2
	note A#, 2
	note __, 2
	note A#, 10
	octave 3
	note F#, 2
	octave 4
	note C#, 2
	note __, 2
	note C#, 6
	octave 3
	note C#, 2
	note D_, 2
Music_RivalBattle_branch_e99b5: ; e99b5
	note D#, 2
	note C#, 2
	note D#, 2
	note F#, 4
	note E_, 2
	note D#, 2
	note C#, 2
	loopchannel 4, Music_RivalBattle_branch_e99b5
Music_RivalBattle_branch_e99c0: ; e99c0
	octave 3
	note C#, 2
	octave 2
	note B_, 2
	octave 3
	note C#, 2
	note E_, 4
	note D_, 2
	note C#, 2
	octave 2
	note B_, 2
	loopchannel 3, Music_RivalBattle_branch_e99c0
	octave 3
	note C#, 2
	note E_, 2
	note C#, 2
	octave 2
	note B_, 4
	octave 3
	note C_, 2
	note C#, 2
	note D_, 2
Music_RivalBattle_branch_e99d9: ; e99d9
	callchannel Music_RivalBattle_branch_e9af0
	octave 2
	note A#, 2
	octave 4
	note C#, 2
	octave 2
	note A#, 2
	octave 3
	note B_, 2
	octave 2
	note A#, 2
	octave 3
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note G#, 2
	callchannel Music_RivalBattle_branch_e9af9
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 4
	note C#, 2
	note C_, 2
	octave 2
	note B_, 2
	callchannel Music_RivalBattle_branch_e9af0
	octave 2
	note A#, 2
	octave 3
	note A#, 2
	octave 2
	note A#, 2
	octave 3
	note G#, 2
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	callchannel Music_RivalBattle_branch_e9af9
Music_RivalBattle_branch_e9a0f: ; e9a0f
	note C#, 2
	note G#, 2
	loopchannel 4, Music_RivalBattle_branch_e9a0f
	callchannel Music_RivalBattle_branch_e9b05
	note G#, 2
	note F#, 2
Music_RivalBattle_branch_e9a1a: ; e9a1a
	octave 2
	note A#, 2
	octave 3
	note F_, 2
	loopchannel 4, Music_RivalBattle_branch_e9a1a
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	note F_, 2
	note D#, 2
	callchannel Music_RivalBattle_branch_e9b05
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	callchannel Music_RivalBattle_branch_e9b0e
	octave 3
	note D#, 2
	octave 4
	note D#, 2
	callchannel Music_RivalBattle_branch_e9b0e
	octave 3
	note D#, 2
	note A#, 2
	note E_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note B_, 2
	octave 4
	note E_, 2
	octave 3
	note E_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note G#, 2
Music_RivalBattle_branch_e9a5c: ; e9a5c
	note D#, 2
	note A#, 2
	loopchannel 4, Music_RivalBattle_branch_e9a5c
Music_RivalBattle_branch_e9a62: ; e9a62
	note D#, 2
	note A_, 2
	loopchannel 4, Music_RivalBattle_branch_e9a62
Music_RivalBattle_branch_e9a68: ; e9a68
	note D#, 2
	note G#, 2
	loopchannel 4, Music_RivalBattle_branch_e9a68
Music_RivalBattle_branch_e9a6e: ; e9a6e
	note D#, 2
	note G_, 2
	loopchannel 12, Music_RivalBattle_branch_e9a6e
Music_RivalBattle_branch_e9a74: ; e9a74
	octave 2
	note B_, 2
	octave 3
	note D#, 2
	loopchannel 4, Music_RivalBattle_branch_e9a74
Music_RivalBattle_branch_e9a7c: ; e9a7c
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	loopchannel 4, Music_RivalBattle_branch_e9a7c
	note D#, 2
	note G_, 2
	note A#, 2
	note D#, 2
	note G_, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	note G_, 2
	note A#, 2
	note D#, 2
	note G_, 2
	note A#, 2
	note D#, 2
	note A#, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note G_, 2
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note B_, 2
	octave 2
	note B_, 2
	octave 3
	note G#, 2
	note B_, 2
	octave 2
	note B_, 2
	octave 4
	note D#, 2
	note C#, 2
	octave 3
	note B_, 2
	note G#, 2
	note G_, 8
	note D#, 8
	note A#, 8
	note G_, 8
	octave 2
	note B_, 8
	octave 3
	note C#, 8
	note D#, 8
	note F_, 8
Music_RivalBattle_branch_e9ab9: ; e9ab9
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	loopchannel 7, Music_RivalBattle_branch_e9ab9
	note E_, 2
	note D#, 2
Music_RivalBattle_branch_e9ac3: ; e9ac3
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	loopchannel 6, Music_RivalBattle_branch_e9ac3
	octave 2
	note A#, 2
	octave 3
	note F#, 2
	note F_, 2
	note E_, 2
Music_RivalBattle_branch_e9ad1: ; e9ad1
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	loopchannel 7, Music_RivalBattle_branch_e9ad1
	note D_, 2
	note C#, 2
Music_RivalBattle_branch_e9adb: ; e9adb
	octave 2
	note G#, 2
	octave 3
	note C#, 2
	loopchannel 4, Music_RivalBattle_branch_e9adb
	octave 2
	note B_, 2
	note G#, 2
	note B_, 2
	octave 3
	note F_, 4
	note E_, 2
	note D#, 2
	note D_, 2
	loopchannel 0, Music_RivalBattle_branch_e99d9
; e9af0

Music_RivalBattle_branch_e9af0: ; e9af0
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	loopchannel 4, Music_RivalBattle_branch_e9af0
	endchannel
; e9af9

Music_RivalBattle_branch_e9af9: ; e9af9
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 4
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	note G#, 2
	endchannel
; e9b05

Music_RivalBattle_branch_e9b05: ; e9b05
	octave 2
	note B_, 2
	octave 3
	note F#, 2
	loopchannel 7, Music_RivalBattle_branch_e9b05
	endchannel
; e9b0e

Music_RivalBattle_branch_e9b0e: ; e9b0e
	octave 3
	note D#, 2
	note A#, 2
	octave 4
	note D#, 2
	loopchannel 2, Music_RivalBattle_branch_e9b0e
	endchannel
; e9b18


