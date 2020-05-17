_Sine::
; a = d * sin(e * pi/256)
	ld a, e
	calc_sine_wave .SineWave

.SineWave:
	sine_table $100
