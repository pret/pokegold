Music_PokemonCenter:
	channel_count 3
	channel 1, PMC_Ch1
	channel 2, PMC_Ch2
	channel 3, PMC_Ch3
;	include	group.def
;bank3d	group	G_MUSIC4
;
;;	PC011
;
;;	Converting on Wed Sep 27 17:34:34 1995
;
;;				by ver 1.02
;
;	public	muspmc
;muspmc:






;----------------------------------------
PMC_Ch1:
;----------------------------------------
	tempo 152
	volume 7, 7
	duty_cycle 2
	vibrato 10, 1, 4
	pitch_offset 1
; P1-1
.loop10
	stereo_panning FALSE, TRUE
	note_type 12, 8, 3
	octave 3
	note F#,2
	note F_,2
	note F#,2
;		init c b4
	octave 4
	note D_,4
	note C#,2
	octave 3
	note B_,2
	note A_,2
; P1-2
	note B_,2
	note A_,2
	note G_,2
	note F#,2
	note E_,2
	note F#,2
	note G_,2
	note A_,2
; P1-3
;		init c a2
	note A_,2
	note E_,2
	note A_,2
;		init c b4
	octave 4
	note C#,4
	octave 3
	note B_,2
	note A_,2
	note G_,2
; P1-4
	note F#,2
	note A_,2
	note B_,2
	octave 4
	note C#,2
	note D_,2
	note C#,2
	octave 3
	note B_,2
	note A_,2
; P1-5
;		init c a2
	note F#,2
	note F_,2
	note F#,2
;		init c b4
	octave 4
	note D_,4
	note C#,2
	octave 3
	note B_,2
	note A_,2
; P1-6
	note B_,2
	note A_,2
	note G_,2
	note F#,2
	note E_,2
	note F#,2
	note G_,2
	note A_,2
; P1-7
;		init c a2
	note A_,2
	note E_,2
	note A_,2
;		init c b4
	octave 4
	note C#,4
	octave 3
	note B_,2
	note A_,2
	note G_,2
; P1-8
	note_type 12, 11, 4
	note F#,2
	note E_,2
	note D_,2
	note E_,2
	note F#,2
	note G_,2
	note A_,2
	note B_,2
; P1-9
	stereo_panning TRUE, FALSE
	note F#,2
	note E_,2
	note D_,4
	note E_,2
	note F#,2
	note G_,2
	note A_,2
; P1-10
	note B_,2
	note A_,2
	note G_,4
	note E_,2
	note F#,2
	note G_,2
	note A_,2
; P1-11
	note G_,2
	note F#,2
	note E_,4
	note C#,2
	note D_,2
	note E_,2
	note G_,2
; P1-12
	note F#,2
	note G_,2
	note A_,2
	note B_,2
	note A_,8
; P1-13
	octave 4
	note D_,2
	note C#,2
	octave 3
	note B_,4
	note A_,2
	note B_,2
	octave 4
	note C#,2
	note D_,2
; P1-14
	note E_,2
	note D_,2
	note C#,4
	octave 3
	note B_,2
	octave 4
	note C#,2
	note D_,2
	note E_,2
; P1-15
	note C#,2
	octave 3
	note B_,2
	note A_,4
	note G_,2
	note A_,2
	note B_,2
	note G_,2
; P1-16
	note A_,2
	note G_,2
	note F#,2
	note E_,2
	note D_,2
	note E_,2
	note F#,2
	note G_,2
	db sound_loop_cmd, 0
	dw .loop10
;----------------------------------------
PMC_Ch2:
;----------------------------------------
	vibrato 16, 2, 5
; P2-1
.loop20
	stereo_panning TRUE, TRUE
	db sound_call_cmd
	dw .d_a_d
	stereo_panning FALSE, TRUE
	duty_cycle 3
	note_type 12, 10, 5
	octave 3
	note A_,4
	note E_,4
; P2-3
	stereo_panning TRUE, TRUE
	db sound_call_cmd
	dw .cs_a_cs
; P2-4
	note D_,2
	note F#,6
	stereo_panning FALSE, TRUE
	duty_cycle 3
	note_type 12, 10, 5
	octave 3
	note A_,4
	note E_,4
; P2-5
	stereo_panning TRUE, TRUE
	db sound_call_cmd
	dw .d_a_d
	duty_cycle 3
	note_type 12, 10, 5
	octave 3
	note A_,4
	note E_,4
; P2-7
	stereo_panning TRUE, TRUE
	db sound_call_cmd
	dw .cs_a_cs
