DEF POKEDEX_SCX EQU 0
EXPORT POKEDEX_SCX
; erosunica: the Pokédex has been modified to more closely resemble that of SW97
; This affects more or less the entire file
; Line-by-line changes aren't commented

; Pokedex_RunJumptable.Jumptable indexes
	const_def
	const DEXSTATE_MAIN_SCR
	const DEXSTATE_UPDATE_MAIN_SCR
	const DEXSTATE_DEX_ENTRY_SCR
	const DEXSTATE_UPDATE_DEX_ENTRY_SCR
	const DEXSTATE_REINIT_DEX_ENTRY_SCR
	const DEXSTATE_SEARCH_SCR
	const DEXSTATE_UPDATE_SEARCH_SCR
	const DEXSTATE_OPTION_SCR
	const DEXSTATE_UPDATE_OPTION_SCR
	const DEXSTATE_SEARCH_RESULTS_SCR
	const DEXSTATE_UPDATE_SEARCH_RESULTS_SCR
	const DEXSTATE_UNOWN_MODE
	const DEXSTATE_UPDATE_UNOWN_MODE
	const DEXSTATE_EXIT

Pokedex:
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld a, [wVramState]
	push af
	xor a
	ld [wVramState], a
	ldh a, [hInMenu]
	push af
	
	ld a, $1
	ldh [hInMenu], a
	xor a
	ldh [hMapAnims], a
	ldh [hGraphicStartTile], a
	call InitPokedex
	call DelayFrame

.main
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .exit
	call Pokedex_RunJumptable
	call DelayFrame
	jr .main

.exit
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	call ClearSprites
	ld a, [wCurDexMode]
	ld [wLastDexMode], a
	xor a
	ld [wBoxAlignment], a

	pop af
	ldh [hInMenu], a
	pop af
	ld [wVramState], a
	pop af
	ld [wOptions], a
	ret

InitPokedex:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call Pokedex_LoadGFX

	ld hl, wPokedexDataStart
	ld bc, wPokedexDataEnd - wPokedexDataStart
	xor a
	call ByteFill

	xor a
	ld [wJumptableIndex], a
	ld [wPrevDexEntryJumptableIndex], a
	ld [wPrevDexEntryBackup], a
	ld [wUnusedPokedexByte], a

	call Pokedex_CheckUnlockedUnownMode

	ld a, [wLastDexMode]
	ld [wCurDexMode], a

	call Pokedex_OrderMonsByMode
	call Pokedex_InitCursorPosition
	call Pokedex_GetLandmark
	call Pokedex_ResetBGMapMode
	ret

Pokedex_CheckUnlockedUnownMode:
	ld a, [wStatusFlags]
	bit STATUSFLAGS_UNOWN_DEX_F, a
	jr nz, .unlocked

	xor a
	ld [wUnlockedUnownMode], a
	ret

.unlocked
	ld a, TRUE
	ld [wUnlockedUnownMode], a
	ret

Pokedex_InitCursorPosition:
	ld hl, wPokedexOrder
	ld a, [wPrevDexEntry]
	and a
	jr z, .done
	cp NUM_POKEMON + 1
	jr nc, .done

	ld b, a
	ld a, [wDexListingEnd]
	cp $8
	jr c, .only_one_page

	sub $7
	ld c, a
.loop1
	ld a, b
	cp [hl]
	jr z, .done
	inc hl
	ld a, [wDexListingScrollOffset]
	inc a
	ld [wDexListingScrollOffset], a
	dec c
	jr nz, .loop1

.only_one_page
	ld c, $7
.loop2
	ld a, b
	cp [hl]
	jr z, .done
	inc hl
	ld a, [wDexListingCursor]
	inc a
	ld [wDexListingCursor], a
	dec c
	jr nz, .loop2

.done
	ret

