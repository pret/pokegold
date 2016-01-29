Music_JohtoGymBattle: ; ea4b6
	dbw $80, Music_JohtoGymBattle_Ch1
	dbw $01, Music_JohtoGymBattle_Ch2
	dbw $02, Music_JohtoGymBattle_Ch3
; ea4bf

Music_JohtoGymBattle_Ch1: ; ea4bf
	tempo 101
	volume $77
	dutycycle $3
	tone $0002
	vibrato $12, $15
	notetype $c, $b2
Music_JohtoGymBattle_branch_ea4cf: ; ea4cf
	octave 3
	note A#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea4cf
Music_JohtoGymBattle_branch_ea4d8: ; ea4d8
	note C#, 1
	note C_, 1
	octave 2
	note A#, 1
	octave 3
	note C_, 1
	loopchannel 3, Music_JohtoGymBattle_branch_ea4d8
	intensity $4b
	note C#, 4
	intensity $b2
	note D_, 6
	note D#, 6
	note C_, 4
	note F_, 6
	note D_, 6
	note D#, 4
	note D_, 6
	note D#, 6
	note C_, 4
	note F_, 6
	note G_, 6
	intensity $b7
	note C_, 4
	intensity $b2
	note G_, 6
	note G#, 6
	note F_, 4
	note G#, 6
	note F_, 6
	note G#, 4
	note G_, 6
	note G#, 6
	note F_, 4
	note G#, 6
	octave 4
	note C_, 6
	octave 3
	note G#, 2
	note F_, 2
Music_JohtoGymBattle_branch_ea506: ; ea506
	intensity $b5
	note D_, 6
	note G_, 6
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 4
	note F_, 4
	note G_, 4
	intensity $b7
	note G#, 12
	intensity $b2
	note G_, 4
	intensity $b7
	octave 4
	note C#, 12
	intensity $b2
	note C_, 4
	intensity $b5
	octave 3
	note D_, 6
	note G_, 6
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 4
	note F_, 4
	note G_, 4
	intensity $b7
	note G#, 8
	note G_, 8
	note F_, 8
	note D#, 8
	intensity $70
	note C_, 8
	intensity $77
	note C_, 8
	intensity $b4
	note D#, 2
	note E_, 2
	note F_, 6
	note G_, 2
	note D#, 4
	intensity $77
	octave 2
	note A#, 8
	note A#, 8
	intensity $c5
	octave 3
	note G_, 2
	note G#, 2
	note A#, 6
	note A#, 2
	note G#, 4
	intensity $c7
	note G_, 8
	note F_, 4
	note E_, 2
	note C#, 2
	intensity $a0
	note C_, 8
	intensity $a7
	note C_, 8
	intensity $b2
	note F_, 6
	note F_, 4
	note E_, 2
	note F_, 4
	note F_, 6
	note F_, 6
	note F_, 2
	note G#, 2
	note E_, 6
	note E_, 4
	note F_, 2
	note E_, 2
	note C#, 2
	note C_, 6
	note C_, 6
	note C_, 4
	note F_, 6
	note F_, 2
	note G#, 2
	note E_, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note C_, 4
	note F_, 6
	note E_, 2
	note G#, 2
	note E_, 2
	note G_, 4
	note E_, 4
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 6
	note G_, 4
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note C_, 2
	note C_, 6
	note C_, 6
	note C_, 4
	note C#, 6
	note C#, 6
	note C#, 4
	note D_, 6
	note D_, 6
	note D_, 4
	note D#, 6
	note D#, 6
	note D#, 4
	intensity $80
	note G_, 16
	intensity $90
	note G#, 16
	intensity $a0
	note A_, 8
	note A#, 2
	note A_, 2
	note G#, 2
	note A_, 2
	intensity $b0
	note A#, 8
	note B_, 2
	note A#, 2
	note A_, 2
	octave 4
	note C#, 2
	intensity $b7
	note C_, 8
	note C#, 4
	note C_, 4
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	note G#, 4
	note D#, 4
	note G#, 4
	note D#, 4
	note D#, 4
	octave 3
	note G#, 4
	octave 4
	note D#, 4
	octave 3
	note G#, 4
	note G#, 8
	note A_, 4
	note G#, 4
	note D#, 2
	note G#, 2
	note D#, 2
	octave 4
	note C#, 2
	octave 3
	note D#, 2
	note A_, 2
	note D#, 2
	note G_, 2
	octave 4
	note C#, 4
	octave 3
	note G#, 4
	octave 4
	note C#, 4
	octave 3
	note G#, 4
	note G#, 4
	note C#, 4
	note G#, 4
	note C#, 4
	note B_, 8
	note A_, 8
	note G#, 8
	note F#, 8
	intensity $b4
	note A_, 4
	octave 4
	note C#, 4
	octave 3
	note B_, 4
	octave 4
	note E_, 4
	intensity $92
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	intensity $b2
	note D#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	intensity $c2
	note D#, 16
	intensity $50
	octave 3
	note C_, 16
	note F_, 16
	note E_, 16
	intensity $97
	note D#, 10
	intensity $b4
	octave 2
	note A#, 2
	octave 3
	note D#, 2
	note F#, 2
	loopchannel 0, Music_JohtoGymBattle_branch_ea506
