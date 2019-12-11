UnknownText_0x1c505e::
	text "Start!"
	done

UnknownText_0x1c5066::
	text "Not enough"
	line "coins."
	prompt

UnknownText_0x1c5079::
	text "Darn… Ran out of"
	line "coins…"
	done

UnknownText_0x1c5092::
	text "Play again?"
	done

UnknownText_0x1c509f::
	text "lined up!"
	line "Won @"
	text_ram wStringBuffer2
	text " coins!"
	done

UnknownText_0x1c50bb::
	text "Darn!"
	done

UnknownText_0x1c5821::
	text_today
	db "@"

UnknownText_0x1c5824::
	text "<……>"
	done

UnknownText_0x1c5827::
	text "You're out of the"
	line "service area."
	prompt

UnknownText_0x1c5847::
	text "Whom do you want"
	line "to call?"
	done

UnknownText_0x1c5862::
	text "Press any button"
	line "to exit."
	done

UnknownText_0x1c587d::
	text "Delete this stored"
	line "phone number?"
	done

UnknownText_0x1c5565::
	text "Huh? Sorry, wrong"
	line "number!"
	done

UnknownText_0x1c5580::
	text "Click!"
	done

UnknownText_0x1c5588::
	text "<……>"
	done

UnknownText_0x1c558b::
	text "That number is out"
	line "of the area."
	done

UnknownText_0x1c55ac::
	text "Just go talk to"
	line "that person!"
	done

UnknownText_0x1c55ca::
	text "Thank you!"
	done

UnknownText_0x1c55d6::
	text "  :"
	done

UnknownText_0x1c55db::
	text "Password OK."
	line "Select CONTINUE &"
	cont "reset settings."
	prompt

UnknownText_0x1c560b::
	text "Wrong password!"
	prompt

UnknownText_0x1c561c::
	text "Reset the clock?"
	done

UnknownText_0x1c562e::
	text "Please enter the"
	line "password."
	done

UnknownText_0x1c564a::
	text "Clear all save"
	line "data area?"
	done

Text_LearnedMove_::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_promptbutton
	db "@"

Text_ForgetWhich_::
	text "Which move should"
	next "be forgotten?"
	done

Text_StopLearning_::
	text "Stop learning"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

Text_DidNotLearn_::
	text_ram wMonOrItemNameBuffer
	text_start
	line "did not learn"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_TryingToLearn_::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "trying to learn"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "But @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "can't learn more"
	cont "than four moves."

	para "Delete an older"
	line "move to make room"
	cont "for @"
	text_ram wStringBuffer2
	text "?"
	done

Text_1_2_and_Poof_::
	text "1, 2 and…@"
	text_pause
	db "@@"

Text_PoofForgot_::
	text " Poof!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " forgot"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "And…"
	prompt

Text_CantForgetHM_::
	text "HM moves can't be"
	line "forgotten now."
	prompt

UnknownText_0x1c5793::
	text "Play with three"
	line "coins?"
	done

UnknownText_0x1c57ab::
	text "Not enough coins…"
	prompt

UnknownText_0x1c57be::
	text "Choose a card."
	done

UnknownText_0x1c57ce::
	text "Place your bet."
	done

UnknownText_0x1c57df::
	text "Want to play"
	line "again?"
	done

UnknownText_0x1c57f4::
	text "The cards have"
	line "been shuffled."
	prompt

UnknownText_0x1c5813::
	text "Yeah!"
	done

UnknownText_0x1c581a::
	text "Darn…"
	done

Text_ThisMonCantBeCaught_::
	text "It dodged the"
	line "thrown BALL!"

	para "This #MON"
	line "can't be caught!"
	prompt

Text_YouMissedThePokemon_::
	text "You missed the"
	line "#MON!"
	prompt

Text_ThePokemonBrokeFree_::
	text "Oh no! The #MON"
	line "broke free!"
	prompt

Text_AppearedToBeCaught_::
	text "Aww! It appeared"
	line "to be caught!"
	prompt

Text_AarghAlmostHadIt_::
	text "Aargh!"
	line "Almost had it!"
	prompt

Text_ShootItWasSoCloseToo_::
	text "Shoot! It was so"
	line "close too!"
	prompt

Text_GotchaMonWasCaught_::
	text "Gotcha! @"
	text_ram wEnemyMonNick
	text_start
	line "was caught!@"
	sound_caught_mon
	db "@@"

Text_Promptbutton_2::
	text_promptbutton
	db "@"

Text_SentToBillsPC_::
	text_ram wMonOrItemNameBuffer
	text " was"
	line "sent to BILL's PC."
	prompt

Text_MonNewlyAddedToPokedex_::
	text_ram wEnemyMonNick
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound_slot_machine_start
	text_promptbutton
	db "@"

Text_AskNicknameNewlyCaughtMon_::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

