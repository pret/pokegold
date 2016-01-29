Music_SSAqua: ; ead42
	dbw $c0, Music_SSAqua_Ch1
	dbw $01, Music_SSAqua_Ch2
	dbw $02, Music_SSAqua_Ch3
	dbw $03, Music_SSAqua_Ch4
; ead4e

Music_SSAqua_Ch1: ; ead4e
	tempo 117
	volume $77
	stereopanning $f
	tone $0001
	vibrato $12, $33
	dutycycle $2
	notetype $6, $97
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
Music_SSAqua_branch_ead65: ; ead65
	octave 2
	note G_, 16
	note __, 8
	note G_, 2
	note __, 2
	notetype $c, $97
	note G_, 2
	note G_, 10
	note __, 4
	notetype $6, $97
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 16
	note __, 8
	note G_, 2
	note __, 2
	notetype $c, $97
	note G_, 2
	note G_, 8
	note __, 8
	dutycycle $1
	intensity $61
	callchannel Music_SSAqua_branch_eaf9e
	octave 5
	note G_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	callchannel Music_SSAqua_branch_eaf9e
	callchannel Music_SSAqua_branch_eafe7
	note __, 16
	note __, 16
	note __, 16
	intensity $97
	note __, 14
	notetype $6, $97
	note D_, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	notetype $c, $97
	note __, 16
	note __, 16
	intensity $95
	note __, 2
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	note __, 1
	note E_, 1
	note C_, 1
	octave 3
	note E_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	octave 4
	note C_, 1
	note E_, 1
	note G_, 1
	octave 5
	note C_, 1
	octave 4
	note E_, 6
	note D_, 2
	note C_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 5
	note C_, 1
	note D_, 1
	octave 4
	note G_, 1
	note F#, 1
	dutycycle $2
	intensity $97
	note G_, 8
	note F#, 8
	note E_, 8
	note D_, 8
	octave 3
	note B_, 8
	note A#, 2
	note __, 2
	note B_, 1
	note __, 1
	octave 4
	note F#, 2
	intensity $75
	octave 5
	note A_, 4
	note F#, 4
	note D_, 4
	octave 4
	note A#, 2
	notetype $6, $97
	note D_, 1
	note __, 1
	octave 3
	note A#, 1
	note __, 1
	intensity $97
	note G_, 16
	note A_, 16
	note B_, 4
	note __, 4
	note B_, 4
	note __, 4
	octave 4
	note E_, 8
	note G_, 8
	note F#, 1
	vibrato $0, $0
	intensity $88
	note G_, 10
	vibrato $2, $23
	intensity $87
	note G_, 9
	vibrato $8, $33
	note C_, 4
	note E_, 4
	note C_, 4
	note D_, 12
	note F#, 12
	note __, 8
	octave 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 2
	note A_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
	note F#, 2
	notetype $c, $97
	note __, 7
	note __, 16
	note __, 16
	note G_, 8
	note F#, 1
	note D_, 1
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	octave 3
	note A_, 1
	note F#, 1
	note D_, 1
	octave 2
	note A_, 1
	note B_, 1
	octave 3
	note D_, 1
	note F#, 1
	note A_, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 4
	note D_, 1
	note F#, 1
	note __, 7
	note __, 16
	note __, 2
	note E_, 2
	note G_, 1
	note __, 1
	note E_, 1
	notetype $6, $97
	note __, 1
	note C_, 1
	note C#, 4
	octave 3
	note B_, 2
	note __, 2
	note A_, 3
	note __, 1
	note G_, 2
	note __, 2
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note A_, 2
	note F#, 2
	note D_, 2
	note A_, 2
	octave 4
	note D_, 2
	octave 3
	note A_, 2
	note F#, 2
	note A_, 2
	octave 4
	note C_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	loopchannel 0, Music_SSAqua_branch_ead65
; eae73

Music_SSAqua_Ch2: ; eae73
	stereopanning $f0
	dutycycle $2
	vibrato $8, $33
	notetype $c, $b7
	note __, 2
