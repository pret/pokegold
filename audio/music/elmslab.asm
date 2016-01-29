Music_ElmsLab: ; e9fe9
	dbw $c0, Music_ElmsLab_Ch1
	dbw $01, Music_ElmsLab_Ch2
	dbw $02, Music_ElmsLab_Ch3
	dbw $03, Music_ElmsLab_Ch4
; e9ff5

Music_ElmsLab_Ch1: ; e9ff5
	tempo 144
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f0
	notetype $c, $b2
	octave 2
	note F_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	intensity $b6
	octave 3
	note C_, 8
	intensity $b2
	octave 2
	note A#, 2
	note A_, 2
	note G_, 2
	octave 3
	note C_, 8
	note F_, 4
	note F_, 4
	note F_, 8
	note A_, 4
	note A_, 4
	note A_, 2
Music_ElmsLab_branch_ea01e: ; ea01e
	note __, 2
	note A_, 2
	note G#, 2
	note A_, 2
	intensity $b7
	octave 4
	note C_, 4
	intensity $b5
	octave 3
	note B_, 2
	octave 4
	note C_, 2
	intensity $b4
	note F_, 8
	intensity $b5
	octave 3
	note A_, 2
	note G#, 2
	note A_, 2
	note F_, 2
	intensity $b7
	note F_, 8
	intensity $b5
	note A_, 2
	note G_, 2
	note F_, 2
	intensity $b2
	note G_, 4
	intensity $b5
	note A_, 2
	note G#, 2
	note A_, 2
	intensity $b7
	note F_, 4
	intensity $b5
	note C_, 4
	intensity $b7
	note D_, 8
	intensity $b4
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	intensity $b7
	note E_, 8
	intensity $b4
	note G_, 2
	note F_, 2
	note E_, 2
	note G_, 2
	intensity $b7
	note F_, 8
	intensity $b4
	note G_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	intensity $b2
	note G_, 4
	intensity $b4
	note F_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	intensity $b2
	note G_, 6
	intensity $b7
	note F_, 4
	octave 4
	note C_, 2
	octave 3
	note F_, 4
	note D_, 2
	note A#, 4
	note A_, 4
	intensity $b4
	note G_, 2
	note F_, 2
	note G_, 2
	intensity $b2
	note A_, 6
	intensity $b7
	note E_, 4
	note A#, 2
	note E_, 6
	intensity $b3
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note A_, 2
	note G_, 2
	intensity $b2
	note E_, 6
	intensity $b4
	note F_, 4
	octave 4
	note C_, 4
	octave 3
	note F_, 2
	octave 4
	note C_, 2
	note D_, 2
	note C_, 2
	octave 3
	note A#, 2
	note A_, 2
	intensity $b7
	note A#, 8
	octave 4
	note E_, 4
	note D_, 4
	note C_, 4
	octave 3
	note A#, 4
	octave 4
	note C_, 4
	note D_, 4
	note D#, 4
	note E_, 4
	intensity $b4
	octave 3
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 2
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 2
	note A_, 2
	note F_, 2
	octave 4
	note C_, 2
	octave 3
	note F_, 2
	note A_, 2
	intensity $b2
	note F_, 2
	note F_, 4
	loopchannel 0, Music_ElmsLab_branch_ea01e
; ea0d1

Music_ElmsLab_Ch2: ; ea0d1
	dutycycle $3
	vibrato $10, $26
	stereopanning $f
	notetype $c, $c3
	octave 4
	note F_, 2
	note E_, 2
	note D_, 2
	octave 3
	note B_, 2
	intensity $c5
	octave 4
	note C_, 8
	intensity $c3
	octave 3
	note A#, 2
	note A_, 2
	note G_, 2
	note E_, 2
	intensity $c2
	note F_, 6
	octave 4
	note C_, 4
	note C_, 4
	note C_, 8
	note C_, 4
	note C_, 4
	note C_, 2
	stereopanning $ff
