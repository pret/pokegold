Music_ChampionBattle: ; ea96a
	dbw $80, Music_ChampionBattle_Ch1
	dbw $01, Music_ChampionBattle_Ch2
	dbw $02, Music_ChampionBattle_Ch3
; ea973

Music_ChampionBattle_Ch1: ; ea973
	tempo 98
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2
	octave 2
	note A#, 8
	note A#, 8
	note A#, 8
	note A#, 4
	intensity $b7
	note B_, 4
Music_ChampionBattle_branch_ea98b: ; ea98b
	callchannel Music_ChampionBattle_branch_eaa97
	octave 3
	note D#, 4
	loopchannel 2, Music_ChampionBattle_branch_ea98b
	callchannel Music_ChampionBattle_branch_eaa97
	octave 3
	note E_, 4
Music_ChampionBattle_branch_ea999: ; ea999
	callchannel Music_ChampionBattle_branch_eaaa5
	loopchannel 3, Music_ChampionBattle_branch_ea999
	callchannel Music_ChampionBattle_branch_eaaaf
Music_ChampionBattle_branch_ea9a3: ; ea9a3
	callchannel Music_ChampionBattle_branch_eaaa5
	loopchannel 7, Music_ChampionBattle_branch_ea9a3
	callchannel Music_ChampionBattle_branch_eaaaf
	intensity $b2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 4
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note E_, 4
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note F#, 4
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note G#, 4
	intensity $a0
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note B_, 12
	intensity $b2
	note A#, 1
	note B_, 1
	octave 4
	note C_, 1
	note C#, 1
Music_ChampionBattle_branch_ea9de: ; ea9de
	callchannel Music_ChampionBattle_branch_eaab8
	note E_, 2
	note E_, 2
	intensity $b7
	note F#, 4
Music_ChampionBattle_branch_ea9e6: ; ea9e6
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note G#, 4
	loopchannel 2, Music_ChampionBattle_branch_ea9e6
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note B_, 4
	callchannel Music_ChampionBattle_branch_eaab8
	note E_, 2
	note E_, 2
	intensity $b7
	note F#, 4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note G#, 4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	note B_, 4
	intensity $b2
	note E_, 2
	note E_, 2
	intensity $b7
	octave 4
	note E_, 4
	callchannel Music_ChampionBattle_branch_eaacd
	note B_, 4
	note G#, 4
	callchannel Music_ChampionBattle_branch_eaacd
	octave 4
	note D_, 4
	note D_, 4
	intensity $a0
	octave 3
	note A#, 8
	octave 2
	note A#, 8
	octave 3
	note F#, 8
	octave 2
	note F#, 8
	intensity $60
	note B_, 16
	intensity $70
	note B_, 16
	intensity $80
	octave 3
	note C#, 16
	intensity $a0
	note D#, 16
	intensity $b4
	octave 4
	note F#, 4
	note F_, 4
	note E_, 4
	note D#, 4
	note D_, 4
	note C#, 4
	note F#, 4
	note F#, 4
	note F#, 4
	note F_, 4
	note E_, 4
	note D#, 4
	note F#, 2
	note G#, 2
	note D#, 2
	note E_, 2
	note F#, 4
	note F#, 4
	note __, 16
	intensity $90
	octave 3
	note F#, 8
	intensity $b4
	note E_, 4
	note E_, 4
	intensity $90
	note D#, 16
	note C#, 16
Music_ChampionBattle_branch_eaa5a: ; eaa5a
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 4
	loopchannel 4, Music_ChampionBattle_branch_eaa5a
Music_ChampionBattle_branch_eaa67: ; eaa67
	intensity $b2
	note C_, 2
	note C_, 2
	intensity $b7
	note D#, 4
	loopchannel 2, Music_ChampionBattle_branch_eaa67
	intensity $b2
	note C_, 2
	note C_, 2
	intensity $b7
	note F#, 4
	intensity $b2
	note C_, 2
	note C_, 2
	intensity $b7
	note G#, 4
	callchannel Music_ChampionBattle_branch_eaada
	octave 3
	note D#, 2
	note D#, 2
	intensity $b7
	note B_, 4
	callchannel Music_ChampionBattle_branch_eaada
	octave 3
	note D#, 2
	note D#, 2
	intensity $b7
	octave 4
	note D_, 4
	loopchannel 0, Music_ChampionBattle_branch_ea9de
; eaa97

Music_ChampionBattle_branch_eaa97: ; eaa97
	intensity $b2
	octave 2
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 6
	note A#, 2
	note A#, 2
	intensity $b7
	endchannel
; eaaa5

Music_ChampionBattle_branch_eaaa5: ; eaaa5
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	octave 3
	note D#, 4
	endchannel
; eaaaf

Music_ChampionBattle_branch_eaaaf: ; eaaaf
	intensity $b2
	octave 2
	note A#, 2
	note A#, 2
	intensity $b7
	note B_, 4
	endchannel
