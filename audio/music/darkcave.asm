Music_DarkCave: ; ea267
	dbw $c0, Music_DarkCave_Ch1
	dbw $01, Music_DarkCave_Ch2
	dbw $02, Music_DarkCave_Ch3
	dbw $03, Music_DarkCave_Ch4
; ea273

Music_DarkCave_Ch1: ; ea273
	tempo 128
	volume $77
	dutycycle $3
	tone $0001
	vibrato $11, $15
	stereopanning $f0
	notetype $c, $a7
Music_DarkCave_branch_ea285: ; ea285
	note __, 16
	loopchannel 4, Music_DarkCave_branch_ea285
	octave 3
	note D#, 16
	note D_, 16
	note C#, 16
	note C_, 16
	intensity $a3
Music_DarkCave_branch_ea291: ; ea291
	callchannel Music_DarkCave_branch_ea2dc
	loopchannel 3, Music_DarkCave_branch_ea291
	intensity $b7
	note G#, 8
	note D#, 8
	note G_, 8
	note D_, 8
	note F_, 8
	note C#, 8
	note D#, 8
	note G_, 8
	note G#, 8
	note D#, 8
	note G_, 8
	note D_, 8
	note F_, 8
	note C#, 8
	note D#, 8
	note C_, 8
	intensity $a3
Music_DarkCave_branch_ea2ac: ; ea2ac
	callchannel Music_DarkCave_branch_ea2dc
	loopchannel 2, Music_DarkCave_branch_ea2ac
	note __, 16
	note __, 8
	intensity $b7
	octave 2
	note F_, 2
	note G_, 2
	note G#, 4
	octave 3
	note D#, 16
	note __, 8
	octave 2
	note G#, 2
	note G_, 2
	note G#, 4
	octave 3
	note D#, 16
	note G_, 2
	note __, 6
	note F_, 2
	note G_, 2
	note G#, 4
	note G_, 16
	note F_, 2
	note __, 6
	note G#, 2
	note G_, 2
	note G#, 4
	intensity $a3
Music_DarkCave_branch_ea2d1: ; ea2d1
	callchannel Music_DarkCave_branch_ea2dc
	loopchannel 2, Music_DarkCave_branch_ea2d1
	loopchannel 0, Music_DarkCave_branch_ea291
; ea2dc

Music_DarkCave_branch_ea2dc: ; ea2dc
	octave 4
	note D#, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note F_, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	note A#, 2
	octave 4
	note C_, 2
	octave 3
	note A#, 2
	endchannel
; ea313

Music_DarkCave_Ch2: ; ea313
	dutycycle $1
	vibrato $12, $36
	stereopanning $f
	notetype $c, $a7
Music_DarkCave_branch_ea31d: ; ea31d
	note __, 16
	loopchannel 4, Music_DarkCave_branch_ea31d
	octave 3
	note G_, 16
	note A#, 16
	note F_, 16
	note G_, 16
