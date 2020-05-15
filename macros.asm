INCLUDE "macros/enum.asm"
INCLUDE "macros/predef.asm"
INCLUDE "macros/rst.asm"
INCLUDE "macros/data.asm"
INCLUDE "macros/code.asm"
INCLUDE "macros/gfx.asm"
INCLUDE "macros/coords.asm"

INCLUDE "macros/scripts/audio.asm"
INCLUDE "macros/scripts/maps.asm"
INCLUDE "macros/scripts/events.asm"
INCLUDE "macros/scripts/text.asm"
INCLUDE "macros/scripts/movement.asm"
INCLUDE "macros/scripts/battle_commands.asm"
INCLUDE "macros/scripts/battle_anims.asm"
INCLUDE "macros/scripts/trade_anims.asm"

; TODO: Should this be included or not?
;   - Leave out for now so no code depending on legacy macros gets introduced
;
; INCLUDE "macros/legacy.asm"

dr: macro
IF DEF(_GOLD)
INCBIN "baserom-gold.gbc", \1, \2 - \1
ELIF DEF(_SILVER)
INCBIN "baserom-silver.gbc", \1, \2 - \1
ENDC
ENDM
