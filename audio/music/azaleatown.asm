Music_AzaleaTown:
	channel_count 4
	channel 1, kikyou_Ch1
	channel 2, kikyou_Ch2
	channel 3, kikyou_Ch3
	channel 4, kikyou_Ch4
;	include	group.def
;bank3d	group	G_MUSIC4
;	;
;	;	kikyou
;	;
;	;	Converting on Thu Apr 08 18:51:46 1999
;	;
;	;				by ver 1.00
;	;
;	public	muskikyou
;muskikyou:








;----------------------------------------
kikyou_Ch1:
;----------------------------------------
	tempo 160
	volume 7, 7
	duty_cycle 2
; P1-1
	stereo_panning 	FALSE, TRUE
	note_type 12, 10, 1
	rest 2
; P1-2-3
.loop2
	volume_envelope 10, 1
	octave 3
	note F_,2
	volume_envelope 6, 1
	note F_,2
	note F_,2
	volume_envelope 10, 1
	note F_,2
	volume_envelope 6, 1
	note F_,2
	note F_,2
	note F_,2
	note F_,2
	db sound_loop_cmd, 2
	dw .loop2
; P1-4-10
.loop
	db sound_call_cmd
	dw .sub4
; P1-11
	volume_envelope 10, 4
	note G#,2
	note A#,1
	rest 3
	octave 4
	note C_,4
	note_type 6, 10, 4
	note G_,1
	note G#,3
	note F#,4
	note D#,2
	rest 2
; P1-12-18
	db sound_call_cmd
	dw .sub4
; P1-19
	note_type 6, 10, 4
	note D#,4
	note C_,4
	rest 3
	note B_,1
	octave 4
	note C_,12
	octave 3
	note A#,4
	note F#,4
; P1-20
	db sound_call_cmd
	dw .sub20
; P1-21
	volume_envelope 10, 3
	note A#,4
	octave 4
	note C#,2
	rest 2
	note C_,2
	rest 2
	volume_envelope 10, 1
	octave 3
	note C#,4
	note A_,2
	rest 14
; P1-22
	db sound_call_cmd
	dw .sub20
; P1-23
	volume_envelope 10, 3
	octave 4
	note C_,1
	note C#,3
	note F_,2
	rest 2
	note C#,2
	rest 2
	volume_envelope 10, 1
	octave 3
	note G_,4
	note A#,4
	note G_,8
	volume_envelope 10, 2
	note A#,4
; P1-24
	octave 4
	note C#,4
	octave 3
	note A#,4
	note F#,4
	note C#,8
	note F#,4
	rest 4
	note A#,4
; P1-25
	octave 4
	note C#,4
	octave 3
	note A#,4
	note G_,4
	note C#,4
	rest 4
	note G_,4
	rest 4
	octave 4
	note C#,4
; P1-26
	note D#,4
	note C#,4
	octave 3
	note G#,4
	note D#,4
	note C#,4
	octave 2
	note G#,4
	rest 8
; P1-27
	note_type 12, 2, 15
	octave 3
	note G#,14
	rest 2
; P1-28
	db sound_loop_cmd, 0
	dw .loop
.sub4
	note_type 12, 10, 1
	octave 4
	note F_,2
	volume_envelope 6, 1
	note F_,2
	note F_,2
	volume_envelope 10, 1
	note D#,2
	volume_envelope 6, 1
	note D#,2
	note D#,2
	volume_envelope 10, 1
	note F_,2
	volume_envelope 6, 1
	note F_,2
; P1-13
	volume_envelope 10, 1
	note A#,2
	volume_envelope 6, 1
	note A#,2
	note A#,2
	volume_envelope 10, 1
	note G#,2
	volume_envelope 6, 1
	note G#,2
	note G#,2
	volume_envelope 10, 1
	note A_,2
	volume_envelope 6, 1
	note A_,2
; P1-14
	volume_envelope 10, 1
	note C_,2
	volume_envelope 6, 1
	note C_,2
	note C_,2
	volume_envelope 10, 1
	note C#,2
	volume_envelope 6, 1
	note C#,2
	note C#,2
	note C#,2
	note C#,2
; P1-15
	volume_envelope 10, 1
	note D#,2
	volume_envelope 6, 1
	note D#,2
	note D#,2
	volume_envelope 10, 1
	note C#,2
	volume_envelope 6, 1
	note C#,2
	note C#,2
	note C#,2
	rest 2
; P1-16
	volume_envelope 10, 1
	octave 3
	note F_,2
	volume_envelope 6, 1
	note F_,2
	note F_,2
	volume_envelope 10, 1
	note F#,2
	volume_envelope 6, 1
	note F#,2
	note F#,2
	note F#,2
	note F#,2