; eaab8

Music_ChampionBattle_branch_eaab8: ; eaab8
	intensity $b5
	octave 3
	note D#, 2
	note A#, 2
	note D#, 2
	note F#, 4
	note F_, 2
	note E_, 2
	note B_, 2
	note F#, 2
	note A#, 2
	note F_, 2
	note A_, 2
	note E_, 2
	note G#, 2
	note D#, 2
	note G_, 2
	intensity $b2
	endchannel
; eaacd

Music_ChampionBattle_branch_eaacd: ; eaacd
	intensity $b2
	octave 3
	note A#, 2
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 4
	note A#, 2
	intensity $b7
	endchannel
; eaada

Music_ChampionBattle_branch_eaada: ; eaada
	intensity $b2
	note D#, 2
	note D#, 2
	intensity $b7
	note A#, 4
	intensity $b2
	note D#, 2
	note D#, 2
	intensity $b7
	note B_, 4
	intensity $b2
	note D#, 2
	note D#, 2
	intensity $b7
	octave 4
	note C#, 4
	intensity $b2
	endchannel
; eaaf3

Music_ChampionBattle_Ch2: ; eaaf3
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
	octave 3
	note D#, 8
	note D#, 8
	note D#, 8
	note D#, 4
	intensity $c7
	note D_, 4
	callchannel Music_ChampionBattle_branch_eabf8
	note A#, 4
	callchannel Music_ChampionBattle_branch_eabf8
	note B_, 4
	callchannel Music_ChampionBattle_branch_eabf8
	octave 4
	note C#, 4
	callchannel Music_ChampionBattle_branch_eac05
	note D_, 4
	callchannel Music_ChampionBattle_branch_eac05
	note F_, 4
	callchannel Music_ChampionBattle_branch_eac05
	note D_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note C_, 4
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note C#, 4
	note D#, 8
	octave 3
	note D#, 8
	octave 4
	note E_, 8
	intensity $3c
	note E_, 8
Music_ChampionBattle_branch_eab46: ; eab46
	intensity $c5
	note D#, 6
	octave 3
	note A#, 6
	octave 4
	note D#, 2
	note D_, 2
	note C#, 4
	note C_, 4
	octave 3
	note B_, 4
	note A#, 4
	intensity $c7
	note B_, 8
	octave 4
	note E_, 8
	intensity $c2
	octave 3
	note G#, 2
	note G#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note G#, 2
	note G#, 2
	intensity $c7
	octave 4
	note C#, 4
	intensity $c5
	note D#, 6
	octave 3
	note A#, 6
	octave 4
	note D#, 2
	note D_, 2
	note C#, 4
	note C_, 4
	octave 3
	note B_, 4
	note A#, 2
	note B_, 2
	intensity $c7
	octave 4
	note E_, 8
	note G#, 8
	note E_, 8
	note B_, 8
	callchannel Music_ChampionBattle_branch_eac22
	note E_, 4
	note E_, 4
	callchannel Music_ChampionBattle_branch_eac22
	note F#, 4
	note F#, 4
	intensity $c7
	note D#, 8
	octave 3
	note D#, 8
	octave 4
	note C#, 8
	octave 3
	note C#, 8
	intensity $b0
	note D#, 16
	note D#, 16
	note F_, 16
	note F#, 16
	intensity $c4
Music_ChampionBattle_branch_eab98: ; eab98
	octave 5
	note D#, 4
	note D_, 4
	note C#, 4
	note C_, 4
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 4
	note B_, 4
	note B_, 4
	loopchannel 2, Music_ChampionBattle_branch_eab98
	intensity $b0
	octave 3
	note D#, 16
	note B_, 16
	note A#, 16
	note G#, 16
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note C#, 4
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	octave 4
	note D_, 4
	intensity $b0
	note D#, 8
	note E_, 8
	note F#, 8
	note E_, 8
	note D#, 8
	note E_, 8
	note F#, 8
	note G#, 8
	loopchannel 0, Music_ChampionBattle_branch_eab46
; eabf8

Music_ChampionBattle_branch_eabf8: ; eabf8
	intensity $c2
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 6
	note D#, 2
	note D#, 2
	intensity $c7
	endchannel
; eac05

Music_ChampionBattle_branch_eac05: ; eac05
	intensity $c2
	octave 3
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note B_, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	note A#, 4
	intensity $c2
	note D#, 2
	note D#, 2
	intensity $c7
	endchannel
; eac22

Music_ChampionBattle_branch_eac22: ; eac22
	intensity $c1
	note D#, 2
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 4
	note D#, 2
	intensity $c5
	endchannel
; eac2e

Music_ChampionBattle_Ch3: ; eac2e
	notetype $c, $14
