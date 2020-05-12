SECTION "HRAM", HRAM

hTransferVirtualOAM:: ds 10 ; ff80

	ds 5

hRTCDayHi::   db ; ff8f
hRTCDayLo::   db ; ff90
hRTCHours::   db ; ff91
hRTCMinutes:: db ; ff92
hRTCSeconds:: db ; ff93
	ds 2

hHours:: db ; ff96
	ds 1
hMinutes:: db ; ff98
	ds 1
hSeconds:: db ; ff9a
	ds 1

	ds 1

hVBlankCounter:: db ; ff9d

; hDMATransfer?
hFF9E:: db ; ff9e

hROMBank:: db ; ff9f
hVBlank:: db ; ffa0
hMapEntryMethod:: db ; ffa1
hMenuReturn:: db ; ffa2

hUnusedFFA3:: db ; ffa3

hJoypadReleased:: db ; ffa4
hJoypadPressed::  db ; ffa5
hJoypadDown::     db ; ffa6
hJoypadSum::      db ; ffa7
hJoyReleased::    db ; ffa8
hJoyPressed::     db ; ffa9
hJoyDown::        db ; ffaa
hJoyLast::        db ; ffab

hInMenu:: db ; ffac

	ds 1

hPrinter:: db ; ffae
hGraphicStartTile:: db ; ffaf
hMoveMon:: db ; ffb0

UNION ; ffb1
hMapObjectIndexBuffer:: db ; ffb1
hObjectStructIndexBuffer:: db ; ffb2

NEXTU ; ffb1
hConnectionStripLength:: db ; ffb1
hConnectedMapWidth:: db ; ffb2
ENDU ; ffb3

hEnemyMonSpeed:: dw ; ffb3

UNION ; ffb5
; math-related values

UNION ; ffb5
; inputs to Multiply
	ds 1
hMultiplicand:: ds 3 ; ffb6
hMultiplier::   db   ; ffb9
NEXTU ; ffb5
; result of Multiply
hProduct::      ds 4 ; ffb5
NEXTU
; inputs to Divide
hDividend::     ds 4 ; ffb5
hDivisor::      db   ; ffb9
NEXTU ; ffb5
; results of Divide
hQuotient::     ds 4 ; ffb5
hRemainder::    db   ; ffb9
ENDU

hMathBuffer:: ds 5 ; ffba

NEXTU ; ffb5
; PrintNum scratch space
hPrintNumBuffer:: ds 10 ; ffb5

NEXTU ; ffb5
; miscellaneous
    ds 9
hMGStatusFlags:: db ; ffbe
ENDU ; ffbf

UNION
hUsedSpriteIndex:: db ; ffbf
hUsedSpriteTile::  db ; ffc0
NEXTU
hCurSpriteXCoord::   db ; ffbf
hCurSpriteYCoord::   db ; ffc0
hCurSpriteXPixel::   db ; ffc1
hCurSpriteYPixel::   db ; ffc2
hCurSpriteTile::     db ; ffc3
hCurSpriteOAMFlags:: db ; ffc4
ENDU

UNION ; ffc5
hMoneyTemp:: ds 3 ; ffc5
NEXTU ; ffc5
hMGJoypadPressed::  db ; ffc5
hMGJoypadReleased:: db ; ffc6
hMGPrevTIMA::       db ; ffc7
ENDU ; ffc8

hLCDCPointer::     db ; ffc8
hLYOverrideStart:: db ; ffc9
hLYOverrideEnd::   db ; ffca

	ds 1

hSerialReceivedNewData::     db ; ffcc
hSerialConnectionStatus::    db ; ffcd
hSerialIgnoringInitialData:: db ; ffce
hSerialSend::                db ; ffcf
hSerialReceive::             db ; ffd0

hSCX::           db ; ffd1
hSCY::           db ; ffd2
hWX::            db ; ffd3
hWY::            db ; ffd4
hTilesPerCycle:: db ; ffd5
hBGMapMode::     db ; ffd6
hBGMapThird::    db ; ffd7
hBGMapAddress::  dw ; ffd8

hOAMUpdate:: db ; ffda

hSPBuffer::  dw ; ffdb

hBGMapUpdate::    db ; ffdd
hBGMapTileCount:: db ; ffde

	ds 1

hMapAnims::      db ; ffe0
hTileAnimFrame:: db ; ffe1

hLastTalked:: db ; ffe2

hRandom::
hRandomAdd:: db ; ffe3
hRandomSub:: db ; ffe4

hUnusedBackup:: db ; ffe5

hBattleTurn:: ; ffe6
; Which trainer's turn is it? 0: player, 1: opponent trainer
	db

hCGBPalUpdate:: db ; ffe7
hCGB::          db ; ffe8
hSGB::          db ; ffe9