Music_SSAqua_branch_eae7e: ; eae7e
	notetype $c, $b7
	dutycycle $1
	intensity $61
	callchannel Music_SSAqua_branch_eaf9e
	callchannel Music_SSAqua_branch_eafe7
	dutycycle $2
	intensity $d7
	callchannel Music_SSAqua_branch_eaf89
	note B_, 1
	note __, 1
	note G_, 1
	note __, 3
	octave 3
	note G_, 6
	note G_, 1
	note B_, 1
	octave 4
	note C#, 1
	note E_, 1
	forceoctave $c
	callchannel Music_SSAqua_branch_eaf89
	forceoctave $0
	octave 3
	note B_, 1
	note __, 1
	note G_, 1
	note __, 3
	octave 4
	note G_, 6
	note __, 2
	dutycycle $3
	intensity $b7
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	callchannel Music_SSAqua_branch_eaf31
	note G_, 4
	note __, 4
	note G_, 8
	note A_, 8
	note B_, 8
	notetype $c, $b7
	octave 5
	note C_, 10
	note D_, 2
	note C_, 2
	octave 4
	note G_, 2
	note B_, 6
	note A_, 6
	note __, 2
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	callchannel Music_SSAqua_branch_eaf31
	note G_, 4
	note __, 4
	note G_, 8
	note A_, 8
	note B_, 8
	octave 5
	note D#, 1
	vibrato $0, $0
	intensity $98
	note E_, 10
	vibrato $4, $23
	intensity $97
	note E_, 9
	vibrato $8, $23
	note D_, 4
	note C_, 4
	octave 4
	note G_, 4
	note B_, 12
	note A_, 12
	note __, 4
	dutycycle $0
	note B_, 2
	note A_, 2
	callchannel Music_SSAqua_branch_eaf7e
	notetype $6, $b7
	note G#, 1
	note A_, 11
	note G_, 2
	note F#, 2
	note G_, 12
	note __, 4
	note __, 4
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note G_, 2
	note __, 2
	note A_, 2
	note __, 2
	note E_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 2
	note __, 2
	note A_, 16
	note A#, 12
	note B_, 2
	note A_, 2
	callchannel Music_SSAqua_branch_eaf7e
	notetype $6, $b7
	note G#, 1
	note A_, 11
	note B_, 4
	note G_, 12
	note __, 4
	note __, 4
	octave 5
	note C_, 4
	note D_, 2
	note __, 2
	note C_, 2
	note __, 1
	octave 4
	note A#, 1
	note B_, 4
	note A_, 2
	note __, 2
	note G_, 4
	note E_, 2
	note __, 2
	note F#, 8
	note G_, 8
	note A_, 8
	note __, 8
	loopchannel 0, Music_SSAqua_branch_eae7e
; eaf31

Music_SSAqua_branch_eaf31: ; eaf31
	note D_, 6
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D_, 2
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D_, 2
	octave 3
	note B_, 1
	octave 4
	note C_, 1
	note D_, 2
	note __, 2
	note G_, 2
	note __, 2
	note A_, 2
	note __, 2
	note A#, 2
	note __, 2
	note B_, 6
	note F#, 6
	note __, 4
	dutycycle $1
	notetype $6, $b7
	octave 3
	note A_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note D_, 1
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
	note D_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A#, 1
	note __, 1
	note F#, 1
	note __, 1
	dutycycle $3
	note E_, 2
	note F#, 2
	note G_, 12
	note E_, 2
	note F#, 2
	note G_, 4
	note E_, 2
	note F#, 2
	note G_, 4
	note E_, 2
	note F#, 2
	endchannel
; eaf7e

Music_SSAqua_branch_eaf7e: ; eaf7e
	notetype $c, $b7
	note B_, 10
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	note F#, 1
	note __, 1
	endchannel
; eaf89

Music_SSAqua_branch_eaf89: ; eaf89
	octave 3
	note D_, 10
	note E_, 1
	note __, 3
	note D_, 1
	note __, 1
	note C#, 12
	octave 2
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 3
	note C_, 8
	note __, 2
	octave 2
	note B_, 1
	note __, 3
	note A_, 1
	note __, 1
	endchannel
; eaf9e

Music_SSAqua_branch_eaf9e: ; eaf9e
	octave 5
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	octave 5
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	octave 5
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	octave 5
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	octave 5
	note G_, 1
	note C#, 1
	octave 4
	note A#, 1
	note G_, 1
	octave 5
	note G_, 1
	note C#, 1
	octave 4
	note A#, 1
	note G_, 1
	octave 5
	note G_, 1
	note C#, 1
	octave 4
	note A#, 1
	note G_, 1
	octave 5
	note G_, 1
	note C#, 1
	octave 4
	note A#, 1
	note G_, 1
	octave 5
	note G_, 1
	note C_, 1
	octave 4
	note A_, 1
	note G_, 1
	octave 5
	note G_, 1
	note C_, 1
	octave 4
	note A_, 1
	note G_, 1
	octave 5
	note G_, 1
	note C_, 1
	octave 4
	note A_, 1
	note G_, 1
	octave 5
	note G_, 1
	note C_, 1
	octave 4
	note A_, 1
	note G_, 1
	endchannel
; eafe7

Music_SSAqua_branch_eafe7: ; eafe7
	octave 5
	note G_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	octave 5
	note G_, 1
	octave 4
	note B_, 1
	note A_, 1
	note G_, 1
	octave 5
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note C#, 1
	octave 3
	note G_, 1
	endchannel
; eafff

