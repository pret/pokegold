SECTION "HRAM", HRAM

hTransferVirtualOAM:: ds 12 ; ff80

hROMBankBackup:: db ; ff8c
hBuffer:: db ; ff8d
hFF8E:: db ; ff8e

hRTCDayHi::     db ; ff8f
hRTCDayLo::     db ; ff90
hRTCHours::     db ; ff91
hRTCMinutes::   db ; ff92
hRTCSeconds::   db ; ff93
	ds 2

hHours::    db ; ff96
	ds 1
hMinutes::  db ; ff98
	ds 1
hSeconds::  db ; ff9a
	ds 1
    ds 1

hVBlankCounter:: db ; ff9d
	ds 1

hROMBank::  db ; ff9f
hVBlank ::  db ; ffa0
hMapEntryMethod:: db ; ffa1
hMenuReturn::   db ; ffa2
	ds 1

hJoypadReleased::   db ; ffa4
hJoypadPressed::    db ; ffa5
hJoypadDown::       db ; ffa6
hJoypadSum::        db ; ffa7
hJoyReleased::      db ; ffa8
hJoyPressed::       db ; ffa9
hJoyDown::          db ; ffaa
hJoyLast::          db ; ffab

hInMenu::   db ; ffac
	ds 1

hPrinter::          db ; ffae
hGraphicStartTile:: db ; ffaf
hMoveMon::          db ; ffb0

UNION ; ffb1
hMapObjectIndexBuffer::     db ; ffb1
hObjectStructIndexBuffer::  db ; ffb2

NEXTU ; ffb1
hConnectionStripLength::    db ; ffb1
hConnectedMapWidth::        db ; ffb2
ENDU ;ffb3

hEnemyMonSpeed:: dw ; ffb3

UNION ; ffb5
	ds 2
hPartyMon1Speed:: dw ; ffb7

NEXTU ; ffb5

UNION ; ffb5
hDividend::             ds 4 ; ffb5 ; length in b register, before 'call Divide' (max 4 bytes)
hDivisor::              db ; ffb9 ; 1 byte long
NEXTU ; ffb5
	ds 1
hQuotient::     ds 3 ; ffb6 ; result (3 bytes long)
hRemainder::    db ; ffb9
NEXTU ; ffb5
    ds 1
hMultiplicand:: ds 3 ; ffb6 ; 3 bytes long
hMultiplier::   db ; ffb9 ; 1 byte long
NEXTU ; ffb5
hProduct:: ds 4 ; ffb5 ; result (4 bytes long)
ENDU ; ffba

hMathBuffer:: ds 5 ; ffba

NEXTU ; ffb5

hPrintNum1::    db ; ffb5
hPrintNum2::    db ; ffb6
hPrintNum3::    db ; ffb7
hPrintNum4::    db ; ffb8
hPrintNum5::    db ; ffb9
hPrintNum6::    db ; ffba
hPrintNum7::    db ; ffbb
hPrintNum8::    db ; ffbc
hPrintNum9::    db ; ffbd
hPrintNum10::   db ; ffbe

NEXTU ; ffb5

	ds 9
hMGStatusFlags:: db ; ffbe
ENDU ; ffbf

hUsedSpriteIndex::  db ; ffbf
hUsedSpriteTile::   db ; ffc0
hFFC1::             db ; ffc1
hFFC2::             db ; ffc2
hFFC3::             db ; ffc3
hFFC4::             db ; ffc4

UNION ; ffc5
hMoneyTemp:: ds 3 ; ffc5
NEXTU ; ffc5
hMGJoypadPressed::      db ; ffc5
hMGJoypadReleased::    db ; ffc6
ENDU ; ffc8

hLCDCPointer::      db ; ffc8
hLYOverrideStart::  db ; ffc9
hLYOverrideEnd::    db ; ffca

hMobileReceive::    db ; ffcb
hFFCC::             db ; ffcc
hLinkPlayerNumber:: db ; ffcd
hFFCE::             db ; ffce
hSerialSend::       db ; ffcf
hSerialReceive::    db ; ffd0

hSCX::              db ; ffd1
hSCY::              db ; ffd2
hWX::               db ; ffd3
hWY::               db ; ffd4
hTilesPerCycle::    db ; ffd5
hBGMapMode::        db ; ffd6
hBGMapThird::       db ; ffd7
hBGMapAddress::     db ; ffd8

	ds 1

hOAMUpdate :: db ; ffda

hSPBuffer:: dw ; ffdb

hBGMapUpdate::  db ; ffdd
hFFDE::         db ; ffde

	ds 1

hMapAnims::         db ; ffe0
hTileAnimFrame::    db ; ffe1

hLastTalked:: db ; ffe2

hRandom::
hRandomAdd:: db ; ffe3
hRandomSub:: db ; ffe4

hSecondsBackup:: db ; ffe5

hBattleTurn:: ; ffe6
;Which trainers turn is it? 0: Player, 1: Opponent Trainer
    db
    
hCGBPalUpdate:: db ; ffe7
hCGB::          db ; ffe8
hSGB::          db ; ffe9

hDMATransfer:: db ; ffea
hMobile:: db ; ffeb
hFFEC:: db ; ffec
hClockResetTrigger:: db ; ffed