; P2-8
	note D_,8
	stereo_panning FALSE, TRUE
	duty_cycle 3
	note_type 12, 10, 5
	octave 3
	note D_,4
	note E_,4
; P2-9
	duty_cycle 2
	note_type 12, 12, 6
	octave 4
	note F#,8
	note A_,8
; P2-10
	note G_,2
	note A_,2
	note G_,2
	note F#,2
	note E_,8
; P2-11
	note C#,8
	note E_,8
; P2-12
	note F#,2
	note G_,2
	note F#,2
	note E_,2
	note D_,8
; P2-13
	note F#,8
	note A_,8
; P2-14
	note G_,2
	note F#,2
	note G_,2
	note A_,2
	note B_,8
; P2-15
	note A_,4
	note G_,2
	note F#,2
	note G_,8
; P2-16
	note F#,2
	note G_,2
	note F#,2
	note E_,2
	note D_,8
	db sound_loop_cmd, 0
	dw .loop20
.d_a_d
	duty_cycle 2
	note_type 12, 12, 2
	octave 4
	note D_,2
	octave 3
	note A_,2
	octave 4
	note D_,2
	note_type 12, 12, 3
	note A_,4
	note G_,4
	note F#,2
; P2-2
	note E_,2
	note C#,6
	sound_ret 
.cs_a_cs
	duty_cycle 2
	note_type 12, 12, 2
	octave 4
	note C#,2
	octave 3
	note A_,2
	octave 4
	note C#,2
	note_type 12, 12, 3
	note F#,4
	note E_,4
	note C#,2
	sound_ret 
;----------------------------------------
PMC_Ch3:
;----------------------------------------
	note_type 12, 1, 6
; P3-1
.loop30
	stereo_panning TRUE, FALSE
	octave 3
	note D_,1
	rest 5
	note F#,1
	rest 3
	note F#,1
	rest 1
	note G_,1
	rest 1
	note F#,1
	rest 1
; P3-2
	db sound_call_cmd
	dw .e_a_e_a
; P3-3
	db sound_call_cmd
	dw .e_a_g_a
; P3-4
	note F#,1
	rest 5
	note A_,1
	rest 3
	note A_,1
	rest 1
	note G_,1
	rest 1
	note A_,1
	rest 1
; P3-5
	note D_,1
	rest 5
	note F#,1
	rest 3
	note F#,1
	rest 1
	note G_,1
	rest 1
	note F#,1
	rest 1
; P3-6
	db sound_call_cmd
	dw .e_a_e_a
; P3-7
	db sound_call_cmd
	dw .e_a_g_a
; P3-8
	note D_,1
	rest 5
	note F#,1
	rest 3
	note F#,1
	rest 1
	note D_,1
	rest 1
	note G_,1
	rest 1
;		tempo 1			f#
;					r
;					d
;					b
;					a
;					g
	stereo_panning TRUE, TRUE
; P3-9
	db sound_call_cmd
	dw .fs_a_fs_a
; P3-10
	note G_,1
	rest 5
	note B_,1
	rest 3
	note B_,1
	rest 1
	note G_,1
	rest 1
	note B_,1
	rest 1
; P3-11
	note E_,1
	rest 5
	note G_,1
	rest 3
	note G_,1
	rest 3
	note G_,1
	rest 1
; P3-12
	note F#,1
	rest 5
	note A_,1
	rest 3
	note A_,1
	rest 1
	note G#,1
	rest 1
	note A_,1
	rest 1
; P3-13
	db sound_call_cmd
	dw .fs_a_fs_a
; P3-14
	note G_,1
	rest 5
	note B_,1
	rest 3
	note B_,1
	rest 3
	note B_,1
	rest 1
; P3-15
	note E_,1
	rest 5
	note G_,1
	rest 3
	note G_,1
	rest 3
	note G_,1
	rest 1
; P3-16
	note F#,1
	rest 5
	note A_,1
	rest 3
	note A_,1
	rest 1
	note G_,1
	rest 1
	note E_,1
	rest 1
	db sound_loop_cmd, 0
	dw .loop30
.e_a_e_a
	note E_,1
	rest 5
	note A_,1
	rest 3
	note A_,1
	rest 3
	note A_,1
	rest 1
	sound_ret 
.e_a_g_a
	note E_,1
	rest 5
	note A_,1
	rest 3
	note A_,1
	rest 1
	note G_,1
	rest 1
	note A_,1
	rest 1
	sound_ret 
.fs_a_fs_a
	note F#,1
	rest 5
	note A_,1
	rest 3
	note A_,1
	rest 3
	note A_,1
	rest 1
	sound_ret 