; P1-17
	volume_envelope 10, 1
	note F_,2
	volume_envelope 6, 1
	note F_,2
	note F_,2
	volume_envelope 10, 1
	note D#,2
	volume_envelope 6, 1
	note D#,2
	note D#,2
	volume_envelope 10, 1
	note C#,2
	volume_envelope 6, 1
	note C#,2
; P1-18
	volume_envelope 10, 1
	note C_,2
	volume_envelope 6, 1
	note C_,2
	note C_,2
	volume_envelope 10, 1
	octave 2
	note A#,2
	volume_envelope 6, 1
	note A#,2
	note A#,2
	volume_envelope 10, 1
	octave 3
	note C#,2
	volume_envelope 6, 1
	note C#,2
	sound_ret 
.sub20
	volume_envelope 6, 1
	note G#,8
	note G#,8
	volume_envelope 8, 1
	note A_,8
	volume_envelope 10, 1
	note A_,8
	sound_ret 
;----------------------------------------
kikyou_Ch2:
;----------------------------------------
	vibrato 18, 2, 5
	duty_cycle 2
; P2-1
	stereo_panning 	TRUE, FALSE
	note_type 12, 6, 2
	rest 1
	octave 4
	note D_,1
; P2-2
	volume_envelope 11, 1
	note D#,2
	volume_envelope 7, 1
	note D#,2
	note D#,2
	volume_envelope 11, 1
	note C#,2
	volume_envelope 7, 1
	note C#,2
	note C#,2
	volume_envelope 5, 1
	note C#,2
	note C#,2
; P2-3
	volume_envelope 11, 1
	note C_,2
	volume_envelope 7, 1
	note C_,2
	note C_,2
	volume_envelope 11, 1
	note C#,2
	volume_envelope 7, 1
	note C#,2
	note C#,2
	note_type 6, 11, 4
	note F_,7
	octave 5
	note C_,1
; P2-4-10
.loop
	db sound_call_cmd
	dw .melo4
	note C#,4
; P2-11
	note C_,2
	note C#,1
	rest 3
	note_type 6, 11, 4
	note D#,11
	rest 8
	octave 5
	note C_,1
; P2-12
	db sound_call_cmd
	dw .melo4
	rest 2
	note C#,2
; P2-19
	note C_,2
	octave 3
	note G#,2
	note_type 6, 11, 4
	rest 3
	octave 4
	note G_,1
	note G#,12
	note F#,4
	note F_,4
; P2-20
	note D_,1
	note D#,3
	note C#,4
	note C_,2
	rest 2
	note G#,4
	rest 4
	note F#,4
	rest 4
	note F_,4
; P2-21
	note D#,4
	note F_,2
	rest 2
	note D#,2
	rest 2
	note C#,8
	rest 12
; P2-22
	note D_,1
	note D#,3
	note C#,4
	note C_,2
	rest 2
	note G#,4
	rest 4
	note A_,4
	rest 4
	octave 5
	note C_,4
; P2-23
	octave 4
	note B_,1
	octave 5
	note C_,3
	note C#,2
	rest 2
	note C_,2
	rest 2
	octave 4
	note F_,4
	rest 4
	note D#,4
	rest 4
	note C#,4
; P2-24
	note F_,4
	note D#,4
	note C#,4
	note F_,4
	rest 4
	note D#,4
	rest 4
	note C#,4
; P2-25
	note F_,4
	note D#,4
	note C#,4
	note F_,4
	rest 4
	note A#,4
	rest 4
	octave 5
	note C_,4
; P2-26
	note_type 12, 11, 7
	octave 4
	note G#,12
	note D#,4
; P2-27
	volume_envelope 1, 15
	note C_,14
	note_type 6, 11, 4
	note G#,2
	octave 5
	note C_,2
	db sound_loop_cmd, 0
	dw .loop
.melo4
	note C#,4
	octave 4
	note G#,2
	rest 2
	octave 5
	note C_,2
	rest 2
	note C#,8
	note D#,8
	note F_,2
	rest 1
	note G_,1
; P2-13
	note G#,12
	note F_,2
	rest 6
	note D#,8
	note F_,2
	rest 1
	note C_,1
; P2-14
	note_type 12, 10, 8
	note C#,16
; P2-15 -tie
	volume_envelope 10, 3
	note C#,8
	rest 4
	volume_envelope 11, 4
	octave 3
	note A#,2
	octave 4
	note C#,1
	rest 1
; P2-16
	note F#,8
	rest 2
	note F#,2
	note F_,2
	note D#,1
	rest 1
; P2-17
	note C#,6
	note C_,2
	rest 2
	note C_,4
	note C#,1
	note_type 6, 11, 4
	rest 1
	note D_,1
; P2-18
	note_type 12, 11, 7
	note D#,12
	volume_envelope 11, 4
	sound_ret 
