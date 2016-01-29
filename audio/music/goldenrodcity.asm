Music_GoldenrodCity: ; eb3fc
	dbw $c0, Music_GoldenrodCity_Ch1
	dbw $01, Music_GoldenrodCity_Ch2
	dbw $02, Music_GoldenrodCity_Ch3
	dbw $03, Music_GoldenrodCity_Ch4
; eb408

Music_GoldenrodCity_Ch1: ; eb408
	stereopanning $f
	tempo 176
	volume $77
	notetype $c, $97
	note __, 16
	note __, 16
	note __, 16
	note __, 16
Music_GoldenrodCity_branch_eb416: ; eb416
	dutycycle $0
	callchannel Music_GoldenrodCity_branch_eb452
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note G#, 1
	octave 5
	note C_, 1
	intensity $71
	dutycycle $0
	callchannel Music_GoldenrodCity_branch_eb47a
	intensity $77
	note D#, 2
	note F_, 2
	note F#, 2
	note G#, 4
	intensity $71
	callchannel Music_GoldenrodCity_branch_eb47a
	note D#, 1
	note F#, 1
	intensity $77
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note F#, 2
	note D#, 2
	dutycycle $2
	intensity $97
	callchannel Music_GoldenrodCity_branch_eb452
	note C_, 4
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	loopchannel 0, Music_GoldenrodCity_branch_eb416
; eb452

Music_GoldenrodCity_branch_eb452: ; eb452
	octave 4
	note C#, 2
	octave 3
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	note A#, 2
	note F_, 1
	note __, 1
	note C#, 2
	note F_, 1
	note __, 1
	note D#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note F#, 2
	note C#, 1
	note __, 3
	note C#, 1
	note __, 1
	note F#, 2
	note C#, 1
	note __, 1
	note F#, 2
	note A#, 2
	note C#, 2
	note D#, 2
	note G#, 2
	octave 4
	note C#, 2
	endchannel
; eb47a

Music_GoldenrodCity_branch_eb47a: ; eb47a
	octave 4
	note F_, 1
	note C#, 1
	octave 3
	note G#, 1
	octave 4
	note C#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note C#, 1
	octave 3
	note G#, 1
	note F_, 1
	note G#, 1
	octave 4
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	note C_, 1
	octave 3
	note G#, 1
	note F#, 1
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note C#, 1
	octave 3
	note A#, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	octave 3
	note A#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note A#, 1
	octave 4
	note C#, 1
	octave 3
	note A#, 1
	octave 4
	note C#, 1
	note D#, 1
	note C_, 1
	octave 3
	note G#, 1
	octave 4
	note C_, 1
	note D#, 1
	note F#, 1
	endchannel
; eb4c2

Music_GoldenrodCity_Ch2: ; eb4c2
	stereopanning $f0
	vibrato $12, $23
	dutycycle $2
	notetype $c, $97
Music_GoldenrodCity_branch_eb4cc: ; eb4cc
	intensity $97
	callchannel Music_GoldenrodCity_branch_eb4fe
	octave 4
	note F_, 2
	note F#, 2
	note G#, 2
	note F_, 2
	note D#, 8
	callchannel Music_GoldenrodCity_branch_eb4fe
	note G#, 2
	note A#, 2
	octave 5
	note C_, 2
	note C#, 2
	note D#, 8
	dutycycle $2
	intensity $77
	callchannel Music_GoldenrodCity_branch_eb51b
	octave 4
	note G#, 2
	note A#, 2
	note B_, 2
	octave 5
	note C_, 4
	dutycycle $3
	intensity $77
	callchannel Music_GoldenrodCity_branch_eb51b
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 4
	note G#, 2
	loopchannel 0, Music_GoldenrodCity_branch_eb4cc
; eb4fe

Music_GoldenrodCity_branch_eb4fe: ; eb4fe
	octave 4
	note F_, 4
	note C#, 4
	note D#, 4
	note C_, 4
	note C#, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 6
	octave 3
	note G#, 1
	octave 3
	note A_, 1
	note A#, 4
	octave 4
	note C#, 4
	octave 3
	note A#, 2
	octave 4
	note A#, 2
	note G#, 2
	note F#, 2
	dutycycle $1
	endchannel
; eb51b

Music_GoldenrodCity_branch_eb51b: ; eb51b
	note C#, 6
	note F_, 6
	note C#, 4
	note C_, 6
	note D#, 6
	note C_, 2
	octave 4
	note G#, 1
	note A_, 1
	note A#, 6
	octave 5
	note C#, 6
	octave 4
	note A#, 4
	octave 5
	note C_, 4
	note D#, 2
	endchannel
; eb52d

