# Bugs and Glitches

These are known bugs and glitches in the original Pokémon Gold and Silver games: code that clearly does not work as intended, or that only works in limited circumstances but has the possibility to fail or crash.

Fixes are written in the `diff` format. If you've used Git before, this should look familiar:

```diff
 this is some code
-delete red - lines
+add green + lines
```

All the bugs documented here were fixed in Pokémon Crystal. Any that weren't are already documented in [the pokecrystal repo](https://github.com/pret/pokecrystal/blob/master/docs/bugs_and_glitches.md), so they're not duplicated here.


## Contents

- [Using the Coin Case can cause arbitrary code execution](#using-the-coin-case-can-cause-arbitrary-code-execution)
- [Entering the Hall of Fame without a save file can corrupt the PC boxes](#entering-the-hall-of-fame-without-a-save-file-can-corrupt-the-pc-boxes)
- [The Lucky Number Show does not find winning ID numbers in inactive boxes 10-14](#the-lucky-number-show-does-not-find-winning-id-numbers-in-inactive-boxes-10-14)
- [Present's text overflows when it fails to heal an enemy Pokémon with a long name](#presents-text-overflows-when-it-fails-to-heal-an-enemy-pok%C3%A9mon-with-a-long-name)
- [You can Surf on top of NPCs](#you-can-surf-on-top-of-npcs)
- [You can fish in the water in Cerulean Gym](#you-can-fish-in-the-water-in-cerulean-gym)
- ["Route 15" is not capitalized in a signpost](#route-15-is-not-capitalized-in-a-signpost)


## Using the Coin Case can cause arbitrary code execution

([Videos](https://www.youtube.com/playlist?list=PLO3UplJNTO8YGl0na5FT_6dVYsC27D0rk))

**Fix:** Edit `_CoinCaseCountText` in [data/text/common_3.asm](https://github.com/pret/pokegold/blob/master/data/text/common_3.asm):

```diff
 _CoinCaseCountText::
-; BUG: Using the Coin Case can cause arbitrary code execution (see docs/bugs_and_glitches.md)
 	text "Coins:"
 	line "@"
 	text_decimal wCoins, 2, 4
-	done
+	text_end
```


## Entering the Hall of Fame without a save file can corrupt the PC boxes

([Video](https://www.youtube.com/watch?v=lxkQ7QdfdqM))

**Fix:** Edit `HallOfFame` in [engine/events/halloffame.asm](https://github.com/pret/pokegold/blob/master/engine/events/halloffame.asm):

```diff
-; BUG: Entering the Hall of Fame without a save file can corrupt the PC boxes (see docs/bugs_and_glitches.md)

+	ld a, [wSavedAtLeastOnce]
+	and a
+	jr nz, .saved
+	farcall ErasePreviousSave
+.saved
```


## The Lucky Number Show does not find winning ID numbers in inactive boxes 10-14

**Fix:** Edit `CheckForLuckyNumberWinners` in [engine/events/lucky_number.asm](https://github.com/pret/pokegold/blob/master/engine/events/lucky_number.asm):

```diff
-	; BUG: The Lucky Number Show does not find winning ID numbers in inactive boxes 10-14 (see docs/bugs_and_glitches.md)
-	cp NUM_BOXES_JP
+	cp NUM_BOXES
 	jr c, .BoxesLoop
```


## Present's text overflows when it fails to heal an enemy Pokémon with a long name

**Fix:** Edit `PresentFailedText` in [data/text/battle.asm](https://github.com/pret/pokegold/blob/master/data/text/battle.asm):

```diff
 PresentFailedText:
-; BUG: Present's text overflows when it fails to heal an enemy Pokémon with a long name (see docs/bugs_and_glitches.md)
-	text "<TARGET> can't"
-	line "receive the gift!"
+	text "<TARGET>"
+	line "refused the gift!"
 	prompt
```


## You can Surf on top of NPCs

**Fix:** Edit `SurfFunction` in [engine/events/overworld.asm](https://github.com/pret/pokegold/blob/master/engine/events/overworld.asm):

```diff
 .TrySurf:
-; BUG: You can Surf on top of NPCs (see docs/bugs_and_glitches.md)
 	ld de, ENGINE_FOGBADGE
 	call CheckBadge
 	jr c, .nofogbadge
 	ld hl, wBikeFlags
 	bit BIKEFLAGS_ALWAYS_ON_BIKE_F, [hl]
 	jr nz, .cannotsurf
 	ld a, [wPlayerState]
 	cp PLAYER_SURF
 	jr z, .alreadyfail
 	cp PLAYER_SURF_PIKA
 	jr z, .alreadyfail
 	call GetFacingTileCoord
 	call GetTilePermission
 	cp WATER_TILE
 	jr nz, .cannotsurf
 	call CheckDirection
 	jr c, .cannotsurf
+	farcall CheckFacingObject
+	jr c, .cannotsurf
 	ld a, $1
 	ret
```


## You can fish in the water in Cerulean Gym

**Fix:** Edit `MapGroup_Cerulean` in [data/maps/maps.asm](https://github.com/pret/pokegold/blob/master/data/maps/maps.asm):

```diff
-; BUG: You can fish in the water in Cerulean Gym (see docs/bugs_and_glitches.md)
-	map CeruleanGym, TILESET_PORT, INDOOR, LANDMARK_CERULEAN_CITY, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_SHORE
+	map CeruleanGym, TILESET_PORT, INDOOR, LANDMARK_CERULEAN_CITY, MUSIC_GYM, TRUE, PALETTE_DAY, FISHGROUP_NONE
```


## "Route 15" is not capitalized in a signpost

**Fix:** Edit `Route15SignText` in [maps/Route15.asm](https://github.com/pret/pokegold/blob/master/maps/Route15.asm):

```diff
 Route15SignText:
-; BUG: "Route 15" is not capitalized in a signpost (see docs/bugs_and_glitches.md)
-	text "Route 15"
+	text "ROUTE 15"

	para "FUCHSIA CITY -"
	line "LAVENDER TOWN"
	done
```

(There are many other text changes between Gold/Silver and Crystal, but they are more subjective edits, not definite corrections.)