; ea608

Music_JohtoGymBattle_Ch2: ; ea608
	dutycycle $3
	vibrato $8, $36
	tone $0001
	notetype $c, $c2
Music_JohtoGymBattle_branch_ea613: ; ea613
	octave 4
	note F#, 1
	note F_, 1
	note E_, 1
	note A#, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea613
Music_JohtoGymBattle_branch_ea61c: ; ea61c
	note F#, 1
	note F_, 1
	note F#, 1
	note A#, 1
	loopchannel 4, Music_JohtoGymBattle_branch_ea61c
	note A_, 6
	octave 3
	note A#, 6
	note G_, 4
	octave 4
	note D_, 6
	octave 3
	note A_, 6
	note A#, 4
	note A_, 6
	note A#, 6
	note G_, 4
	octave 4
	note D_, 6
	note D#, 6
	intensity $b0
	octave 3
	note D#, 4
	intensity $c2
	octave 4
	note D_, 2
	intensity $92
	octave 3
	note D_, 2
	note D_, 2
	intensity $c2
	octave 4
	note D#, 4
	intensity $92
	octave 3
	note D_, 2
	intensity $c2
	octave 4
	note C_, 4
	note G_, 2
	notetype $c, $92
	octave 3
	note D_, 2
	note D_, 2
	intensity $c2
	octave 4
	note D_, 4
	intensity $92
	octave 3
	note D_, 2
	intensity $c2
	octave 4
	note D#, 2
	intensity $92
	octave 3
	note D#, 2
	intensity $c2
	octave 4
	note D_, 2
	intensity $92
	octave 3
	note D_, 2
	note D_, 2
	intensity $c2
	octave 4
	note D#, 4
	intensity $92
	octave 3
	note D_, 2
	intensity $c2
	octave 4
	note C_, 2
	intensity $92
	octave 3
	note D#, 2
	intensity $c2
	octave 4
	note G_, 2
	intensity $92
	octave 3
	note F_, 2
	note F_, 2
	intensity $c2
	octave 4
	note G#, 2
	intensity $92
	octave 3
	note F_, 2
	note F_, 2
	intensity $c2
	octave 4
	note F#, 2
	intensity $b2
	octave 3
	note G#, 1
	note A_, 1