Music_ElmsLab_branch_ea0f8: ; ea0f8
	intensity $c6
	octave 4
	note F_, 6
	intensity $c2
	note E_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	intensity $c7
	note A_, 6
	intensity $c2
	note F_, 2
	intensity $c7
	note C_, 8
	intensity $c7
	note D_, 6
	intensity $c3
	note C#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 2
	intensity $c7
	note F_, 6
	intensity $c3
	note C_, 2
	intensity $c7
	octave 3
	note A_, 10
	intensity $c3
	note A#, 2
	note A#, 2
	octave 4
	note D_, 2
	intensity $c5
	note C_, 4
	octave 3
	note A#, 6
	intensity $c3
	octave 4
	note C_, 2
	note C_, 2
	note E_, 2
	intensity $c4
	note D_, 4
	note C_, 6
	intensity $c2
	note D_, 2
	note D_, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	intensity $c2
	note G_, 4
	intensity $c6
	note C_, 4
	note D_, 4
	intensity $c4
	note E_, 6
	intensity $c3
	note F_, 2
	note F_, 2
	note G_, 2
	intensity $c7
	note A_, 4
	intensity $c3
	note G_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note G_, 1
	note F_, 2
	intensity $c7
	note D_, 11
	intensity $c3
	note E_, 2
	note E_, 2
	note F_, 2
	intensity $c7
	note G_, 4
	intensity $c3
	note F_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note F_, 1
	note D_, 2
	intensity $c7
	note C_, 11
	intensity $c4
	note F_, 2
	note F_, 2
	note G_, 2
	intensity $c7
	note A_, 4
	intensity $c4
	note G_, 2
	note F_, 2
	note A#, 2
	note A_, 2
	note A#, 1
	octave 5
	note C_, 2
	note D_, 5
	intensity $c3
	note E_, 2
	note D_, 2
	intensity $c7
	note C_, 4
	octave 4
	note A#, 4
	note A_, 4
	note G_, 4
	octave 5
	note C_, 4
	octave 4
	note A#, 4
	note A_, 4
	note G_, 4
	intensity $b0
	note F_, 8
	intensity $a0
	note F_, 8
	intensity $a7
	note F_, 10
	intensity $c2
	note C_, 2
	note F_, 2
	intensity $c4
	octave 3
	note E_, 2
	loopchannel 0, Music_ElmsLab_branch_ea0f8
; ea1a6

Music_ElmsLab_Ch3: ; ea1a6
	stereopanning $f
	notetype $c, $25
	note __, 8
	note __, 14
	octave 3
	note C_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note C_, 2
	note D_, 2
	note E_, 2
Music_ElmsLab_branch_ea1bf: ; ea1bf
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note D_, 2
	note A_, 2
	octave 2
	note A_, 2
	octave 3
	note A_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note A#, 2
	note D_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note D_, 2
	note A#, 2
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	octave 4
	note C_, 2
	octave 3
	note G_, 2
	octave 4
	note C_, 2
	octave 3
	note E_, 2
	note A_, 2
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note F_, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note F_, 2
	note B_, 2
	octave 4
	note C_, 2
	note __, 2
	note C_, 4
	octave 3
	note A#, 4
	note G_, 4
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note D_, 2
	note A#, 2
	note G_, 2
	note A#, 2
	note D_, 2
	note A_, 2
	note E_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note G_, 2
	note E_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note D_, 2
	note A#, 2
	note G_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note C_, 4
	note D_, 4
	note E_, 4
	note G_, 4
	note E_, 4
	note F_, 4
	note F#, 4
	note G_, 4
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note A_, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note A_, 2
	loopchannel 0, Music_ElmsLab_branch_ea1bf
; ea25a

Music_ElmsLab_Ch4: ; ea25a
	stereopanning $f0
	togglenoise $0
	notetype $c
	note __, 16
	note __, 2
Music_ElmsLab_branch_ea262: ; ea262
	note G_, 4
	loopchannel 0, Music_ElmsLab_branch_ea262
; ea267