Music_GoldenrodCity_Ch3: ; eb52d
	stereopanning $ff
	vibrato $8, $23
	notetype $c, $25
Music_GoldenrodCity_branch_eb535: ; eb535
	callchannel Music_GoldenrodCity_branch_eb553
	callchannel Music_GoldenrodCity_branch_eb553
	callchannel Music_GoldenrodCity_branch_eb57b
	note __, 3
	octave 3
	note C_, 1
	note D#, 1
	note G_, 1
	note G#, 1
	note D#, 2
	callchannel Music_GoldenrodCity_branch_eb57b
	note __, 1
	octave 3
	note G#, 2
	note F#, 2
	note D#, 2
	octave 2
	note G#, 2
	loopchannel 0, Music_GoldenrodCity_branch_eb535
; eb553

Music_GoldenrodCity_branch_eb553: ; eb553
	octave 3
	note C#, 4
	note __, 2
	note C#, 1
	note __, 1
	note C_, 4
	note __, 2
	note C_, 1
	note __, 1
	octave 2
	note A#, 4
	note __, 2
	note A#, 1
	note __, 1
	note G#, 4
	note __, 2
	note G#, 1
	note __, 1
	note F#, 4
	note __, 2
	note F#, 1
	note __, 1
	octave 3
	note D#, 4
	note __, 2
	note D#, 1
	note __, 1
	note G#, 4
	note __, 2
	note G#, 1
	note __, 1
	octave 2
	note G#, 1
	note __, 1
	note G#, 3
	note __, 1
	octave 3
	note G#, 1
	note __, 1
	endchannel
; eb57b

Music_GoldenrodCity_branch_eb57b: ; eb57b
	note C#, 1
	note __, 1
	octave 4
	note C#, 1
	octave 3
	note C#, 1
	note __, 2
	note C#, 1
	note __, 5
	octave 4
	note C_, 1
	note C#, 1
	octave 3
	note G#, 2
	note C_, 1
	note __, 1
	octave 4
	note C_, 1
	octave 3
	note C_, 1
	note __, 2
	note C_, 1
	note __, 5
	note B_, 1
	octave 4
	note C_, 1
	octave 3
	note G#, 2
	octave 2
	note A#, 1
	note __, 1
	octave 3
	note A#, 1
	octave 2
	note A#, 1
	note __, 2
	note A#, 1
	note __, 5
	octave 3
	note A_, 1
	note A#, 1
	note F#, 2
	octave 2
	note G#, 1
	note __, 1
	octave 3
	note G#, 1
	octave 2
	note G#, 1
	note __, 2
	note G#, 1
	endchannel
; eb5af

Music_GoldenrodCity_Ch4: ; eb5af
	togglenoise $3
	notetype $c
	note __, 16
	note __, 16
	note __, 16
	note __, 8
	note D_, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note F#, 2
Music_GoldenrodCity_branch_eb5bc: ; eb5bc
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 3, Music_GoldenrodCity_branch_eb5bc
	callchannel Music_GoldenrodCity_branch_eb60c
	callchannel Music_GoldenrodCity_branch_eb616
	note G_, 1
	note G_, 1
	note F#, 2
	callchannel Music_GoldenrodCity_branch_eb616
	note D_, 2
	note F#, 2
	callchannel Music_GoldenrodCity_branch_eb616
	note D_, 1
	note D_, 1
	note F#, 2
	callchannel Music_GoldenrodCity_branch_eb616
	note D_, 2
	note D_, 1
	note D_, 1
	callchannel Music_GoldenrodCity_branch_eb616
	note G_, 1
	note G_, 1
	note F#, 2
	callchannel Music_GoldenrodCity_branch_eb616
	note D_, 2
	note F#, 2
	callchannel Music_GoldenrodCity_branch_eb616
	note D_, 1
	note D_, 1
	note F#, 2
	callchannel Music_GoldenrodCity_branch_eb616
	note D_, 2
	note D_, 1
	note D_, 1
Music_GoldenrodCity_branch_eb5f9: ; eb5f9
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	loopchannel 3, Music_GoldenrodCity_branch_eb5f9
	callchannel Music_GoldenrodCity_branch_eb60c
	loopchannel 0, Music_GoldenrodCity_branch_eb5bc
; eb60c

Music_GoldenrodCity_branch_eb60c: ; eb60c
	note D#, 2
	note F#, 2
	note D_, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note D_, 1
	note D_, 1
	note F#, 2
	endchannel
; eb616

Music_GoldenrodCity_branch_eb616: ; eb616
	note D#, 2
	note D_, 1
	note D#, 3
	note D#, 2
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	endchannel
; eb61f


