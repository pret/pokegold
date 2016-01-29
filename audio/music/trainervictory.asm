Music_TrainerVictory: ; ebe9f
	dbw $80, Music_TrainerVictory_Ch1
	dbw $01, Music_TrainerVictory_Ch2
	dbw $02, Music_TrainerVictory_Ch3
; ebea8

Music_TrainerVictory_Ch1: ; ebea8
	tempo 120
	volume $77
	dutycycle $2
	tone $0001
	notetype $8, $b1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	intensity $b6
	note A_, 12
	stereopanning $f
Music_TrainerVictory_branch_ebec1: ; ebec1
	intensity $72
	callchannel Music_TrainerVictory_branch_ebf05
	intensity $51
	note C#, 2
	note E_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	intensity $72
	octave 3
	note A_, 2
	note __, 2
	octave 4
	note C#, 2
	note E_, 6
	loopchannel 2, Music_TrainerVictory_branch_ebec1
	callchannel Music_TrainerVictory_branch_ebf05
	note A_, 2
	note __, 2
	note F_, 2
	note A_, 6
	note A#, 2
	note __, 2
	note G_, 2
	note A#, 6
Music_TrainerVictory_branch_ebee6: ; ebee6
	intensity $72
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note A_, 2
	loopchannel 3, Music_TrainerVictory_branch_ebee6
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
Music_TrainerVictory_branch_ebef5: ; ebef5
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	loopchannel 3, Music_TrainerVictory_branch_ebef5
	note E_, 2
	note F#, 2
	note G_, 2
	loopchannel 0, Music_TrainerVictory_branch_ebec1
; ebf05

Music_TrainerVictory_branch_ebf05: ; ebf05
	octave 3
	note F#, 2
	note __, 2
	note D_, 2
	note F#, 6
	note G_, 2
	note __, 2
	note E_, 2
	note G_, 6
	endchannel
; ebf0f

Music_TrainerVictory_Ch2: ; ebf0f
	vibrato $12, $34
	dutycycle $3
	notetype $8, $d1
	octave 4
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note B_, 2
	octave 5
	note C#, 2
	intensity $d6
	note D_, 12
	stereopanning $f0
Music_TrainerVictory_branch_ebf24: ; ebf24
	notetype $8, $82
	callchannel Music_TrainerVictory_branch_ebf4a
	note F#, 2
	note __, 2
	note G_, 2
	note A_, 6
	note E_, 2
	note __, 2
	note F#, 2
	note G_, 6
	loopchannel 2, Music_TrainerVictory_branch_ebf24
	callchannel Music_TrainerVictory_branch_ebf4a
	note F_, 2
	note __, 2
	note C_, 2
	note F_, 6
	note G_, 2
	note __, 2
	note D_, 2
	note G_, 6
	notetype $c, $88
	note F#, 16
	note E_, 16
	loopchannel 0, Music_TrainerVictory_branch_ebf24
; ebf4a

Music_TrainerVictory_branch_ebf4a: ; ebf4a
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 6
	note E_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note E_, 6
	endchannel
; ebf58

Music_TrainerVictory_Ch3: ; ebf58
	notetype $8, $25
	octave 3
	note G_, 6
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 6
	note D_, 2
	note C#, 2
	octave 2
	note B_, 2
Music_TrainerVictory_branch_ebf68: ; ebf68
	callchannel Music_TrainerVictory_branch_ebfa5
	octave 3
	note C#, 2
	note __, 2
	note C#, 2
	note A_, 2
	note F#, 2
	note C#, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note A_, 1
	note __, 1
	note A_, 6
	loopchannel 2, Music_TrainerVictory_branch_ebf68
	callchannel Music_TrainerVictory_branch_ebfa5
	octave 3
	note C_, 2
	note __, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note C_, 2
	note D_, 2
	note __, 2
	note D_, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	note G_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 4
	note D_, 12
	octave 3
	note A_, 2
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note A_, 12
	note G_, 2
	note E_, 2
	note C#, 2
	loopchannel 0, Music_TrainerVictory_branch_ebf68
; ebfa5

Music_TrainerVictory_branch_ebfa5: ; ebfa5
	octave 2
	note A_, 2
	note __, 2
	note A_, 2
	octave 3
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	note B_, 2
	note __, 2
	note B_, 2
	octave 3
	note G_, 2
	note E_, 2
	octave 2
	note B_, 2
	endchannel
; ebfb7