Music_DarkCave_branch_ea327: ; ea327
	note __, 16
	loopchannel 4, Music_DarkCave_branch_ea327
	note __, 8
	stereopanning $ff
	intensity $c7
	octave 5
	note C_, 8
	intensity $c4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 4
	note A#, 2
	octave 5
	note D_, 4
	intensity $b0
	note C#, 4
	intensity $b7
	note C#, 12
	intensity $59
	note C_, 8
	intensity $c7
	note C_, 8
	note __, 8
	intensity $c7
	note C_, 8
	intensity $c4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	octave 5
	note D_, 4
	intensity $c7
	note C#, 12
	intensity $c3
	note C_, 2
	note C#, 2
	intensity $b0
	note D#, 10
	intensity $b7
	note D#, 6
	stereopanning $f
	intensity $c4
	octave 4
	note F_, 4
	note D#, 2
	note D_, 2
	note D#, 4
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 8
	octave 3
	note A#, 8
	intensity $b0
	octave 4
	note D#, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 8
	note F_, 4
	note D#, 2
	note D_, 2
	note D#, 4
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note D_, 4
	note C_, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 4
	note C_, 2
	note C#, 2
	note C_, 2
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	intensity $b0
	note C_, 8
	intensity $b7
	note C_, 8
	intensity $c7
	stereopanning $ff
	note __, 8
	octave 5
	note C_, 8
	intensity $c4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 4
	note A#, 2
	octave 5
	note D_, 4
	intensity $49
	note C#, 8
	intensity $c7
	note C#, 8
	intensity $b0
	note C_, 8
	intensity $b7
	note C_, 8
	note __, 8
	intensity $c7
	note C_, 8
	intensity $c4
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note G_, 2
	note G_, 2
	note A#, 2
	octave 5
	note D_, 4
	intensity $b0
	note C#, 8
	intensity $b7
	note C#, 8
	intensity $b0
	note C_, 8
	intensity $b7
	note C_, 8
	intensity $c7
	note __, 16
	stereopanning $f
	note __, 8
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 4
	note C_, 16
	note __, 8
	note C#, 2
	note C_, 2
	note C#, 4
	note C_, 16
	intensity $c2
	note D#, 8
	intensity $c7
	octave 3
	note A#, 2
	octave 4
	note C_, 2
	note C#, 4
	note C_, 16
	intensity $c2
	octave 3
	note A#, 8
	intensity $c7
	octave 4
	note C#, 2
	note C_, 2
	intensity $c4
	note C#, 16
	note __, 4
	note __, 16
	note __, 16
	note __, 16
	intensity $b7
	octave 5
	note D#, 16
	note D_, 16
	note F_, 16
	note D#, 16
	loopchannel 0, Music_DarkCave_branch_ea327
; ea417

Music_DarkCave_Ch3: ; ea417
	notetype $c, $27
Music_DarkCave_branch_ea41a: ; ea41a
	callchannel Music_DarkCave_branch_ea477
	loopchannel 2, Music_DarkCave_branch_ea41a
Music_DarkCave_branch_ea421: ; ea421
	callchannel Music_DarkCave_branch_ea477
	loopchannel 7, Music_DarkCave_branch_ea421
	callchannel Music_DarkCave_branch_ea46c
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	note __, 2
	octave 2
	note A#, 12
	callchannel Music_DarkCave_branch_ea46c
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	note __, 2
	octave 2
	note A#, 4
	octave 3
	note C#, 2
	note C_, 2
	note C#, 4
	callchannel Music_DarkCave_branch_ea450
	callchannel Music_DarkCave_branch_ea450
	loopchannel 0, Music_DarkCave_branch_ea421
; ea450

Music_DarkCave_branch_ea450: ; ea450
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note F_, 4
	note D#, 2
	note __, 2
	octave 2
	note A#, 4
	note A#, 2
	octave 3
	note C_, 2
	note C#, 4
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	note __, 2
	octave 2
	note A#, 4
	octave 3
	note C#, 2
	note C_, 2
	note C#, 4
	endchannel
; ea46c

Music_DarkCave_branch_ea46c: ; ea46c
	octave 3
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note F_, 4
	note D#, 2
	note __, 2
	octave 2
	note A#, 12
	endchannel
; ea477

Music_DarkCave_branch_ea477: ; ea477
	octave 2
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note F_, 4
	note D#, 2
	note __, 2
	octave 1
	note A#, 4
	note A#, 2
	octave 2
	note C_, 2
	note C#, 4
	note C_, 4
	note G_, 2
	note D#, 4
	note G_, 2
	note D#, 4
	note F_, 2
	note __, 2
	octave 1
	note A#, 4
	octave 2
	note C#, 2
	note C_, 2
	note C#, 4
	endchannel
; ea493

Music_DarkCave_Ch4: ; ea493
	togglenoise $3
	notetype $c
Music_DarkCave_branch_ea497: ; ea497
	stereopanning $ff
	note D#, 8
	note D#, 8
	note D#, 4
	stereopanning $f0
	note C#, 4
	stereopanning $f
	note C#, 2
	note C#, 2
	stereopanning $f0
	note C#, 4
	stereopanning $ff
	note D#, 8
	note D#, 8
	note D#, 4
	stereopanning $f
	note C#, 8
	stereopanning $f0
	note C#, 2
	note C#, 2
	loopchannel 0, Music_DarkCave_branch_ea497
; ea4b6