Text_StatRoseFromVitamin_::
	text_ram wStringBuffer1
	text "'s"
	line "@"
	text_ram wStringBuffer2
	text " rose."
	prompt

Text_MilkDrinkCantBeUsed_::
	text "That can't be used"
	line "on this #MON."
	prompt

Text_RepelUsedEarlierIsStillInEffect::
	text "The REPEL used"
	line "earlier is still"
	cont "in effect."
	prompt

Text_NowThatsACatchyTune_::
	text "Played the #"
	line "FLUTE."

	para "Now, that's a"
	line "catchy tune!"
	prompt

Text_AllSleepingMonWokeUp_::
	text "All sleeping"
	line "#MON woke up."
	prompt

Text_PlayedThePokeFlute_::
	text "<PLAYER> played the"
	line "# FLUTE.@"
	text_promptbutton
	db "@@"

Text_CoinCase_::
	text "Coins:"
	line "@"
	text_decimal wCoins, 2, 4
	done

Text_RaiseThePPOfWhichMove_::
	text "Raise the PP of"
	line "which move?"
	done

Text_RestoreThePPOfWhichMove_::
	text "Restore the PP of"
	line "which move?"
	done

Text_PPIsMaxedOut_::
	text_ram wStringBuffer2
	text "'s PP"
	line "is maxed out."
	prompt

Text_PPsIncreased_::
	text_ram wStringBuffer2
	text "'s PP"
	line "increased."
	prompt

Text_PPWasRestored_::
	text "PP was restored."
	prompt

Text_TrophyInside_::
	text "There was a trophy"
	line "inside!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " sent the"
	line "trophy home."
	prompt

Text_LooksBitter_::
	text "It looks bitter…"
	prompt

Text_CantUseOnEgg_::
	text "That can't be used"
	line "on an EGG."
	prompt

Text_IsntTheTimeToUseThat_::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

Text_BelongsToSomeoneElse_::
	text "That belongs to"
	line "someone else!"
	prompt

Text_WontHaveAnyEffect_::
	text "It won't have any"
	line "effect."
	prompt

Text_BlockedTheBall_::
	text "The trainer"
	line "blocked the BALL!"
	prompt

Text_DontBeAThief_::
	text "Don't be a thief!"
	prompt

Text_CyclingIsntAllowed_::
	text "Cycling isn't"
	line "allowed here."
	prompt

Text_CantGetOnYourItemNow_::
	text "Can't get on your"
	line "@"
	text_ram wStringBuffer1
	text " now."
	prompt

Text_CantUseBallBoxIsFull_::
	text "The #MON BOX"
	line "is full. That"
	cont "can't be used now."
	prompt

Text_UsedItem_::
	text "<PLAYER> used the"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

Text_GotOnItem_::
	text "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

Text_GotOffItem_::
	text "<PLAYER> got off@"
	text_low
	text "the @"
	text_ram wStringBuffer2
	text "."
	prompt

Text_KnowsMove_::
	text_ram wStringBuffer1
	text " knows"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5eba::
	text "That #MON knows"
	line "only one move."
	done

UnknownText_0x1c5eda::
	text "Oh, make it forget"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5ef5::
	text "Done! Your #MON"
	line "forgot the move."
	done

UnknownText_0x1c5f17::
	text "An EGG doesn't"
	line "know any moves!"
	done

UnknownText_0x1c5f36::
	text "No? Come visit me"
	line "again."
	done

UnknownText_0x1c5f50::
	text "Which move should"
	line "it forget, then?"
	prompt

UnknownText_0x1c5f74::
	text "Um… Oh, yes, I'm"
	line "the MOVE DELETER."

	para "I can make #MON"
	line "forget moves."

	para "Shall I make a"
	line "#MON forget?"
	done

UnknownText_0x1c5fd1::
	text "Which #MON?"
	prompt

Text_DSTIsThatOK::
	text " DST,"
	line "is that OK?"
	done

UnknownText_0x1c5ff1::
	text ","
	line "is that OK?"
	done

UnknownText_0x1c6000::
	text "Do you want to"
	line "switch to Daylight"
	cont "Saving Time?"
	done

UnknownText_0x1c6030::
	text "I set the clock"
	line "forward by one"
	cont "hour."
	prompt

UnknownText_0x1c6056::
	text "Is Daylight Saving"
	line "Time over?"
	done

UnknownText_0x1c6075::
	text "I put the clock"
	line "back one hour."
	prompt

UnknownText_0x1c6095::
	text "Do you want to"
	line "adjust your clock"

	para "for Daylight"
	line "Saving Time?"
	done

UnknownText_0x1c60d1::
	text "I lost the in-"
	line "struction booklet"
	cont "for the #GEAR."

	para "Come back again in"
	line "a while."
	prompt