Music_JohtoGymBattle_branch_ea697: ; ea697
	intensity $c7
	note A#, 8
	intensity $c4
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	intensity $c7
	note C#, 8
	intensity $c4
	note F_, 2
	note D#, 2
	note C#, 2
	note D#, 2
	intensity $b0
	note F_, 6
	intensity $b7
	note F_, 6
	intensity $c2
	note D#, 4
	intensity $b0
	note G#, 6
	intensity $b7
	note G#, 6
	intensity $c2
	note F_, 4
	intensity $c7
	octave 3
	note A#, 8
	intensity $c4
	octave 4
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	intensity $c7
	note C#, 8
	intensity $c4
	note F_, 2
	note D#, 2
	note C#, 2
	note D#, 2
	intensity $b0
	note C#, 16
	intensity $b7
	note C#, 16
	intensity $a4
	octave 3
	note F_, 6
	note D#, 6
	note F_, 4
	intensity $c6
	octave 4
	note C_, 6
	octave 3
	note A#, 6
	octave 4
	note C_, 4
	intensity $a4
	octave 3
	note C#, 6
	note C_, 6
	note C#, 4
	intensity $c6
	octave 4
	note C#, 6
	note C_, 6
	note C#, 4
	intensity $3c
	note C_, 10
	intensity $b7
	note C_, 6
	intensity $b0
	note E_, 8
	intensity $b7
	note E_, 8
	intensity $b0
	octave 3
	note C#, 16
	octave 2
	note A#, 8
	octave 3
	note C#, 6
	note D#, 2
	note C_, 16
	note E_, 16
	intensity $a0
	octave 5
	note C#, 4
	intensity $a7
	octave 5
	note C#, 12
	intensity $b7
	octave 4
	note A#, 8
	octave 5
	note C#, 6
	note D#, 2
	intensity $a0
	note C_, 8
	intensity $a7
	note C_, 8
	intensity $3e
	note E_, 6
	intensity $a6
	note E_, 10
	intensity $c2
	octave 3
	note F_, 6
	note F_, 6
	note F_, 4
	note F#, 6
	note F#, 6
	note F#, 4
	note G_, 6
	note G_, 6
	note G_, 4
	note G#, 6
	note G#, 6
	note G#, 4
	intensity $90
	octave 4
	note C_, 16
	intensity $a0
	note C#, 16
	intensity $b0
	note D_, 16
	intensity $b7
	note D#, 8
	intensity $4c
	note D#, 6
	intensity $c2
	note F#, 1
	note G_, 1
	intensity $c7
	note G#, 8
	note A_, 2
	note G#, 2
	note F#, 2
	note A_, 2
	note G#, 4
	octave 5
	note C_, 4
	octave 4
	note A_, 4
	note G#, 4
	octave 5
	note D#, 4
	octave 4
	note G#, 4
	octave 5
	note D#, 4
	octave 4
	note G#, 4
	octave 5
	note D#, 2
	note C#, 2
	note C_, 2
	note C#, 2
	note C_, 2
	octave 4
	note A_, 2
	note G#, 2
	note A_, 2
	note D#, 8
	note E_, 2
	note D#, 2
	note C#, 2
	note E_, 2
	note D#, 4
	note G#, 4
	note E_, 4
	note C#, 4
	note G#, 4
	note C#, 4
	note G#, 4
	note C#, 4
	note A_, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note D#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	note D#, 8
	note C#, 8
	octave 3
	note B_, 8
	note A_, 8
	octave 4
	note D#, 4
	note G#, 4
	note E_, 4
	note A_, 4
	intensity $c0
	note G#, 8
	intensity $c7
	note G#, 8
	intensity $c2
	note G#, 16
	intensity $80
	octave 3
	note F_, 16
	octave 4
	note C_, 16
	octave 3
	note B_, 16
	note G_, 16
	loopchannel 0, Music_JohtoGymBattle_branch_ea697
; ea79d