Pokedex_GetLandmark:
	ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
	call GetWorldMapLocation

	cp LANDMARK_SPECIAL
	jr nz, .load

	ld a, [wBackupMapGroup]
	ld b, a
	ld a, [wBackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.load
	ld [wDexCurLocation], a
	ret

Pokedex_RunJumptable:
	ld a, [wJumptableIndex]
	ld hl, .Jumptable
	call Pokedex_LoadPointer
	jp hl

.Jumptable:
; entries correspond to DEXSTATE_* constants
	dw Pokedex_InitMainScreen
	dw Pokedex_UpdateMainScreen
	dw Pokedex_InitDexEntryScreen
	dw Pokedex_UpdateDexEntryScreen
	dw Pokedex_ReinitDexEntryScreen
	dw Pokedex_InitSearchScreen
	dw Pokedex_UpdateSearchScreen
	dw Pokedex_InitOptionScreen
	dw Pokedex_UpdateOptionScreen
	dw Pokedex_InitSearchResultsScreen
	dw Pokedex_UpdateSearchResultsScreen
	dw Pokedex_InitUnownMode
	dw Pokedex_UpdateUnownMode
	dw Pokedex_Exit

Pokedex_IncrementDexPointer:
	ld hl, wJumptableIndex
	inc [hl]
	ret

Pokedex_Exit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Pokedex_InitMainScreen:
	ld a, $1
	ld [wBoxAlignment], a
	call Pokedex_ResetBGMapMode
	call ClearSprites
	xor a
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call ByteFill	
	call Pokedex_DrawMainScreenBG
	farcall DrawPokedexListWindow	
	ld a, 7
	ld [wDexListingHeight], a
	call Pokedex_PrintListing
	call WaitBGMap	
	call Pokedex_ResetBGMapMode
	ld a, -1
	ld [wCurPartySpecies], a
	ld a, SCGB_POKEDEX_LIST
	call Pokedex_GetSGBLayout	
	call Pokedex_UpdateCursorOAM
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateMainScreen:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and SELECT
	jr nz, .select
	ld a, [hl]
	and START
	jr nz, .start
	call Pokedex_UpdateCursorOAM
	call Pokedex_ListingHandleDPadInput
	ret nc
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode3
	call Pokedex_ResetBGMapMode
	ret

.a
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	ret z
	ld a, DEXSTATE_DEX_ENTRY_SCR
	ld [wJumptableIndex], a
	ld a, DEXSTATE_MAIN_SCR
	ld [wPrevDexEntryJumptableIndex], a
	ret

.select
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_OPTION_SCR
	ld [wJumptableIndex], a
	ret

.start
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_SEARCH_SCR
	ld [wJumptableIndex], a
	ret

.b
	ld a, DEXSTATE_EXIT
	ld [wJumptableIndex], a
	ret

Pokedex_InitDexEntryScreen:
	call LowVolume
	xor a ; page 1
	ld [wPokedexStatus], a
	call Pokedex_ResetBGMapMode
	call ClearSprites
	hlcoord 1, 1
	lb bc, 16, 18
	call ClearBox
	hlcoord 0, 0
	lb bc, 16, 18
	call Pokedex_PlaceBorder	
	call WaitBGMap
	call Pokedex_DrawDexEntryScreenBG
	call Pokedex_InitArrowCursor
	call Pokedex_GetSelectedMon
	ld [wPrevDexEntry], a
	farcall DisplayDexEntry
	call Pokedex_LoadSelectedMonTiles
	call WaitBGMap
	call Pokedex_GetSelectedMon
	ld [wCurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	ld c, 20
	call DelayFrames	
	call Pokedex_PlaceFrontpicTopLeftCorner
	ld a, [wCurPartySpecies]
	call PlayMonCry
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateDexEntryScreen:
	ld de, DexEntryScreen_ArrowCursorData
	call Pokedex_MoveArrowCursor
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .return_to_prev_screen
	ld a, [hl]
	and A_BUTTON
	jr nz, .do_menu_action
	call Pokedex_NextOrPreviousDexEntry
	ret nc
	call Pokedex_IncrementDexPointer
	ret

.do_menu_action
	ld a, [wDexArrowCursorPosIndex]
	ld hl, DexEntryScreen_MenuActionJumptable
	call Pokedex_LoadPointer
	jp hl

.return_to_prev_screen
	ld a, [wLastVolume]
	and a
	jr z, .max_volume
	ld a, $77
	ld [wLastVolume], a

.max_volume
	call MaxVolume
	hlcoord 1, 1
	lb bc, 7, 7
	call ClearBox
	call WaitBGMap
	ld a, SCGB_POKEDEX_LIST
	call Pokedex_GetSGBLayout		
	ld c, 20
	call DelayFrames
	ld a, [wPrevDexEntryJumptableIndex]
	ld [wJumptableIndex], a
	ret

Pokedex_Page:
	ld a, [wPokedexStatus]
	xor 1 ; toggle page
	ld [wPokedexStatus], a
	call Pokedex_GetSelectedMon
	ld [wPrevDexEntry], a
	farcall DisplayDexEntry
	call WaitBGMap
	ret

Pokedex_ReinitDexEntryScreen:
	hlcoord 1, 1
	lb bc, 16, 18
	call ClearBox
	call WaitBGMap
	xor a ; page 1
	ld [wPokedexStatus], a
	call Pokedex_ResetBGMapMode	
	call Pokedex_DrawDexEntryScreenBG
	call ClearSprites
	call Pokedex_InitArrowCursor
	call Pokedex_GetSelectedMon
	ld [wPrevDexEntry], a
	farcall DisplayDexEntry
	call Pokedex_LoadSelectedMonTiles
	call WaitBGMap
	call Pokedex_GetSelectedMon
	ld [wCurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	ld c, 20
	call DelayFrames
	call Pokedex_PlaceFrontpicTopLeftCorner	
	ld a, [wCurPartySpecies]
	call PlayMonCry
	ld hl, wJumptableIndex
	dec [hl]
	ret

DexEntryScreen_ArrowCursorData:
	db D_RIGHT | D_LEFT, 4
	dwcoord 1, 16  ; PAGE
	dwcoord 6, 16  ; AREA
	dwcoord 11, 16 ; CRY
	dwcoord 15, 16 ; PRNT

DexEntryScreen_MenuActionJumptable:
	dw Pokedex_Page
	dw .Area
	dw .Cry
	dw .Print

.Area:
	hlcoord 1, 1
	lb bc, 16, 18
	call ClearBox
	call WaitBGMap
	call Pokedex_GetSelectedMon
	ld a, [wDexCurLocation]
	ld e, a
	predef Pokedex_GetArea
;	call ClearTilemap
	hlcoord 1, 1
	lb bc, 16, 18
	call ClearBox
	hlcoord 0, 0
	lb bc, 16, 18
	call Pokedex_PlaceBorder
	call WaitBGMap
	ld a, $90
	ldh [hWY], a
	ld c, 30
	call DelayFrames
	call Pokedex_RedisplayDexEntry
	call Pokedex_LoadSelectedMonTiles
	call Pokedex_PlaceFrontpicTopLeftCorner
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout	
	call WaitBGMap
	call Pokedex_GetSelectedMon
	ld [wCurPartySpecies], a
	ret

.Cry:
; erosunica: applied https://github.com/pret/pokecrystal/blob/master/docs/bugs_and_glitches.md#playing-enteis-pok%C3%A9dex-cry-can-distort-raikous-and-suicunes
	ld a, [wCurPartySpecies]
	call PlayMonCry
	ret

.Print:
	call Pokedex_ApplyPrintPals
	ld a, [wPrevDexEntryBackup]
	push af
	ld a, [wPrevDexEntryJumptableIndex]
	push af
	ld a, [wJumptableIndex]
	push af
	farcall PrintDexEntry
	pop af
	ld [wJumptableIndex], a
	pop af
	ld [wPrevDexEntryJumptableIndex], a
	pop af
	ld [wPrevDexEntryBackup], a
	call ClearBGPalettes
	call DisableLCD
	call Pokedex_LoadStandardFont
	call Pokedex_RedisplayDexEntry
	call Pokedex_LoadSelectedMonTiles
	call Pokedex_PlaceFrontpicTopLeftCorner
	call EnableLCD
	call WaitBGMap
	call Pokedex_ApplyUsualPals
	ret

Pokedex_RedisplayDexEntry:
	call Pokedex_DrawDexEntryScreenBG
	call ClearSprites	
	call Pokedex_GetSelectedMon
	farcall DisplayDexEntry
	ret

Pokedex_InitOptionScreen:
	call Pokedex_ResetBGMapMode
	call ClearSprites
	call Pokedex_DrawOptionScreenBG
	call Pokedex_InitArrowCursor
	ld a, [wCurDexMode] ; Index of the topmost visible item in a scrolling menu ???
	ld [wDexArrowCursorPosIndex], a
	call Pokedex_DisplayModeDescription
	call WaitBGMap
	ld a, SCGB_POKEDEX_SEARCH_OPTION
	call Pokedex_GetSGBLayout
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateOptionScreen:
	ld a, [wUnlockedUnownMode]
	and a
	jr nz, .okay
	ld de, .NoUnownModeArrowCursorData
	jr .okay2
.okay
	ld de, .ArrowCursorData
.okay2
	call Pokedex_MoveArrowCursor
	call c, Pokedex_DisplayModeDescription
	ld hl, hJoyPressed
	ld a, [hl]
	and SELECT | B_BUTTON
	jr nz, .return_to_main_screen
	ld a, [hl]
	and A_BUTTON
	jr nz, .do_menu_action
	ret

.do_menu_action
	ld a, [wDexArrowCursorPosIndex]
	ld hl, .MenuActionJumptable
	call Pokedex_LoadPointer
	jp hl

.return_to_main_screen
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

.NoUnownModeArrowCursorData:
	db D_UP | D_DOWN, 3
	dwcoord 2,  4 ; NEW
	dwcoord 2,  6 ; OLD
	dwcoord 2,  8 ; ABC

.ArrowCursorData:
	db D_UP | D_DOWN, 4
	dwcoord 2,  4 ; NEW
	dwcoord 2,  6 ; OLD
	dwcoord 2,  8 ; ABC
	dwcoord 2, 10 ; UNOWN

.MenuActionJumptable:
	dw .MenuAction_NewMode
	dw .MenuAction_OldMode
	dw .MenuAction_ABCMode
	dw .MenuAction_UnownMode

.MenuAction_NewMode:
	ld b, DEXMODE_NEW
	jr .ChangeMode

.MenuAction_OldMode:
	ld b, DEXMODE_OLD
	jr .ChangeMode

.MenuAction_ABCMode:
	ld b, DEXMODE_ABC

.ChangeMode:
	ld a, [wCurDexMode]
	cp b
	jr z, .skip_changing_mode ; Skip if new mode is same as current.

	ld a, b
	ld [wCurDexMode], a
	call Pokedex_OrderMonsByMode
	call Pokedex_DisplayChangingModesMessage
	xor a
	ld [wDexListingScrollOffset], a
	ld [wDexListingCursor], a
	call Pokedex_InitCursorPosition

.skip_changing_mode
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

.MenuAction_UnownMode:
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_UNOWN_MODE
	ld [wJumptableIndex], a
	ret

Pokedex_InitSearchScreen:
	call Pokedex_ResetBGMapMode
	call ClearSprites
	call Pokedex_DrawSearchScreenBG
	call Pokedex_InitArrowCursor
	ld a, NORMAL + 1
	ld [wDexSearchMonType1], a
	xor a
	ld [wDexSearchMonType2], a
	call Pokedex_PlaceSearchScreenTypeStrings
	xor a
	ld [wDexSearchSlowpokeFrame], a
;;; erosunica: moved before DoDexSearchSlowpokeFrame
	call WaitBGMap
	ld a, SCGB_POKEDEX_SEARCH_OPTION
	call Pokedex_GetSGBLayout
;;;
	call LoadOBPPal
	farcall DoDexSearchSlowpokeFrame
	call Pokedex_IncrementDexPointer
	ret

LoadOBPPal:
	ldh a, [hCGB]
	and a
	ret nz
	ld a, %11100100
	ldh [rOBP0], a
	ret

Pokedex_UpdateSearchScreen:
	ld de, .ArrowCursorData
	call Pokedex_MoveArrowCursor
	call Pokedex_UpdateSearchMonType
	call c, Pokedex_PlaceSearchScreenTypeStrings
	ld hl, hJoyPressed
	ld a, [hl]
	and START | B_BUTTON
	jr nz, .cancel
	ld a, [hl]
	and A_BUTTON
	jr nz, .do_menu_action
	ret

.do_menu_action
	ld a, [wDexArrowCursorPosIndex]
	ld hl, .MenuActionJumptable
	call Pokedex_LoadPointer
	jp hl

.cancel
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

.ArrowCursorData:
	db D_UP | D_DOWN, 4
	dwcoord 7, 5  ; TYPE 1
	dwcoord 7, 8  ; TYPE 2
	dwcoord 2, 13 ; BEGIN SEARCH
	dwcoord 2, 15 ; CANCEL

.MenuActionJumptable:
	dw .MenuAction_MonSearchType
	dw .MenuAction_MonSearchType
	dw .MenuAction_BeginSearch
	dw .MenuAction_Cancel

.MenuAction_MonSearchType:
	call Pokedex_NextSearchMonType
	call Pokedex_PlaceSearchScreenTypeStrings
	ret

.MenuAction_BeginSearch:
	call Pokedex_SearchForMons
	farcall AnimateDexSearchSlowpoke
	ld a, [wDexSearchResultCount]
	and a
	jr nz, .show_search_results

; No mon with matching types was found.
	call Pokedex_OrderMonsByMode
	call Pokedex_DisplayTypeNotFoundMessage
	call Pokedex_ResetBGMapMode
	call Pokedex_DrawSearchScreenBG
	call Pokedex_InitArrowCursor
	call Pokedex_PlaceSearchScreenTypeStrings
	call WaitBGMap
	ret

.show_search_results
	ld [wDexListingEnd], a
	ld a, [wDexListingScrollOffset]
	ld [wDexListingScrollOffsetBackup], a
	ld a, [wDexListingCursor]
	ld [wDexListingCursorBackup], a
	ld a, [wPrevDexEntry]
	ld [wPrevDexEntryBackup], a
	xor a
	ld [wDexListingScrollOffset], a
	ld [wDexListingCursor], a
	ld de, SlowpokeOpenMouth
	ld hl, vTiles0 tile $11
	lb bc, BANK(SlowpokeOpenMouth), 1
	call Get2bpp	
	hlcoord 4, 4
	ld [hl], $6d ; bulb
	hlcoord 4, 5
	ld [hl], $6e ; bulb	
	ld c, 64
	call DelayFrames
	call Pokedex_BlackOutBG
	ld de, SlowpokeClosedMouth
	ld hl, vTiles0 tile $11
	lb bc, BANK(SlowpokeClosedMouth), 1
	call Get2bpp	
	ld a, DEXSTATE_SEARCH_RESULTS_SCR
	ld [wJumptableIndex], a
	ret

.MenuAction_Cancel:
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_MAIN_SCR
	ld [wJumptableIndex], a
	ret

Pokedex_InitSearchResultsScreen:
	call Pokedex_ResetBGMapMode
	xor a
	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ld a, 4
	ld [wDexListingHeight], a
	call Pokedex_DrawSearchResultsScreenBG
	call Pokedex_PrintListing
	call Pokedex_PlaceSearchResultsTypeStrings
	call WaitBGMap
	call Pokedex_UpdateSearchResultsCursorOAM
	ld a, -1
	ld [wCurPartySpecies], a
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateSearchResultsScreen:
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .return_to_search_screen
	ld a, [hl]
	and A_BUTTON
	jr nz, .go_to_dex_entry
	call Pokedex_ListingHandleDPadInput
	ret nc
	call Pokedex_UpdateSearchResultsCursorOAM
	call Pokedex_ResetBGMapMode
	call Pokedex_LoadSelectedMonTiles
	call Pokedex_PrintListing
	call Pokedex_SetBGMapMode3
	call Pokedex_ResetBGMapMode
	ret

.go_to_dex_entry
	call Pokedex_LoadSelectedMonTiles
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	ret z
	ld a, DEXSTATE_DEX_ENTRY_SCR
	ld [wJumptableIndex], a
	ld a, DEXSTATE_SEARCH_RESULTS_SCR
	ld [wPrevDexEntryJumptableIndex], a
	ret

.return_to_search_screen
	ld a, [wDexListingScrollOffsetBackup]
	ld [wDexListingScrollOffset], a
	ld a, [wDexListingCursorBackup]
	ld [wDexListingCursor], a
	ld a, [wPrevDexEntryBackup]
	ld [wPrevDexEntry], a
	call Pokedex_BlackOutBG
	call Pokedex_OrderMonsByMode
	ld a, DEXSTATE_SEARCH_SCR
	ld [wJumptableIndex], a
	ret

Pokedex_InitUnownMode:
	xor a
	ld [wBoxAlignment], a
	call Pokedex_LoadUnownFont
	call Pokedex_DrawUnownModeBG
	xor a
	ld [wDexCurUnownIndex], a
	call Pokedex_LoadUnownFrontpicTiles
	call Pokedex_UnownModePlaceCursor
	farcall PrintUnownWord
	call WaitBGMap
	ld a, SCGB_POKEDEX_UNOWN_MODE
	call Pokedex_GetSGBLayout
	call Pokedex_IncrementDexPointer
	ret

Pokedex_UpdateUnownMode:
	ld hl, hJoyPressed
	ld a, [hl]
	and A_BUTTON | B_BUTTON
	jr nz, .a_b
	call Pokedex_UnownModeHandleDPadInput
	ret

.a_b
	call Pokedex_BlackOutBG
	ld a, DEXSTATE_OPTION_SCR
	ld [wJumptableIndex], a
	call DelayFrame

.decompress
	ld hl, PokedexLZ
	ld de, vTiles2 tile $31
	lb bc, BANK(PokedexLZ), 58
	call DecompressRequest2bpp

.done
	ld a, $1
	ld [wBoxAlignment], a
	ret

Pokedex_UnownModeHandleDPadInput:
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ret

.right
	ld a, [wDexUnownCount]
	ld e, a
	ld hl, wDexCurUnownIndex
	ld a, [hl]
	inc a
	cp e
	ret nc
	ld a, [hl]
	inc [hl]
	jr .update

.left
	ld hl, wDexCurUnownIndex
	ld a, [hl]
	and a
	ret z
	ld a, [hl]
	dec [hl]

.update
	push af
	call Pokedex_ResetBGMapMode
	pop af
	call Pokedex_UnownModeEraseCursor
	call Pokedex_LoadUnownFrontpicTiles
	call Pokedex_UnownModePlaceCursor
	farcall PrintUnownWord
	ld a, $1
	ldh [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	ret

Pokedex_UnownModeEraseCursor:
	ld c, " "
	jr Pokedex_UnownModeUpdateCursorGfx

Pokedex_UnownModePlaceCursor:
	ld a, [wDexCurUnownIndex]
	ld c, FIRST_UNOWN_CHAR + NUM_UNOWN ; diamond cursor

Pokedex_UnownModeUpdateCursorGfx:
	ld e, a
	ld d, 0
	ld hl, UnownModeLetterAndCursorCoords + 2
rept 4
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], c
	ret

Pokedex_NextOrPreviousDexEntry:
	ld a, [wDexListingCursor]
	ld [wBackupDexListingCursor], a
	ld a, [wDexListingScrollOffset]
	ld [wBackupDexListingPage], a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	and a
	ret

.up
	ld a, [wDexListingHeight]
	ld d, a
	ld a, [wDexListingEnd]
	ld e, a
	call Pokedex_ListingMoveCursorUp
	jr nc, .nope
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	jr nz, .yep
	jr .up

.down
	ld a, [wDexListingHeight]
	ld d, a
	ld a, [wDexListingEnd]
	ld e, a
	call Pokedex_ListingMoveCursorDown
	jr nc, .nope
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	jr nz, .yep
	jr .down

.yep
	scf
	ret

.nope
	ld a, [wBackupDexListingCursor]
	ld [wDexListingCursor], a
	ld a, [wBackupDexListingPage]
	ld [wDexListingScrollOffset], a
	and a
	ret

Pokedex_ListingHandleDPadInput:
; Handles D-pad input for a list of Pokémon.
	ld a, [wDexListingHeight]
	ld d, a
	ld a, [wDexListingEnd]
	ld e, a
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Pokedex_ListingMoveCursorUp
	ld a, [hl]
	and D_DOWN
	jr nz, Pokedex_ListingMoveCursorDown
	ld a, d
	cp e
	jr nc, Pokedex_ListingPosStayedSame
	ld a, [hl]
	and D_LEFT
	jr nz, Pokedex_ListingMoveUpOnePage
	ld a, [hl]
	and D_RIGHT
	jr nz, Pokedex_ListingMoveDownOnePage
	jr Pokedex_ListingPosStayedSame

Pokedex_ListingMoveCursorUp:
	ld hl, wDexListingCursor
	ld a, [hl]
	and a
	jr z, .try_scrolling
	dec [hl]
	jr Pokedex_ListingPosChanged
.try_scrolling
	ld hl, wDexListingScrollOffset
	ld a, [hl]
	and a
	jr z, Pokedex_ListingPosStayedSame
	dec [hl]
	jr Pokedex_ListingPosChanged

Pokedex_ListingMoveCursorDown:
	ld hl, wDexListingCursor
	ld a, [hl]
	inc a
	cp e
	jr nc, Pokedex_ListingPosStayedSame
	cp d
	jr nc, .try_scrolling
	inc [hl]
	jr Pokedex_ListingPosChanged
.try_scrolling
	ld hl, wDexListingScrollOffset
	add [hl]
	cp e
	jr nc, Pokedex_ListingPosStayedSame
	inc [hl]
	jr Pokedex_ListingPosChanged

Pokedex_ListingMoveUpOnePage:
	ld hl, wDexListingScrollOffset
	ld a, [hl]
	and a
	jr z, Pokedex_ListingPosStayedSame
	cp d
	jr nc, .not_near_top
; If we're already less than page away from the top, go to the top.
	xor a
	ld [hl], a
	jr Pokedex_ListingPosChanged
.not_near_top
	sub d
	ld [hl], a
	jr Pokedex_ListingPosChanged

Pokedex_ListingMoveDownOnePage:
; When moving down a page, the return value always report a change in position.
	ld hl, wDexListingScrollOffset
	ld a, d
	add a
	add [hl]
	jr c, .near_bottom
	cp e
	jr c, .not_near_bottom
.near_bottom
	ld a, e
	sub d
	ld [hl], a
	jr Pokedex_ListingPosChanged
.not_near_bottom
	ld a, [hl]
	add d
	ld [hl], a
	jr Pokedex_ListingPosChanged

Pokedex_ListingPosStayedSame:
	and a
	ret

Pokedex_ListingPosChanged:
	scf
	ret

Pokedex_FillColumn:
; Fills a column starting at hl, going downwards.
; b is the height of the column, and a is the tile it's filled with.
	push de
	ld de, SCREEN_WIDTH
.loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .loop
	pop de
	ret

Pokedex_DrawMainScreenBG:
; Draws the left sidebar and the bottom bar on the main screen.
	call Pokedex_FillBackgroundColor2
	hlcoord 13, 10
	lb bc, 6, 5
	call Pokedex_PlaceBorder ; Seen / Owned Box
	hlcoord 0, 0
	lb bc, 16, 11
	call Pokedex_PlaceBorder ; List Box	
	hlcoord 14, 12
	ld de, String_SEEN
	call Pokedex_PlaceString
	ld hl, wPokedexSeen
	ld b, wEndPokedexSeen - wPokedexSeen
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 16, 13
	lb bc, 1, 3
	call PrintNum
	hlcoord 14, 15
	ld de, String_OWN
	call Pokedex_PlaceString
	ld hl, wPokedexCaught
	ld b, wEndPokedexCaught - wPokedexCaught
	call CountSetBits
	ld de, wNumSetBits
	hlcoord 16, 16
	lb bc, 1, 3
	call PrintNum
	hlcoord 13, 9
	ld de, String_SELECT_OPTION
	call Pokedex_PlaceString	
	ret

String_SEEN:
	db "SEEN", -1
String_OWN:
	db "OWNED", -1
String_SELECT_OPTION:
	db $42, $43, $44, $45, $46, $47, $48, -1

Pokedex_DrawDexEntryScreenBG:
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 0
	lb bc, 16, 18
	call Pokedex_PlaceBorder
	hlcoord 1, 15
	ld bc, 18
	ld a, $61
	call ByteFill
	hlcoord 9, 6
	ld de, .Height
	call Pokedex_PlaceString
	hlcoord 9, 8
	ld de, .Weight
	call Pokedex_PlaceString
	hlcoord 2, 16
	ld de, .MenuItems
	call Pokedex_PlaceString
	ret

.Height:
	db "HT  ?", $5e, "??", $5f, -1 ; HT  ?'??"
.Weight:
	db "WT   ???lb", -1 ; WT   ???lb
.MenuItems:
	db "PAGE AREA CRY PRT", -1

Pokedex_DrawOptionScreenBG:
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 2
	lb bc, 8, 18
	call Pokedex_PlaceBorder
	hlcoord 0, 12
	lb bc, 4, 18
	call Pokedex_PlaceBorder
	hlcoord 0, 1
	ld de, .Title
	call Pokedex_PlaceString
	hlcoord 3, 4
	ld de, .Modes
	call PlaceString
	ld a, [wUnlockedUnownMode]
	and a
	ret z
	hlcoord 3, 10
	ld de, .UnownMode
	call PlaceString
	ret

.Title:
	db $3b, " OPTION ", $3c, -1

.Modes:
	db   "NEW #DEX MODE"
	next "OLD #DEX MODE"
	next "A to Z MODE"
	db   "@"

.UnownMode:
	db "UNOWN MODE@"

Pokedex_DrawSearchScreenBG:
	call Pokedex_FillBackgroundColor2
	hlcoord 0, 2
	lb bc, 14, 18
	call Pokedex_PlaceBorder
	hlcoord 0, 1
	ld de, .Title
	call Pokedex_PlaceString
	hlcoord 8, 6
	ld de, .TypeLeftRightArrows
	call Pokedex_PlaceString
	hlcoord 8, 9
	ld de, .TypeLeftRightArrows
	call Pokedex_PlaceString
	hlcoord 8, 5
	ld de, .Type1
	call PlaceString
	hlcoord 8, 8
	ld de, .Type2
	call PlaceString
	hlcoord 3, 13
	ld de, .Menu
	call PlaceString
	ret

.Title:
	db $3b, " SEARCH ", $3c, -1

.TypeLeftRightArrows:
	db $3d, "        ", $3e, -1

.Type1:
	db   "TYPE1@"
	
.Type2:
	db   "TYPE2@"

.Menu:
	db   "BEGIN SEARCH!!"
	next "CANCEL"
	db   "@"

Pokedex_DrawSearchResultsScreenBG:
	call Pokedex_FillBackgroundColor2
	
	hlcoord 1, 1
	lb bc, 9, 11
	ld a, " "
	call Pokedex_FillBox
	
	hlcoord 0, 0
	ld [hl], $33
	hlcoord 0, 10
	ld [hl], $38
	hlcoord 0, 11
	lb bc, 5, 18
	call Pokedex_PlaceBorder
	ld a, $34 ; borde superior del cuadro sup/izq
	hlcoord 1, 0
	ld bc, 11
	call ByteFill
	ld a, $39 ; borde inferior del cuadro sup/izq
	hlcoord 1, 10
	ld bc, 11
	call ByteFill
	hlcoord 6, 0
	ld [hl], $3f ; arrow
	hlcoord 6, 10
	ld [hl], $40 ; arrow
	hlcoord 12, 9
	ld [hl], $68
	hlcoord 12, 10
	ld [hl], $69
	
	hlcoord 12, 0
	lb bc, 7, 7
	call Pokedex_PlaceSearchPicBorder
	
	hlcoord 0, 1
	ld b, 9
	ld a, $36
	call Pokedex_FillColumn
	
	hlcoord 1, 12
	ld de, .BottomWindowText
	call PlaceString
	ld de, wDexSearchResultCount
	hlcoord 1, 16
	lb bc, 1, 3
	call PrintNum
	call Pokedex_LoadSelectedMonTiles
;	call Pokedex_PlaceFrontpicTopRightCorner
	ret

.BottomWindowText:
	db   "SEARCH RESULTS"
	next "  TYPE"
	next "    FOUND!"
	db   "@"

Pokedex_PlaceSearchResultsTypeStrings:
	ld a, [wDexSearchMonType1]
	hlcoord 9, 14
	call Pokedex_PlaceTypeString
	ld a, [wDexSearchMonType1]
	ld b, a
	ld a, [wDexSearchMonType2]
	and a
	jr z, .done
	cp b
	jr z, .done
	hlcoord 11, 15
	call Pokedex_PlaceTypeString
	hlcoord 10, 15
	ld [hl], "/"
.done
	ret

Pokedex_DrawUnownModeBG:
	call Pokedex_FillBackgroundColor2
	hlcoord 2, 1
	lb bc, 10, 13
	call Pokedex_PlaceBorder
	hlcoord 2, 14
	lb bc, 1, 13
	call Pokedex_PlaceBorder
	hlcoord 2, 15
	ld [hl], $3d
	hlcoord 16, 15
	ld [hl], $3e
	hlcoord 6, 5
	call Pokedex_PlaceFrontpicAtHL
	ld de, 0
	ld b, 0
	ld c, NUM_UNOWN
.loop
	ld hl, wUnownDex
	add hl, de
	ld a, [hl]
	and a
	jr z, .done
	push af
	ld hl, UnownModeLetterAndCursorCoords
rept 4
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	add FIRST_UNOWN_CHAR - 1 ; Unown A
	ld [hl], a
	inc de
	inc b
	dec c
	jr nz, .loop
.done
	ld a, b
	ld [wDexUnownCount], a
	ret

UnownModeLetterAndCursorCoords:
; entries correspond to Unown forms
;           letter, cursor
	dwcoord   4,11,   3,11 ; A
	dwcoord   4,10,   3,10 ; B
	dwcoord   4, 9,   3, 9 ; C
	dwcoord   4, 8,   3, 8 ; D
	dwcoord   4, 7,   3, 7 ; E
	dwcoord   4, 6,   3, 6 ; F
	dwcoord   4, 5,   3, 5 ; G
	dwcoord   4, 4,   3, 4 ; H
	dwcoord   4, 3,   3, 2 ; I
	dwcoord   5, 3,   5, 2 ; J
	dwcoord   6, 3,   6, 2 ; K
	dwcoord   7, 3,   7, 2 ; L
	dwcoord   8, 3,   8, 2 ; M
	dwcoord   9, 3,   9, 2 ; N
	dwcoord  10, 3,  10, 2 ; O
	dwcoord  11, 3,  11, 2 ; P
	dwcoord  12, 3,  12, 2 ; Q
	dwcoord  13, 3,  13, 2 ; R
	dwcoord  14, 3,  15, 2 ; S
	dwcoord  14, 4,  15, 4 ; T
	dwcoord  14, 5,  15, 5 ; U
	dwcoord  14, 6,  15, 6 ; V
	dwcoord  14, 7,  15, 7 ; W
	dwcoord  14, 8,  15, 8 ; X
	dwcoord  14, 9,  15, 9 ; Y
	dwcoord  14,10,  15,10 ; Z

Pokedex_FillBackgroundColor2:
	hlcoord 0, 0
	ld a, $32
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call ByteFill
	ret

Pokedex_PlaceFrontpicTopLeftCorner:
	hlcoord 1, 1
	jr Pokedex_PlaceFrontpicAtHL
Pokedex_PlaceFrontpicTopRightCorner:
	hlcoord 13, 1
Pokedex_PlaceFrontpicAtHL:
	lb bc, 7, 7
	predef PlaceGraphic
	ret

Pokedex_PlaceString:
.loop
	ld a, [de]
	cp -1
	ret z
	inc de
	ld [hli], a
	jr .loop

Pokedex_PlaceBorder:
	push hl
	ld a, $33
	ld [hli], a
	ld d, $34
	call FillRow
	ld a, $35
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $36
	ld [hli], a
	ld d, $7f
	call FillRow
	ld a, $37
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $38
	ld [hli], a
	ld d, $39
	call FillRow
	ld a, $3a
	ld [hl], a
	ret
	
Pokedex_PlaceMainBorder1:
	push hl
	ld a, $59
	ld [hli], a
	ld d, $64
	call FillRow
	ld a, $35
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $65
	ld [hli], a
	ld d, $7f
	call FillRow
	ld a, $37
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $41
	ld [hli], a
	ld d, $39
	call FillRow
	ld a, $3a
	ld [hl], a
	ret

Pokedex_PlaceMainBorder2:
	push hl
	ld a, $66
	ld [hli], a
	ld d, $62
	call FillRow
	ld a, $63
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $5a
	ld [hli], a
	ld d, $7f
	call FillRow
	ld a, $37
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $5b
	ld [hli], a
	ld d, $39
	call FillRow
	ld a, $3a
	ld [hl], a
	ret

Pokedex_PlaceSearchPicBorder:
	push hl
	ld a, $59
	ld [hli], a
	ld d, $64
	call FillRow
	ld a, $35
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, $65
	ld [hli], a
	ld d, $7f
	call FillRow
	ld a, $37
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, $6a
	ld [hli], a
	ld d, $6b
	call FillRow
	ld a, $3a
	ld [hl], a
	ret

FillRow:
	ld e, c
.row_loop
	ld a, e
	and a
	ret z
	ld a, d
	ld [hli], a
	dec e
	jr .row_loop

Pokedex_PrintListing: ; erosunica: removed useless check
; Prints the list of Pokémon on the main Pokédex screen.
; Clear (2 * [wDexListingHeight] + 1) by 11 box starting at 0,1
	ld c, 11
	hlcoord 1, 1
	ld a, [wDexListingHeight]
	add a
	inc a
	ld b, a
	ld a, " "
	call Pokedex_FillBox

; Load de with wPokedexOrder + [wDexListingScrollOffset]
	ld a, [wDexListingScrollOffset]
	ld e, a
	ld d, $0
	ld hl, wPokedexOrder
	add hl, de
	ld e, l
	ld d, h
	ld a, [wCurDexMode]
	cp DEXMODE_OLD
	jr z, .olddex
	hlcoord 1, 2
	jr .cont
.olddex
	hlcoord 1, 3
.cont
	ld a, [wDexListingHeight]
.loop
	push af
	ld a, [de]
	ld [wTempSpecies], a ; also sets wNamedObjectIndexBuffer
	push de
	push hl
	call .PrintEntry
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop de
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

.PrintEntry:
; Prints one entry in the list of Pokémon on the main Pokédex screen.
	and a
	ret z
	call Pokedex_PrintNumberIfOldMode
	call Pokedex_PlaceDefaultStringIfNotSeen
	ret c
	call Pokedex_PlaceCaughtSymbolIfCaught
	push hl
	call GetPokemonName
	pop hl
	call PlaceString
	ret

Pokedex_PrintNumberIfOldMode:
	ld a, [wCurDexMode]
	cp DEXMODE_OLD
	jr z, .printnum
	ret

.printnum
	push hl
	ld de, -SCREEN_WIDTH
	add hl, de
	ld de, wTempSpecies
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	pop hl
	ret

Pokedex_PlaceCaughtSymbolIfCaught:
	call Pokedex_CheckCaught
	jr nz, .place_caught_symbol
	inc hl
	ret

.place_caught_symbol
	ld a, $31
	ld [hli], a
	ret

Pokedex_PlaceDefaultStringIfNotSeen:
	call Pokedex_CheckSeen
	ret nz
	inc hl
	ld de, .NameNotSeen
	call PlaceString
	scf
	ret

.NameNotSeen:
	db "-----@"

Pokedex_GetSelectedMon:
; Gets the species of the currently selected Pokémon. This corresponds to the
; position of the cursor in the main listing, but this function can be used
; on all Pokédex screens.
	ld a, [wDexListingCursor]
	ld hl, wDexListingScrollOffset
	add [hl]
	ld e, a
	ld d, $0
	ld hl, wPokedexOrder
	add hl, de
	ld a, [hl]
	ld [wTempSpecies], a
	ret

Pokedex_CheckCaught:
	push de
	push hl
	ld a, [wTempSpecies]
	dec a
	call CheckCaughtMon
	pop hl
	pop de
	ret

Pokedex_CheckSeen:
	push de
	push hl
	ld a, [wTempSpecies]
	dec a
	call CheckSeenMon
	pop hl
	pop de
	ret

Pokedex_OrderMonsByMode:
	ld hl, wPokedexOrder
	ld bc, wPokedexOrderEnd - wPokedexOrder
	xor a
	call ByteFill
	ld a, [wCurDexMode]
	ld hl, .Jumptable
	call Pokedex_LoadPointer
	jp hl

.Jumptable:
	dw .NewMode
	dw .OldMode
	dw Pokedex_ABCMode

.NewMode:
	ld de, NewPokedexOrder
	ld hl, wPokedexOrder
	ld c, NUM_POKEMON
.loopnew
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loopnew
	call .FindLastSeen
	ret

.OldMode:
	ld hl, wPokedexOrder
	ld a, $1
	ld c, NUM_POKEMON
.loopold
	ld [hli], a
	inc a
	dec c
	jr nz, .loopold
	call .FindLastSeen
	ret

.FindLastSeen:
	ld hl, wPokedexOrder + NUM_POKEMON - 1
	ld d, NUM_POKEMON
	ld e, d
.loopfindend
	ld a, [hld]
	ld [wTempSpecies], a
	call Pokedex_CheckSeen
	jr nz, .foundend
	dec d
	dec e
	jr nz, .loopfindend
.foundend
	ld a, d
	ld [wDexListingEnd], a
	ret

Pokedex_ABCMode:
	xor a
	ld [wDexListingEnd], a
	ld hl, wPokedexOrder
	ld de, AlphabeticalPokedexOrder
	ld c, NUM_POKEMON
.loop1abc
	push bc
	ld a, [de]
	ld [wTempSpecies], a
	call Pokedex_CheckSeen
	jr z, .skipabc
	ld a, [wTempSpecies]
	ld [hli], a
	ld a, [wDexListingEnd]
	inc a
	ld [wDexListingEnd], a

.skipabc
	inc de
	pop bc
	dec c
	jr nz, .loop1abc
	ld a, [wDexListingEnd]
	ld c, 0
.loop2abc
	cp NUM_POKEMON
	jr z, .doneabc
	ld [hl], c
	inc hl
	inc a
	jr .loop2abc

.doneabc
	ret

INCLUDE "data/pokemon/dex_order_alpha.asm"

INCLUDE "data/pokemon/dex_order_new.asm"

Pokedex_DisplayModeDescription:
	call Pokedex_ResetBGMapMode
	hlcoord 0, 12
	lb bc, 4, 18
	call Pokedex_PlaceBorder
	ld a, [wDexArrowCursorPosIndex]
	ld hl, .Modes
	call Pokedex_LoadPointer
	ld e, l
	ld d, h
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ldh [hBGMapMode], a
	ret

.Modes:
	dw .NewMode
	dw .OldMode
	dw .ABCMode
	dw .UnownMode

.NewMode:
	db   "<PK><MN> are listed by"
	next "evolution type.@"

.OldMode:
	db   "<PK><MN> are listed by"
	next "official type.@"

.ABCMode:
	db   "<PK><MN> are listed"
	next "alphabetically.@"

.UnownMode:
	db   "UNOWN are listed"
	next "in catching order.@"

Pokedex_DisplayChangingModesMessage:
	call Pokedex_ResetBGMapMode
	hlcoord 0, 12
	lb bc, 4, 18
	call Pokedex_PlaceBorder
	ld de, String_ChangingModesPleaseWait
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ldh [hBGMapMode], a
	ld c, 64
	call DelayFrames
	ld de, SFX_CHANGE_DEX_MODE
	call PlaySFX
	ld c, 64
	call DelayFrames
	ret

String_ChangingModesPleaseWait:
	db   "Changing modes."
	next "Please wait.@"

Pokedex_UpdateSearchMonType:
	ld a, [wDexArrowCursorPosIndex]
	cp 2
	jr nc, .no_change
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, Pokedex_PrevSearchMonType
	ld a, [hl]
	and D_RIGHT
	jr nz, Pokedex_NextSearchMonType
.no_change
	and a
	ret

Pokedex_PrevSearchMonType:
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr nz, .type2

	ld hl, wDexSearchMonType1
	ld a, [hl]
	cp 1
	jr z, .wrap_around
	dec [hl]
	jr .done

.type2
	ld hl, wDexSearchMonType2
	ld a, [hl]
	and a
	jr z, .wrap_around
	dec [hl]
	jr .done

.wrap_around
	ld [hl], NUM_TYPES - 1

.done
	scf
	ret

Pokedex_NextSearchMonType:
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr nz, .type2

	ld hl, wDexSearchMonType1
	ld a, [hl]
	cp NUM_TYPES - 1
	jr nc, .type1_wrap_around
	inc [hl]
	jr .done
.type1_wrap_around
	ld [hl], 1
	jr .done

.type2
	ld hl, wDexSearchMonType2
	ld a, [hl]
	cp NUM_TYPES - 1
	jr nc, .type2_wrap_around
	inc [hl]
	jr .done
.type2_wrap_around
	ld [hl], 0

.done
	scf
	ret

Pokedex_PlaceSearchScreenTypeStrings:
	call Pokedex_ResetBGMapMode
	hlcoord 9, 6
	lb bc, 1, 8
	ld a, " "
	call Pokedex_FillBox
	hlcoord 9, 9
	lb bc, 1, 8
	ld a, " "
	call Pokedex_FillBox
	ld a, [wDexSearchMonType1]
	hlcoord 9, 6
	call Pokedex_PlaceTypeString
	ld a, [wDexSearchMonType2]
	hlcoord 9, 9
	call Pokedex_PlaceTypeString
	ld a, $1
	ldh [hBGMapMode], a
	ret

Pokedex_PlaceTypeString:
	push hl
	ld e, a
	ld d, 0
	ld hl, PokedexTypeSearchStrings
rept 9
	add hl, de
endr
	ld e, l
	ld d, h
	pop hl
	call PlaceString
	ret

INCLUDE "data/types/search_strings.asm"

Pokedex_SearchForMons:
	ld a, [wDexSearchMonType2]
	and a
	call nz, .Search
	ld a, [wDexSearchMonType1]
	and a
	call nz, .Search
	ret

.Search:
	dec a
	ld e, a
	ld d, 0
	ld hl, PokedexTypeSearchConversionTable
	add hl, de
	ld a, [hl]
	ld [wDexConvertedMonType], a
	ld hl, wPokedexOrder
	ld de, wPokedexOrder
	ld c, NUM_POKEMON
	xor a
	ld [wDexSearchResultCount], a
.loop
	push bc
	ld a, [hl]
	and a
	jr z, .next_mon
	ld [wTempSpecies], a
	ld [wCurSpecies], a
	call Pokedex_CheckCaught
	jr z, .next_mon
	push hl
	push de
	call GetBaseData
	pop de
	pop hl
	ld a, [wDexConvertedMonType]
	ld b, a
	ld a, [wBaseType1]
	cp b
	jr z, .match_found
	ld a, [wBaseType2]
	cp b
	jr nz, .next_mon

.match_found
	ld a, [wTempSpecies]
	ld [de], a
	inc de
	ld a, [wDexSearchResultCount]
	inc a
	ld [wDexSearchResultCount], a

.next_mon
	inc hl
	pop bc
	dec c
	jr nz, .loop

	ld l, e
	ld h, d
	ld a, [wDexSearchResultCount]
	ld c, 0

.zero_remaining_mons
	cp NUM_POKEMON
	jr z, .done
	ld [hl], c
	inc hl
	inc a
	jr .zero_remaining_mons

.done
	ret

INCLUDE "data/types/search_types.asm"

Pokedex_DisplayTypeNotFoundMessage:
	call Pokedex_ResetBGMapMode
	hlcoord 0, 12
	lb bc, 4, 18
	call Pokedex_PlaceBorder
	ld de, .TypeNotFound
	hlcoord 1, 14
	call PlaceString
	hlcoord 4, 5
	ld [hl], $6c ; drop
	ld a, $1
	ldh [hBGMapMode], a
	ld c, $80
	call DelayFrames
	ret

.TypeNotFound:
	db   "The specified type"
	next "was not found.@"

Pokedex_UpdateCursorOAM:
	ld a, [wCurDexMode]
	cp DEXMODE_OLD
	jp z, Pokedex_PutOldModeCursorOAM
	call Pokedex_PutNewModeABCModeCursorOAM
	ret

Pokedex_PutOldModeCursorOAM:
	ld hl, wDexArrowCursorBlinkCounter
	ld a, [hl]
	inc [hl]
	and $4
	jr z, .blink_on
	ld hl, OldModeCursorBlankOAM
	call Pokedex_LoadCursorOAM
	ret

.blink_on
	ld hl, OldModeCursorOAM
	call Pokedex_LoadCursorOAM
	ret

OldModeCursorOAM: ; erosunica: modded to accommodate the new graphic
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	dbsprite  3,  5,  0, -2, $0c, 7
	dbsprite  4,  5,  0, -2, $0d, 7
	dbsprite  5,  5,  0, -2, $0d, 7
	dbsprite  6,  5,  0, -2, $0d, 7
	dbsprite  7,  5,  0, -2, $0d, 7
	dbsprite  8,  5,  0, -2, $0d, 7
	dbsprite  9,  5,  0, -2, $0d, 7
	dbsprite 10,  5,  0, -2, $0d, 7
	dbsprite 11,  5,  0, -2, $0d, 7
	dbsprite 12,  5,  0, -2, $0c, 7 | X_FLIP
	dbsprite  3,  5,  0,  2, $0c, 7 | Y_FLIP
	dbsprite  4,  5,  0,  2, $0d, 7 | Y_FLIP
	dbsprite  5,  5,  0,  2, $0d, 7 | Y_FLIP
	dbsprite  6,  5,  0,  2, $0d, 7 | Y_FLIP
	dbsprite  7,  5,  0,  2, $0d, 7 | Y_FLIP
	dbsprite  8,  5,  0,  2, $0d, 7 | Y_FLIP
	dbsprite  9,  5,  0,  2, $0d, 7 | Y_FLIP
	dbsprite 10,  5,  0,  2, $0d, 7 | Y_FLIP
	dbsprite 11,  5,  0,  2, $0d, 7 | Y_FLIP
	dbsprite 12,  5,  0,  2, $0c, 7 | Y_FLIP | X_FLIP
	db -1
	
OldModeCursorBlankOAM: ; erosunica: modded to accommodate the new graphic
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	dbsprite  3,  5,  0, -2, $0e, 7
	dbsprite  4,  5,  0, -2, $0e, 7
	dbsprite  5,  5,  0, -2, $0e, 7
	dbsprite  6,  5,  0, -2, $0e, 7
	dbsprite  7,  5,  0, -2, $0e, 7
	dbsprite  8,  5,  0, -2, $0e, 7
	dbsprite  9,  5,  0, -2, $0e, 7
	dbsprite 10,  5,  0, -2, $0e, 7
	dbsprite 11,  5,  0, -2, $0e, 7
	dbsprite 12,  5,  0, -2, $0e, 7 | X_FLIP
	dbsprite  3,  5,  0,  2, $0e, 7 | Y_FLIP
	dbsprite  4,  5,  0,  2, $0e, 7 | Y_FLIP
	dbsprite  5,  5,  0,  2, $0e, 7 | Y_FLIP
	dbsprite  6,  5,  0,  2, $0e, 7 | Y_FLIP
	dbsprite  7,  5,  0,  2, $0e, 7 | Y_FLIP
	dbsprite  8,  5,  0,  2, $0e, 7 | Y_FLIP
	dbsprite  9,  5,  0,  2, $0e, 7 | Y_FLIP
	dbsprite 10,  5,  0,  2, $0e, 7 | Y_FLIP
	dbsprite 11,  5,  0,  2, $0e, 7 | Y_FLIP
	dbsprite 12,  5,  0,  2, $0e, 7 | Y_FLIP | X_FLIP
	db -1

Pokedex_PutNewModeABCModeCursorOAM:
	ld hl, .CursorOAM
	call Pokedex_LoadCursorOAM
	ret

.CursorOAM: ; erosunica: modded to accommodate the new graphic
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	dbsprite  2,  3, -1,  3, $0c, 7
	dbsprite  3,  3, -1,  3, $0d, 7
	dbsprite  4,  3, -1,  3, $0d, 7
	dbsprite  5,  3, -1,  3, $0d, 7
	dbsprite  6,  3, -1,  3, $0d, 7
	;dbsprite  7,  3, -1,  3, $0d, 7
	dbsprite  8,  3,  0,  3, $0d, 7
	dbsprite  9,  3,  0,  3, $0d, 7
	dbsprite 10,  3,  0,  3, $0d, 7
	dbsprite 11,  3,  0,  3, $0d, 7
	dbsprite 12,  3,  0,  3, $0c, 7 | X_FLIP
	dbsprite  2,  4, -1,  3, $0c, 7 | Y_FLIP
	dbsprite  3,  4, -1,  3, $0d, 7 | Y_FLIP
	dbsprite  4,  4, -1,  3, $0d, 7 | Y_FLIP
	dbsprite  5,  4, -1,  3, $0d, 7 | Y_FLIP
	dbsprite  6,  4, -1,  3, $0d, 7 | Y_FLIP
	;dbsprite  7,  4, -1,  3, $0d, 7 | Y_FLIP
	dbsprite  8,  4,  0,  3, $0d, 7 | Y_FLIP
	dbsprite  9,  4,  0,  3, $0d, 7 | Y_FLIP
	dbsprite 10,  4,  0,  3, $0d, 7 | Y_FLIP
	dbsprite 11,  4,  0,  3, $0d, 7 | Y_FLIP
	dbsprite 12,  4,  0,  3, $0c, 7 | Y_FLIP | X_FLIP
	db -1

Pokedex_UpdateSearchResultsCursorOAM:
	ld a, [wCurDexMode]
	cp DEXMODE_OLD
	jp z, Pokedex_PutOldModeCursorOAM
	ld hl, .CursorOAM
	call Pokedex_LoadCursorOAM
	ret

.CursorOAM: ; erosunica: modded to accommodate the new graphic
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	dbsprite  2,  3, -1,  3, $0c, 7
	dbsprite  3,  3, -1,  3, $0d, 7
	dbsprite  4,  3, -1,  3, $0d, 7
	dbsprite  5,  3, -1,  3, $0d, 7
	dbsprite  6,  3, -1,  3, $0d, 7
	;dbsprite  7,  3, -1,  3, $0d, 7
	dbsprite  8,  3,  0,  3, $0d, 7
	dbsprite  9,  3,  0,  3, $0d, 7
	dbsprite 10,  3,  0,  3, $0d, 7
	dbsprite 11,  3,  0,  3, $0d, 7
	dbsprite 12,  3,  0,  3, $0c, 7 | X_FLIP
	dbsprite  2,  4, -1,  3, $0c, 7 | Y_FLIP
	dbsprite  3,  4, -1,  3, $0d, 7 | Y_FLIP
	dbsprite  4,  4, -1,  3, $0d, 7 | Y_FLIP
	dbsprite  5,  4, -1,  3, $0d, 7 | Y_FLIP
	dbsprite  6,  4, -1,  3, $0d, 7 | Y_FLIP
	;dbsprite  7,  4, -1,  3, $0d, 7 | Y_FLIP
	dbsprite  8,  4,  0,  3, $0d, 7 | Y_FLIP
	dbsprite  9,  4,  0,  3, $0d, 7 | Y_FLIP
	dbsprite 10,  4,  0,  3, $0d, 7 | Y_FLIP
	dbsprite 11,  4,  0,  3, $0d, 7 | Y_FLIP
	dbsprite 12,  4,  0,  3, $0c, 7 | Y_FLIP | X_FLIP
	db -1

Pokedex_LoadCursorOAM:
	ld de, wShadowOAMSprite00
.loop
	ld a, [hl]
	cp -1
	ret z
	ld a, [wDexListingCursor]
	and $7
	swap a
	add [hl] ; y
	inc hl
	ld [de], a
	inc de
	ld a, [hli] ; x
	ld [de], a
	inc de
	ld a, [hli] ; tile id
	ld [de], a
	inc de
	ld a, [hli] ; attributes
	ld [de], a
	inc de
	jr .loop

Pokedex_InitArrowCursor:
	xor a
	ld [wDexArrowCursorPosIndex], a
	ld [wDexArrowCursorDelayCounter], a
	ld [wDexArrowCursorBlinkCounter], a
	ret

Pokedex_MoveArrowCursor:
; bc = [de] - 1
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	dec a
	ld c, a
	inc de
	call Pokedex_BlinkArrowCursor

	ld hl, hJoyPressed
	ld a, [hl]
	and D_LEFT | D_UP
	and b
	jr nz, .move_left_or_up
	ld a, [hl]
	and D_RIGHT | D_DOWN
	and b
	jr nz, .move_right_or_down
	ld a, [hl]
	and SELECT
	and b
	jr nz, .select
	call Pokedex_ArrowCursorDelay
	jr c, .no_action
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT | D_UP
	and b
	jr nz, .move_left_or_up
	ld a, [hl]
	and D_RIGHT | D_DOWN
	and b
	jr nz, .move_right_or_down
	jr .no_action

.move_left_or_up
	ld a, [wDexArrowCursorPosIndex]
	and a
	jr z, .no_action
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ld hl, wDexArrowCursorPosIndex
	dec [hl]
	jr .update_cursor_pos

.move_right_or_down
	ld a, [wDexArrowCursorPosIndex]
	cp c
	jr nc, .no_action
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ld hl, wDexArrowCursorPosIndex
	inc [hl]

.update_cursor_pos
	call Pokedex_GetArrowCursorPos
	ld [hl], "▶"
	ld a, 12
	ld [wDexArrowCursorDelayCounter], a
	xor a
	ld [wDexArrowCursorBlinkCounter], a
	scf
	ret

.no_action
	and a
	ret

.select
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ld a, [wDexArrowCursorPosIndex]
	cp c
	jr c, .update
	ld a, -1
.update
	inc a
	ld [wDexArrowCursorPosIndex], a
	jr .update_cursor_pos

Pokedex_GetArrowCursorPos:
	ld a, [wDexArrowCursorPosIndex]
	add a
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pokedex_BlinkArrowCursor:
	ld hl, wDexArrowCursorBlinkCounter
	ld a, [hl]
	inc [hl]
	and $8
	jr z, .blink_on
	call Pokedex_GetArrowCursorPos
	ld [hl], " "
	ret

.blink_on
	call Pokedex_GetArrowCursorPos
	ld [hl], "▶"
	ret

Pokedex_ArrowCursorDelay:
; Updates the delay counter set when moving the arrow cursor.
; Returns whether the delay is active in carry.
	ld hl, wDexArrowCursorDelayCounter
	ld a, [hl]
	and a
	ret z

	dec [hl]
	scf
	ret

Pokedex_FillBox:
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

Pokedex_BlackOutBG:
	call DisableLCD
	ld hl, wBGPals1
	ld bc, 8 palettes
	ld a, $ff
	call ByteFill
	call ClearSprites
	call EnableLCD

Pokedex_ApplyPrintPals:
	ld a, $ff
	call DmgToCgbBGPals
	ld a, $ff
	call DmgToCgbObjPal0
	call DelayFrame
	ret

Pokedex_GetSGBLayout:
	ld b, a
	call GetSGBLayout

Pokedex_ApplyUsualPals:
; This applies the palettes used for most Pokédex screens.
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e0
	call DmgToCgbObjPal0
	ret

Pokedex_LoadPointer:
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Pokedex_LoadSelectedMonTiles:
; Loads the tiles of the currently selected Pokémon.
	call Pokedex_GetSelectedMon
	call Pokedex_CheckSeen
	jr z, .QuestionMark
	ld a, [wFirstUnownSeen]
	ld [wUnownLetter], a
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	call GetBaseData
	ld de, vTiles2
	predef GetMonFrontpic
	ret

.QuestionMark:
	ld a, BANK(sScratch)
	call OpenSRAM
	farcall LoadQuestionMarkPic
	ld hl, vTiles2
	ld de, sScratch
	ld c, 7 * 7
	ldh a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ret

Pokedex_LoadGFX:
	call DisableLCD
	ld hl, vTiles2
	ld bc, $31 tiles
	xor a
	call ByteFill
	call Pokedex_LoadStandardFont
	call LoadFontsExtra
	ld hl, vTiles2 tile $60
	ld bc, $20 tiles

.LoadPokedexLZ:
	ld hl, PokedexLZ
	ld de, vTiles2 tile $31
	call Decompress

.LoadPokedexSlowpokeLZ:
	ld hl, PokedexSlowpokeLZ
	ld de, vTiles0
	call Decompress
	ld a, 6
	call SkipMusic
	call EnableLCD
	ret

Pokedex_LoadStandardFont:
	call LoadStandardFont
	ld hl, vTiles1
	ld bc, $80 tiles
	ret

PokedexLZ:
INCBIN "gfx/pokedex/pokedex.2bpp.lz"

PokedexSlowpokeLZ:
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"

SlowpokeClosedMouth:
INCBIN "gfx/pokedex/slowpoke_mouth1.2bpp"

SlowpokeOpenMouth:
INCBIN "gfx/pokedex/slowpoke_mouth2.2bpp"

Pokedex_CheckSGB:
	ldh a, [hCGB]
	or a
	ret nz
	ldh a, [hSGB]
	dec a
	ret

Pokedex_LoadUnownFont:
	ld a, BANK(sScratch)
	call OpenSRAM
	ld hl, UnownFont
	ld de, sScratch + $188
	ld bc, 39 tiles
	ld a, BANK(UnownFont)
	call FarCopyBytes
	ld hl, sScratch + $188
	ld bc, (NUM_UNOWN + 1) tiles
	ld de, sScratch + $188
	ld hl, vTiles2 tile FIRST_UNOWN_CHAR
	lb bc, BANK(Pokedex_LoadUnownFont), NUM_UNOWN + 1
	call Request2bpp
	call CloseSRAM
	ret

Pokedex_LoadUnownFrontpicTiles:
	ld a, [wUnownLetter]
	push af
	ld a, [wDexCurUnownIndex]
	ld e, a
	ld d, 0
	ld hl, wUnownDex
	add hl, de
	ld a, [hl]
	ld [wUnownLetter], a
	ld a, UNOWN
	ld [wCurPartySpecies], a
	call GetBaseData
	ld de, vTiles2 tile $00
	predef GetMonFrontpic
	pop af
	ld [wUnownLetter], a
	ret

_NewPokedexEntry:
	call Pokedex_ResetBGMapMode
	call DisableLCD
	call LoadStandardFont
	call LoadFontsExtra
	call Pokedex_LoadGFX
	ld a, [wTempSpecies]
	ld [wCurPartySpecies], a
	call Pokedex_DrawDexEntryScreenBG
	call ClearSprites	
	hlcoord 1, 15
	ld bc, 18
	ld a, " "
	call ByteFill
	hlcoord 2, 16
	ld bc, 17
	ld a, " "
	call ByteFill
	farcall DisplayDexEntry ; erosunica: modded, it was DisplayDexEntry
	call EnableLCD
	call WaitBGMap
	call GetBaseData
	ld de, vTiles2
	predef GetMonFrontpic
	ld a, SCGB_POKEDEX
	call Pokedex_GetSGBLayout
	ld a, [wCurPartySpecies]
	call PlayMonCry
	ret

Pokedex_SetBGMapMode3: ; used hBGMapMode 1 instead of mode 3
; hBGMapMode == 0, nothing gets updated; 1 updates tiles; 2 updates attrs
; 3 updates tiles in vBGMap1, 4 updates attrs in vBGMap1
	ld a, $1
	ldh [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ret

Pokedex_ResetBGMapMode:
	xor a
	ldh [hBGMapMode], a
	ret
