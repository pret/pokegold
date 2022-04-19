; Enumerate constants

const_def: MACRO
if _NARG >= 1
	DEF const_value = \1
else
	DEF const_value = 0
endc
if _NARG >= 2
	DEF const_inc = \2
else
	DEF const_inc = 1
endc
ENDM

const: MACRO
	DEF \1 EQU const_value
	DEF const_value += const_inc
ENDM

shift_const: MACRO
	DEF \1 EQU (1 << const_value)
	DEF const_value += const_inc
ENDM

const_skip: MACRO
if _NARG >= 1
	DEF const_value += const_inc * (\1)
else
	DEF const_value += const_inc
endc
ENDM

const_next: MACRO
if (const_value > 0 && \1 < const_value) || (const_value < 0 && \1 > const_value)
fail "const_next cannot go backwards from {const_value} to \1"
else
	DEF const_value = \1
endc
ENDM

rb_skip: MACRO
if _NARG == 1
	rsset _RS + \1
else
	rsset _RS + 1
endc
ENDM