Music_ChampionBattle_branch_eac31: ; eac31
	octave 3
	note D#, 1
	note __, 7
	loopchannel 3, Music_ChampionBattle_branch_eac31
	note D#, 1
	note __, 3
	note E_, 4
	callchannel Music_ChampionBattle_branch_ead0a
	callchannel Music_ChampionBattle_branch_ead0a
	callchannel Music_ChampionBattle_branch_ead0a
	callchannel Music_ChampionBattle_branch_ead18
	note D_, 4
	callchannel Music_ChampionBattle_branch_ead18
	note A_, 4
	callchannel Music_ChampionBattle_branch_ead18
	note D_, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 4
	note C#, 4
	note D#, 8
	octave 3
	note D#, 8
	note B_, 4
	note G_, 2
	note B_, 2
	note F#, 2
	note A#, 2
	note F_, 2
	note A_, 2
Music_ChampionBattle_branch_eac6f: ; eac6f
	note D#, 2
	note A#, 2
	loopchannel 8, Music_ChampionBattle_branch_eac6f
Music_ChampionBattle_branch_eac75: ; eac75
	note E_, 2
	note B_, 2
	loopchannel 5, Music_ChampionBattle_branch_eac75
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note A_, 2
	note B_, 2
	note G_, 2
	note A_, 2
Music_ChampionBattle_branch_eac83: ; eac83
	note D#, 2
	note A#, 2
	loopchannel 8, Music_ChampionBattle_branch_eac83
Music_ChampionBattle_branch_eac89: ; eac89
	note E_, 2
	note B_, 2
	loopchannel 8, Music_ChampionBattle_branch_eac89
	callchannel Music_ChampionBattle_branch_ead2c
	octave 3
	note D#, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note D#, 2
	octave 4
	note D_, 2
	note C#, 2
	note C_, 2
	callchannel Music_ChampionBattle_branch_ead2c
	octave 3
	note D#, 2
	note A#, 2
	note D#, 2
	note A#, 2
	note D#, 2
	octave 4
	note D_, 2
	note C#, 2
	note C_, 2
	octave 3
	note A#, 8
	note D#, 8
	note B_, 8
	note D#, 8
Music_ChampionBattle_branch_eacae: ; eacae
	note D#, 2
	note F#, 2
	loopchannel 16, Music_ChampionBattle_branch_eacae
	callchannel Music_ChampionBattle_branch_ead37
	octave 3
	note E_, 2
	note B_, 2
	octave 4
	note D#, 2
	note E_, 2
	note F#, 2
	octave 3
	note B_, 2
	octave 4
	note D#, 2
	note E_, 2
	callchannel Music_ChampionBattle_branch_ead37
Music_ChampionBattle_branch_eacc6: ; eacc6
	octave 3
	note E_, 2
	note B_, 2
	loopchannel 4, Music_ChampionBattle_branch_eacc6
Music_ChampionBattle_branch_eaccd: ; eaccd
	note D#, 2
	note A#, 2
	loopchannel 5, Music_ChampionBattle_branch_eaccd
	note B_, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
Music_ChampionBattle_branch_eacdb: ; eacdb
	note E_, 2
	note B_, 2
	loopchannel 5, Music_ChampionBattle_branch_eacdb
	octave 4
	note C#, 2
	note E_, 2
	octave 3
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
Music_ChampionBattle_branch_eace9: ; eace9
	note D#, 2
	note G#, 2
	loopchannel 8, Music_ChampionBattle_branch_eace9
Music_ChampionBattle_branch_eacef: ; eacef
	note D#, 2
	note A#, 2
	loopchannel 7, Music_ChampionBattle_branch_eacef
	note B_, 2
	note A#, 2
Music_ChampionBattle_branch_eacf7: ; eacf7
	octave 3
	note D#, 2
	note A#, 2
	octave 4
	note D_, 2
	note D#, 2
	loopchannel 7, Music_ChampionBattle_branch_eacf7
	note C#, 2
	octave 3
	note B_, 2
	note A#, 2
	note G#, 2
	loopchannel 0, Music_ChampionBattle_branch_eac6f
; ead0a

Music_ChampionBattle_branch_ead0a: ; ead0a
	note D#, 1
	note __, 1
	note D#, 1
	note __, 5
	loopchannel 3, Music_ChampionBattle_branch_ead0a
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	endchannel
; ead18

Music_ChampionBattle_branch_ead18: ; ead18
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note B_, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 4
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	endchannel
; ead2c

Music_ChampionBattle_branch_ead2c: ; ead2c
	octave 3
	note D#, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D#, 2
	octave 4
	note D_, 2
	note C#, 2
	note C_, 2
	endchannel
; ead37

Music_ChampionBattle_branch_ead37: ; ead37
	octave 3
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	note E_, 2
	note B_, 2
	octave 4
	note D#, 2
	note E_, 2
	endchannel
; ead42


