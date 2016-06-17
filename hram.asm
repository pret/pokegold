HRAM_START         EQU $ff80
hPushOAM           EQU $ff80 ; 10 bytes

hROMBankBackup     EQU $ff8c
hBuffer            EQU $ff8d
hFF8E              EQU $ff8e
hRTCDayHi          EQU $ff8f
hRTCDayLo          EQU $ff90
hRTCHours          EQU $ff91
hRTCMinutes        EQU $ff92
hRTCSeconds        EQU $ff93

hHours             EQU $ff96

hMinutes           EQU $ff98

hSeconds           EQU $ff9a

hVBlankCounter     EQU $ff9d
hFF9E              EQU $ff9e
hROMBank           EQU $ff9f
hVBlank            EQU $ffa0
hMapEntryMethod    EQU $ffa1
hMenuReturn        EQU $ffa2

hJoypadReleased    EQU $ffa4
hJoypadPressed     EQU $ffa5
hJoypadDown        EQU $ffa6
hJoypadSum         EQU $ffa7
hJoyReleased       EQU $ffa8
hJoyPressed        EQU $ffa9
hJoyDown           EQU $ffaa
hJoyLast           EQU $ffab
hInMenu            EQU $ffac

hPrinter           EQU $ffae
hGraphicStartTile           EQU $ffaf
hMoveMon           EQU $ffb0
hMapObjectIndexBuffer EQU $ffb1
hObjectStructIndexBuffer EQU $ffb2

hConnectionStripLength EQU $ffb1
hConnectedMapWidth EQU $ffb2

hPastLeadingZeroes EQU $ffb5

hStringCmpString1  EQU $ffb3
hStringCmpString2  EQU $ffb7

hDividend          EQU $ffb5 ; length in b register, before 'call Divide' (max 4 bytes)
hDivisor           EQU $ffb9 ; 1 byte long
hQuotient          EQU $ffb6 ; result (3 bytes long)
hRemainder         EQU $ffb9

hMultiplicand      EQU $ffb6 ; 3 bytes long
hMultiplier        EQU $ffb9 ; 1 byte long
hProduct           EQU $ffb5 ; result (4 bytes long)

hMathBuffer        EQU $ffba

hPrintNum1         EQU $ffb5
hPrintNum2         EQU $ffb6
hPrintNum3         EQU $ffb7
hPrintNum4         EQU $ffb8
hPrintNum5         EQU $ffb9
hPrintNum6         EQU $ffba
hPrintNum7         EQU $ffbb
hPrintNum8         EQU $ffbc
hPrintNum9         EQU $ffbd
hPrintNum10        EQU $ffbe

hMGStatusFlags     EQU $ffbe

hUsedSpriteIndex   EQU $ffbf
hUsedSpriteTile    EQU $ffc0
hFFC1              EQU $ffc1
hFFC2              EQU $ffc2
hFFC3              EQU $ffc3
hFFC4              EQU $ffc4
hMoneyTemp         EQU $ffc5

hMGJoypadPressed   EQU $ffc5
hMGJoypadReleased  EQU $ffc6

hLCDCPointer       EQU $ffc8
hLYOverrideStart   EQU $ffc9
hLYOverrideEnd     EQU $ffca
hMobileReceive     EQU $ffcb
hFFCC              EQU $ffcc
hLinkPlayerNumber  EQU $ffcd
hFFCE              EQU $ffce
hSerialSend        EQU $ffcf
hSerialReceive     EQU $ffd0

hSCX               EQU $ffd1
hSCY               EQU $ffd2
hWX                EQU $ffd3
hWY                EQU $ffd4
hTilesPerCycle     EQU $ffd5
hBGMapMode         EQU $ffd6
hBGMapThird        EQU $ffd7
hBGMapAddress      EQU $ffd8

hOAMUpdate         EQU $ffda
hSPBuffer          EQU $ffdb

hBGMapUpdate       EQU $ffdd
hFFDE              EQU $ffde

hMapAnims          EQU $ffe0
hTileAnimFrame     EQU $ffe1

hLastTalked        EQU $ffe2

hRandom            EQU $ffe3
hRandomAdd         EQU $ffe3
hRandomSub         EQU $ffe4
hSecondsBackup     EQU $ffe5
hBattleTurn        EQU $ffe6 ; Which trainers turn is it? 0: Player, 1: Opponent Trainer
hCGBPalUpdate      EQU $ffe7
hCGB               EQU $ffe8
hSGB               EQU $ffe9
hDMATransfer       EQU $ffea
hMobile            EQU $ffeb
hFFEC              EQU $ffec
hClockResetTrigger EQU $ffed

HRAM_END EQU $ffff