Music_JohtoGymBattle_Ch3: ; ea79d
	notetype $c, $19
	octave 4
	note F_, 1
	note __, 1
	octave 3
	note A_, 2
	octave 4
	note F_, 1
	note __, 1
	octave 3
	note G#, 2
	octave 4
	note F_, 1
	note __, 1
	octave 3
	note G_, 2
	octave 4
	note F_, 1
	note __, 1
	octave 3
	note F#, 2
	octave 4
	note G#, 1
	note __, 1
	octave 3
	note F_, 2
	octave 4
	note G#, 1
	note __, 1
	octave 3
	note E_, 2
	note F_, 2
	note G_, 2
	note G#, 4
	callchannel Music_JohtoGymBattle_branch_ea8fb
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note D#, 2
	note F#, 4
	callchannel Music_JohtoGymBattle_branch_ea8fb
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G#, 2
Music_JohtoGymBattle_branch_ea7e8: ; ea7e8
	callchannel Music_JohtoGymBattle_branch_ea90c
	callchannel Music_JohtoGymBattle_branch_ea90c
	callchannel Music_JohtoGymBattle_branch_ea913
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note A#, 2
	note A_, 2
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea90c
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea913
	callchannel Music_JohtoGymBattle_branch_ea913
	note C_, 2
	note G_, 2
	note A#, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note A#, 2
	callchannel Music_JohtoGymBattle_branch_ea91a
	callchannel Music_JohtoGymBattle_branch_ea913
	callchannel Music_JohtoGymBattle_branch_ea921
	octave 3
	note G_, 2
	note G#, 2
	note F_, 2
	callchannel Music_JohtoGymBattle_branch_ea91a
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note C_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea913
	callchannel Music_JohtoGymBattle_branch_ea921
	octave 3
	note C_, 2
	note C#, 2
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea91a
	note C_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea913
	callchannel Music_JohtoGymBattle_branch_ea921
	octave 3
	note F_, 2
	octave 2
	note A#, 2
	octave 3
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea91a
	note C_, 2
	note G_, 2
	note C_, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea92c
	note __, 2
	callchannel Music_JohtoGymBattle_branch_ea939
	octave 4
	note C#, 2
	callchannel Music_JohtoGymBattle_branch_ea945
	note __, 2
	note D#, 2
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	note A#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	octave 4
	note D#, 2
	callchannel Music_JohtoGymBattle_branch_ea92c
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea939
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea945
	note A_, 2
	octave 4
	note D#, 2
	octave 3
	note A#, 2
	note D#, 2
	octave 4
	note D#, 2
	octave 3
	note D#, 2
	octave 4
	note D#, 2
	note D_, 4
	callchannel Music_JohtoGymBattle_branch_ea952
	note D#, 2
	note G#, 2
	note D#, 2
	octave 4
	note C#, 2
	octave 3
	note D#, 2
	note A_, 2
	note D#, 2
	note G#, 2
	callchannel Music_JohtoGymBattle_branch_ea952
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	callchannel Music_JohtoGymBattle_branch_ea95a
	note C#, 2
	note F#, 2
	note C#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	note A_, 2
	note C#, 2
	note G_, 2
	callchannel Music_JohtoGymBattle_branch_ea95a
	note C#, 2
	note F#, 2
	note C#, 2
	note F#, 2
	note C#, 2
	note D#, 2
	note E_, 2
	note A_, 2
	callchannel Music_JohtoGymBattle_branch_ea952
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note D#, 2
	note G#, 2
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note D#, 2
	note G#, 2
	note D#, 2
	note A_, 2
	note D#, 2
	note B_, 2
	note D#, 2
	octave 4
	note C#, 2
	octave 3
	note G#, 2
	note D#, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note G#, 2
	note D#, 2
	note F#, 2
	note G#, 2
	note F#, 2
	note F#, 2
	note E_, 2
	note F#, 2
	callchannel Music_JohtoGymBattle_branch_ea961
	note F_, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note D#, 2
	note C#, 2
	note D#, 2
	callchannel Music_JohtoGymBattle_branch_ea961
	note F_, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	loopchannel 0, Music_JohtoGymBattle_branch_ea7e8
; ea8fb

Music_JohtoGymBattle_branch_ea8fb: ; ea8fb
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note F_, 2
	note D#, 2
	note F_, 2
	endchannel
; ea90c

Music_JohtoGymBattle_branch_ea90c: ; ea90c
	note D_, 2
	note G_, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea90c
	endchannel
; ea913

Music_JohtoGymBattle_branch_ea913: ; ea913
	note C#, 2
	note G#, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea913
	endchannel
; ea91a

Music_JohtoGymBattle_branch_ea91a: ; ea91a
	note C_, 2
	note G_, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea91a
	endchannel
; ea921

Music_JohtoGymBattle_branch_ea921: ; ea921
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
	endchannel
; ea92c

Music_JohtoGymBattle_branch_ea92c: ; ea92c
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note C_, 2
	endchannel
; ea939

Music_JohtoGymBattle_branch_ea939: ; ea939
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	note G#, 2
	octave 4
	note C#, 2
	octave 3
	note C#, 2
	endchannel
; ea945

Music_JohtoGymBattle_branch_ea945: ; ea945
	octave 3
	note D_, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note D_, 2
	endchannel
; ea952

Music_JohtoGymBattle_branch_ea952: ; ea952
	octave 3
	note D#, 2
	note G#, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea952
	endchannel
; ea95a

Music_JohtoGymBattle_branch_ea95a: ; ea95a
	note C#, 2
	note F#, 2
	loopchannel 4, Music_JohtoGymBattle_branch_ea95a
	endchannel
; ea961

Music_JohtoGymBattle_branch_ea961: ; ea961
	note F_, 2
	note C_, 2
	note D#, 2
	note F_, 2
	note F#, 2
	note F#, 2
	note F_, 2
	note D#, 2
	endchannel
; ea96a