;----------------------------------------
kikyou_Ch3:
;----------------------------------------
; P3-1
	stereo_panning 	TRUE, TRUE
	note_type 12, 2, 5
	octave 2
	note G#,1
	octave 3
	note C_,1
; P3-2
	note C#,1
	rest 5
	note C#,1
	rest 3
	note C#,1
	rest 1
	octave 2
	note G#,4
; P3-3
	octave 3
	note C#,1
	rest 5
	note C#,1
	rest 3
	note C#,1
	rest 1
	note G#,4
; P3-4-11
.loop
	db sound_call_cmd
	dw .base4
	note G#,4
	note D#,2
; P3-12-19
	db sound_call_cmd
	dw .base4
	note G#,2
	rest 2
	note F#,2
; P3-20
	db sound_call_cmd
	dw .base20
; P3-21
	note A#,1
	rest 1
	octave 4
	note C#,1
	rest 1
	note F_,2
	octave 3
	note A_,4
	octave 4
	note C#,1
	rest 3
	note F_,1
	rest 1
; P3-22
	db sound_call_cmd
	dw .base20
; P3-23
	octave 2
	note A#,2
	octave 3
	note F_,1
	rest 1
	note A#,1
	rest 1
	note D#,2
	octave 2
	note A#,2
	octave 3
	note D#,1
	rest 3
	note G_,2
; P3-24
	octave 2
	note F#,1
	rest 5
	note F#,1
	note F#,1
	note F#,1
	rest 1
	octave 3
	note C#,2
	rest 2
	octave 2
	note F_,1
	note F#,1
; P3-25
	note G_,1
	rest 5
	note G_,1
	note G_,1
	note G_,1
	rest 1
	octave 3
	note C#,2
	rest 2
	octave 2
	note F#,1
	note G_,1
; P3-26
	note G#,1
	rest 5
	note G#,1
	note G#,1
	note G#,1
	rest 1
	octave 3
	note D#,2
	rest 2
	octave 2
	note F#,1
	note G_,1
; P3-27
	note G#,1
	rest 5
	note G#,1
	note G#,1
	note G#,1
	rest 1
	octave 3
	note D#,2
	rest 2
	octave 2
	note B_,1
	octave 3
	note C_,1
	db sound_loop_cmd, 0
	dw .loop
.base4
	note C#,1
	rest 5
	note C#,1
	rest 3
	note C#,1
	rest 1
	octave 2
	note G#,4
; P3-5
	octave 3
	note F_,1
	rest 5
	note F_,1
	rest 1
	note C_,1
	rest 1
	note F_,4
	note A_,2
; P3-6
	note A#,1
	rest 1
	octave 4
	note C#,1
	rest 1
	note F_,1
	rest 1
	octave 3
	note A_,4
	octave 4
	note C#,1
	rest 1
	note F_,1
	rest 1
;;	tempo 2 	oct 4	g#
	octave 3
	note G#,4
; P3-7 -tie
;;				g#
	note A#,1
	rest 1
	note G#,1
	rest 1
	note G_,6
	rest 4
; P3-8
	note F#,1
	rest 5
	note F#,1
	rest 3
	note F#,1
	rest 1
	note C#,4
; P3-9
	note G_,1
	rest 5
	note G_,1
	rest 3
	note C#,4
	note G_,1
	rest 1
; P3-10
	note G#,1
	rest 5
	note G#,1
	rest 1
	note D#,1
	rest 1
	note C#,4
	note G#,1
	rest 1
; P3-11
	note G#,1
	rest 5
	note G#,1
	rest 1
	note C_,1
	rest 1
	sound_ret 
.base20
	volume_envelope 3, 5
	octave 3
	note F_,1
	rest 1
	note F_,1
	rest 1
	note F_,1
	rest 1
	note F_,1
	rest 1
	volume_envelope 2, 5
	note F_,1
	rest 1
	note F_,1
	rest 1
	note F_,1
	rest 1
	note F_,1
	rest 1
	sound_ret 
;----------------------------------------
kikyou_Ch4:
;----------------------------------------
	toggle_noise 3
; P4-1
	drum_speed 12
	drum_note 6,2
; P4-2
.loop
	drum_note 4,2
	drum_note 7,2
	drum_note 3,2
	drum_note 4,1
	drum_note 8,1
	drum_note 8,1
	drum_note 8,1
	drum_note 4,2
	drum_note 3,2
	drum_note 8,1
	drum_note 8,1
; P4-3
	drum_note 4,2
	drum_note 7,2
	drum_note 3,2
	drum_note 4,1
	drum_note 8,1
	drum_note 8,1
	drum_note 8,1
	drum_note 4,2
	drum_note 3,2
	drum_note 7,2
	db sound_loop_cmd, 0
	dw .loop