Music_SSAqua_Ch3: ; eafff
	stereopanning $ff
	vibrato $8, $34
	notetype $6, $15
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
Music_SSAqua_branch_eb00c: ; eb00c
	note G_, 16
	note __, 8
	note G_, 2
	note __, 2
	notetype $c, $15
	note G_, 2
	note G_, 10
	note __, 4
	notetype $6, $15
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 16
	note __, 8
	note G_, 2
	note __, 2
	notetype $c, $15
	note G_, 2
	note G_, 8
	note B_, 1
	octave 3
	note C#, 1
	note D_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note B_, 1
	octave 4
	note E_, 1
	callchannel Music_SSAqua_branch_eb0f6
	callchannel Music_SSAqua_branch_eb0f6
Music_SSAqua_branch_eb036: ; eb036
	note G_, 2
	note __, 2
	octave 3
	note G_, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 2
	octave 3
	note G_, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 2
	octave 3
	note G_, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 2
	octave 3
	note G_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	loopchannel 4, Music_SSAqua_branch_eb036
	callchannel Music_SSAqua_branch_eb11b
	callchannel Music_SSAqua_branch_eb11b
	callchannel Music_SSAqua_branch_eb1d9
	octave 3
	note E_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 3
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note D_, 1
	note __, 3
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note C_, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note C_, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note C#, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note C#, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	callchannel Music_SSAqua_branch_eb1d9
	octave 3
	note E_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 3
	octave 3
	note E_, 2
	note __, 2
	octave 4
	note D#, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note C#, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note C#, 1
	note __, 3
	octave 3
	note C_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note C_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note C#, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note C#, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	loopchannel 0, Music_SSAqua_branch_eb00c
; eb0f6

Music_SSAqua_branch_eb0f6: ; eb0f6
	notetype $6, $15
	octave 2
	note G_, 2
	note __, 6
	note G_, 2
	note __, 6
	note G_, 2
	note __, 2
	octave 3
	note G_, 2
	note __, 2
	octave 2
	note G_, 2
	note __, 4
	note G_, 1
	note __, 1
	note G_, 2
	note __, 6
	note G_, 2
	note __, 2
	octave 3
	note G_, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 2
	octave 3
	note G_, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 4
	note G_, 1
	note __, 1
	endchannel
; eb11b

Music_SSAqua_branch_eb11b: ; eb11b
	octave 2
	note G_, 2
	note __, 2
	octave 4
	note D_, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 2
	octave 4
	note D_, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 1
	octave 2
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	octave 2
	note G_, 2
	note __, 2
	octave 4
	note G_, 4
	note F#, 4
	note E_, 2
	note __, 2
	octave 2
	note B_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	octave 2
	note B_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	octave 2
	note A#, 2
	note __, 2
	octave 3
	note A#, 1
	note __, 3
	octave 2
	note A#, 2
	note __, 2
	octave 3
	note A#, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note A_, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note A_, 1
	note __, 3
	octave 2
	note A#, 2
	note __, 2
	octave 3
	note A#, 1
	note __, 3
	octave 2
	note A#, 2
	note __, 2
	octave 3
	note A#, 1
	note __, 1
	note D#, 1
	note __, 1
	note E_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 3
	octave 3
	note E_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 3
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 1
	note __, 3
	octave 3
	note D#, 2
	note __, 2
	octave 4
	note D#, 1
	note __, 1
	octave 3
	note C#, 1
	note __, 1
	note D_, 2
	note __, 2
	octave 4
	note D_, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note D_, 1
	note __, 3
	octave 3
	note C#, 2
	note __, 2
	octave 4
	note B_, 4
	note G_, 4
	note E_, 2
	note __, 2
	octave 3
	note C_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note C_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 3
	octave 2
	note A_, 2
	note __, 2
	octave 4
	note E_, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note G_, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	octave 3
	note D_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	endchannel
; eb1d9

Music_SSAqua_branch_eb1d9: ; eb1d9
	octave 2
	note B_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	octave 2
	note B_, 2
	note __, 2
	octave 4
	note F#, 1
	note __, 3
	octave 2
	note B_, 2
	note __, 2
	octave 4
	note D#, 1
	note __, 3
	octave 2
	note B_, 2
	note __, 2
	octave 4
	note D#, 1
	note __, 3
	endchannel
; eb1f2

Music_SSAqua_Ch4: ; eb1f2
	togglenoise $3
	notetype $c
	note __, 2
Music_SSAqua_branch_eb1f7: ; eb1f7
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
	note G#, 1
	note G_, 1
	loopchannel 12, Music_SSAqua_branch_eb1f7
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb264
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb264
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb264
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb270
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb264
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb257
	callchannel Music_SSAqua_branch_eb270
	loopchannel 0, Music_SSAqua_branch_eb1f7
; eb257

Music_SSAqua_branch_eb257: ; eb257
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
	note G_, 1
	note G_, 1
	endchannel
; eb264

Music_SSAqua_branch_eb264: ; eb264
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
	endchannel
; eb270

Music_SSAqua_branch_eb270: ; eb270
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note C_, 2
	endchannel
; eb27c


