_CantSurfText::
	text "You can't SURF"
	line "here."
	prompt

_AlreadySurfingText::
	text "You're already"
	line "SURFING."
	prompt

_AskSurfText::
	text "The water is calm."
	line "Want to SURF?"
	done

_UseWaterfallText::
	text_ram wStringBuffer2
	text " used"
	line "WATERFALL!"
	done

_HugeWaterfallText::
	text "Wow, it's a huge"
	line "waterfall."
	done

_AskWaterfallText::
	text "Do you want to use"
	line "WATERFALL?"
	done

_UseDigText::
	text_ram wStringBuffer2
	text " used"
	line "DIG!"
	done

_UseEscapeRopeText::
	text "<PLAYER> used an"
	line "ESCAPE ROPE."
	done

_CantUseDigText::
	text "Can't use that"
	line "here."
	done

_TeleportReturnText::
	text "Return to the last"
	line "#MON CENTER."
	done

_CantUseTeleportText::
	text "Can't use that"
	line "here."

	para ""
	done

_AlreadyUsingStrengthText::
	text "A #MON is using"
	line "STRENGTH already."
	prompt

_UseStrengthText::
	text_ram wStringBuffer2
	text " used"
	line "STRENGTH!"
	done

_MoveBoulderText::
	text_ram wStringBuffer1
	text " can"
	line "move boulders."
	prompt

_AskStrengthText::
	text "A #MON may be"
	line "able to move this."

	para "Want to use"
	line "STRENGTH?"
	done

_BouldersMoveText::
	text "Boulders may now"
	line "be moved!"
	done

_BouldersMayMoveText::
	text "A #MON may be"
	line "able to move this."
	done

_UseWhirlpoolText::
	text_ram wStringBuffer2
	text " used"
	line "WHIRLPOOL!"
	prompt

_MayPassWhirlpoolText::
	text "It's a vicious"
	line "whirlpool!"

	para "A #MON may be"
	line "able to pass it."
	done

_AskWhirlpoolText::
	text "A whirlpool is in"
	line "the way."

	para "Want to use"
	line "WHIRLPOOL?"
	done

_UseHeadbuttText::
	text_ram wStringBuffer2
	text " did a"
	line "HEADBUTT!"
	prompt

_HeadbuttNothingText::
	text "Nope. Nothing…"
	done

_AskHeadbuttText::
	text "A #MON could be"
	line "in this tree."

	para "Want to HEADBUTT"
	line "it?"
	done

_UseRockSmashText::
	text_ram wStringBuffer2
	text " used"
	line "ROCK SMASH!"
	prompt

_MaySmashText::
	text "A #MON may be"
	line "able to break it."
	done

_AskRockSmashText::
	text "This rock looks"
	line "breakable."

	para "Want to use ROCK"
	line "SMASH?"
	done

_RodBiteText::
	text "Oh!"
	line "A bite!"
	prompt

_RodNothingText::
	text "Not even a nibble!"
	prompt

_UnusedNothingHereText::
	text "Looks like there's"
	line "nothing here."
	prompt

_CantGetOffBikeText::
	text "You can't get off"
	line "here!"
	done

_GotOnBikeText::
	text "<PLAYER> got on the"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

_GotOffBikeText::
	text "<PLAYER> got off"
	line "the @"
	text_ram wStringBuffer2
	text "."
	done

_AskCutText::
	text "This tree can be"
	line "CUT!"

	para "Want to use CUT?"
	done

_CanCutText::
	text "This tree can be"
	line "CUT!"
	done

_FoundItemText::
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_CantCarryItemText::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items!"
	done

_WhitedOutText::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	done

_ItemfinderItemNearbyText::
	text "Yes! ITEMFINDER"
	line "indicates there's"
	cont "an item nearby."
	prompt

_ItemfinderNopeText::
	text "Nope! ITEMFINDER"
	line "isn't responding."
	prompt

UnknownText_0x1c0acc::
	text_ram wStringBuffer3
	text_start
	line "fainted!"
	prompt

UnknownText_0x1c0ada::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	prompt

UnknownText_0x1c0b03::
	text_ram wStringBuffer3
	text " used"
	line "SWEET SCENT!"
	done

UnknownText_0x1c0b1a::
	text "Looks like there's"
	line "nothing here…"
	done

UnknownText_0x1c0b3b::
	text "<PLAYER> sprinkled"
	line "water."

	para "But nothing"
	line "happened…"
	done

UnknownText_0x1c0b65::
	text "<PLAYER>'s #MON"
	line "were all healed!"
	done

Text_AnEGGCantHoldAnItem::
	text "An EGG can't hold"
	line "an item."
	prompt

Text_PackNoItems_::
	text "No items."
	done

Text_ThrowAwayHowMany_::
	text "Throw away how"
	line "many?"
	done

Text_ConfirmThrowAway_::
	text "Throw away @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

Text_ThrewAway_::
	text "Threw away"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

Text_ThisIsntTheTime_::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	prompt

Text_YouDontHaveAMon::
	text "You don't have a"
	line "#MON!"
	prompt

Text_RegisteredTheItem_::
	text "Registered the"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_CantRegisterThatItem_::
	text "You can't register"
	line "that item."
	prompt

Text_MoveItemWhere_::
	text "Where should this"
	line "be moved to?"
	done

Text_PackEmptyString_::
	text_start
	done

Text_YouCantUseItInABattle::
	text "You can't use it"
	line "in a battle."
	prompt

_ActorNameText::
	text "<USER>@@"

_UsedMove1Text::
	text_start
	line "used @@"

_UsedMove2Text::
	text_start
	line "used @@"

_UsedInsteadText::
	text "instead,"
	cont "@@"

_MoveNameText::
	text_ram wStringBuffer2
	db "@@"

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

Text_BattleEffectActivate::
	text "<USER>'s"
	line "@"
	text_ram wStringBuffer2
	db "@@"

_BattleStatWentWayUpText::
	text_pause
	text "<SCROLL>went way up!"
	prompt

_BattleStatWentUpText::
	text " went up!"
	prompt

Text_BattleFoeEffectActivate::
	text "<TARGET>'s"
	line "@"
	text_ram wStringBuffer2
	db "@@"

_BattleStatSharplyFellText::
	text_pause
	text "<SCROLL>sharply fell!"
	prompt

_BattleStatFellText::
	text " fell!"
	prompt

Text_BattleUser::
	text "<USER>@@"

_BattleMadeWhirlwindText::
	text_start
	line "made a whirlwind!"
	prompt

_BattleTookSunlightText::
	text_start
	line "took in sunlight!"
	prompt

_BattleLoweredHeadText::
	text_start
	line "lowered its head!"
	prompt

_BattleGlowingText::
	text_start
	line "is glowing!"
	prompt

_BattleFlewText::
	text_start
	line "flew up high!"
	prompt

_BattleDugText::
	text_start
	line "dug a hole!"
	prompt

Text_BreedHuh::
	text "Huh?"

	para "@@"

_BreedClearboxText::
	text_start
	done

_BreedEggHatchText::
	text_ram wStringBuffer1
	text " came"
	line "out of its EGG!@"
	sound_caught_mon
	text_promptbutton
	db "@"

_BreedAskNicknameText::
	text "Give a nickname to"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

_LeftWithDayCareLadyText::
	text "It's @"
	text_ram wBreedMon2Nick
	text_start
	line "that was left with"
	cont "the DAY-CARE LADY."
	done

_LeftWithDayCareManText::
	text "It's @"
	text_ram wDayCareMan + 1
	text_start
	line "that was left with"
	cont "the DAY-CARE MAN."
	done

_BreedBrimmingWithEnergyText::
	text "It's brimming with"
	line "energy."
	prompt

_BreedNoInterestText::
	text "It has no interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedAppearsToCareForText::
	text "It appears to care"
	line "for @"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedFriendlyText::
	text "It's friendly with"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BreedShowsInterestText::
	text "It shows interest"
	line "in @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "There's no MAIL"
	line "here."
	prompt

ClearedMailPutAwayText::
	text "The cleared MAIL"
	line "was put away."
	prompt

MailPackFullText::
	text "The PACK is full."
	prompt

MailMessageLostText::
	text "The MAIL's message"
	line "will be lost. OK?"
	done

MailAlreadyHoldingItemText::
	text "It's already hold-"
	line "ing an item."
	prompt

MailEggText::
	text "An EGG can't hold"
	line "any MAIL."
	prompt

MailMovedFromBoxText::
	text "The MAIL was moved"
	line "from the MAILBOX."
	prompt

Text_WasSentToBillsPC::
	text_ram wStringBuffer1
	text " was"
	line "sent to BILL's PC."
	prompt

Text_GottaHavePokemon_::
	text "You gotta have"
	line "#MON to call!"
	prompt

Text_BillsPCWhat_::
	text "What?"
	done

Text_PleaseRemoveMailBeforeMovePkmnWOMail_::
	text "There is a #MON"
	line "holding MAIL."

	para "Please remove the"
	line "MAIL."
	prompt

Text_YouDontHaveASinglePokemon_::
	text "You don't have a"
	line "single #MON!"
	prompt

Text_ItsYourLastPokemon_::
	text "You can't deposit"
	line "your last #MON!"
	prompt

Text_CantTakeAnyMorePokemon_::
	text "You can't take any"
	line "more #MON."
	prompt

_ContestCaughtMonText::
	text "Caught @"
	text_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c10cf::
	text "Switch #MON?"
	done

UnknownText_0x1c10dd::
	text "You already caught"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

_ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont "@"
	text_ram wStringBuffer1
	text "!@@"

_ContestJudging_FirstPlaceScoreText::
	text_start

	para "The winning score"
	line "was @"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_SecondPlaceText::
	text "Placing second was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@@"

_ContestJudging_SecondPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

_ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_ram wStringBuffer1
	text "!@@"

_ContestJudging_ThirdPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

UnknownText_0x1c1203::
	text "Let me measure"
	line "that MAGIKARP."

	para "…Hm, it measures"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c123a::
	text "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1
	text " caught by"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_promptbutton
	db "@"

UnknownText_0x1c1261::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your party."
	prompt

UnknownText_0x1c12ae::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_ram wStringBuffer1
	text " in"
	line "your PC BOX."
	prompt

UnknownText_0x1c12fc::
	text "Give a nickname to"
	line "the @"
	text_ram wStringBuffer1
	text " you"
	cont "received?"
	done

_PokecenterPCCantUseText::
	text "Bzzzzt! You must"
	line "have a #MON to"
	cont "use this!"
	prompt

_PlayersPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

_PlayersPCAskWhatDoText::
	text "What do you want"
	line "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "How many do you"
	line "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Withdrew @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "There's no room"
	line "for more items."
	prompt

_PlayersPCNoItemsText::
	text "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "How many do you"
	line "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Deposited @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomDepositText::
	text "There's no room to"
	line "store items."
	prompt

_PokecenterPCTurnOnText::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

_PokecenterPCWhoseText::
	text "Access whose PC?"
	done

_PokecenterBillsPCText::
	text "BILL's PC"
	line "accessed."

	para "#MON Storage"
	line "System opened."
	prompt

_PokecenterPlayersPCText::
	text "Accessed own PC."

	para "Item Storage"
	line "System opened."
	prompt

_PokecenterOaksPCText::
	text "PROF.OAK's PC"
	line "accessed."

	para "#DEX Rating"
	line "System opened."
	prompt

_PokecenterPCOaksClosedText::
	text "…"
	line "Link closed…"
	done

_OakPCText1::
	text "Want to get your"
	line "#DEX rated?"
	done

_OakPCText2::
	text "Current #DEX"
	line "completion level:"
	prompt

_OakPCText3::
	text_ram wStringBuffer3
	text " #MON seen"
	line "@"
	text_ram wStringBuffer4
	text " #MON owned"

	para "PROF.OAK's"
	line "Rating:"
	done

_OakRating01::
	text "Look for #MON"
	line "in grassy areas!"
	done

_OakRating02::
	text "Good. I see you"
	line "understand how to"
	cont "use # BALLS."
	done

_OakRating03::
	text "You're getting"
	line "good at this."

	para "But you have a"
	line "long way to go."
	done

_OakRating04::
	text "You need to fill"
	line "up the #DEX."

	para "Catch different"
	line "kinds of #MON!"
	done

_OakRating05::
	text "You're trying--I"
	line "can see that."

	para "Your #DEX is"
	line "coming together."
	done

_OakRating06::
	text "To evolve, some"
	line "#MON grow,"

	para "others use the"
	line "effects of STONES."
	done

_OakRating07::
	text "Have you gotten a"
	line "fishing ROD? You"

	para "can catch #MON"
	line "by fishing."
	done

_OakRating08::
	text "Excellent! You"
	line "seem to like col-"
	cont "lecting things!"
	done

_OakRating09::
	text "Some #MON only"
	line "appear during"

	para "certain times of"
	line "the day."
	done

_OakRating10::
	text "Your #DEX is"
	line "filling up. Keep"
	cont "up the good work!"
	done

_OakRating11::
	text "I'm impressed."
	line "You're evolving"

	para "#MON, not just"
	line "catching them."
	done

_OakRating12::
	text "Have you met KURT?"
	line "His custom #"
	cont "BALLS should help."
	done

_OakRating13::
	text "Wow. You've found"
	line "more #MON than"

	para "the last #DEX"
	line "research project."
	done

_OakRating14::
	text "Are you trading"
	line "your #MON?"

	para "It's tough to do"
	line "this alone!"
	done

_OakRating15::
	text "Wow! You've hit"
	line "200! Your #DEX"
	cont "is looking great!"
	done

_OakRating16::
	text "You've found so"
	line "many #MON!"

	para "You've really"
	line "helped my studies!"
	done

_OakRating17::
	text "Magnificent! You"
	line "could become a"

	para "#MON professor"
	line "right now!"
	done

_OakRating18::
	text "Your #DEX is"
	line "amazing! You're"

	para "ready to turn"
	line "professional!"
	done

_OakRating19::
	text "Whoa! A perfect"
	line "#DEX! I've"

	para "dreamt about this!"
	line "Congratulations!"
	done

_OakPCText4::
	text "The link to PROF."
	line "OAK's PC closed."
	done

UnknownText_0x1c1a5b::
	text " , yeah!"
	done

UnknownText_0x1c1a65::
	text "Darn…"
	done

_StartMenuContestEndText::
	text "Would you like to"
	line "end the Contest?"
	done

_ItemsTossOutHowManyText::
	text "Toss out how many"
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ItemsThrowAwayText::
	text "Throw away @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "(S)?"
	done

_ItemsDiscardedText::
	text "Discarded"
	line "@"
	text_ram wStringBuffer1
	text "(S)."
	prompt

_ItemsTooImportantText::
	text "That's too impor-"
	line "tant to toss out!"
	prompt

_ItemsOakWarningText::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	done

_PokemonSwapItemText::
	text "Took @"
	text_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_ram wStringBuffer1
	text " and"

	para "made it hold"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonHoldItemText::
	text "Made @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "hold @"
	text_ram wStringBuffer2
	text "."
	prompt

_PokemonRemoveMailText::
	text "Please remove the"
	line "MAIL first."
	prompt

_PokemonNotHoldingText::
	text_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

_ItemStorageFullText::
	text "Item storage space"
	line "full."
	prompt

_PokemonTookItemText::
	text "Took @"
	text_ram wStringBuffer1
	text_start
	line "from @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

_PokemonAskSwapItemText::
	text_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

_ItemCantHeldText::
	text "This item can't be"
	line "held."
	prompt

_MailLoseMessageText::
	text "The MAIL will lose"
	line "its message. OK?"
	done

_MailDetachedText::
	text "MAIL detached from"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_MailNoSpaceText::
	text "There's no space"
	line "for removing MAIL."
	prompt

_MailAskSendToPCText::
	text "Send the removed"
	line "MAIL to your PC?"
	done

_MailboxFullText::
	text "Your PC's MAILBOX"
	line "is full."
	prompt

_MailSentToPCText::
	text "The MAIL was sent"
	line "to your PC."
	prompt

_PokemonNotEnoughHPText::
	text "Not enough HP!"
	prompt

_MayRegisterItemText::
	text "An item in your"
	line "PACK may be"

	para "registered for use"
	line "on SELECT Button."
	done

_ClockTimeUnknownText::
	text "Clock time unknown"
	done

_OakText1::
	text "Hello! Sorry to"
	line "keep you waiting!"

	para "Welcome to the"
	line "world of #MON!"

	para "My name is OAK."

	para "People call me the"
	line "#MON PROF."
	prompt

_OakText2::
	text "This world is in-"
	line "habited by crea-"
	cont "tures that we call"
	cont "#MON.@@"

_OakText3::
	text_promptbutton
	db "@"

_OakText4::
	text "People and #MON"
	line "live together by"

	para "supporting each"
	line "other."

	para "Some people play"
	line "with #MON, some"
	cont "battle with them."
	prompt

_OakText5::
	text "But we don't know"
	line "everything about"
	cont "#MON yet."

	para "There are still"
	line "many mysteries to"
	cont "solve."

	para "That's why I study"
	line "#MON every day."
	prompt

_OakText6::
	text "Now, what did you"
	line "say your name was?"
	prompt

_OakText7::
	text "<PLAYER>, are you"
	line "ready?"

	para "Your very own"
	line "#MON story is"
	cont "about to unfold."

	para "You'll face fun"
	line "times and tough"
	cont "challenges."

	para "A world of dreams"
	line "and adventures"

	para "with #MON"
	line "awaits! Let's go!"

	para "I'll be seeing you"
	line "later!"
	done

UnknownText_0x1c40e6::
	text "The clock's time"
	line "may be wrong."

	para "Please reset the"
	line "time."
	prompt

UnknownText_0x1c411c::
	text "Set with the"
	line "Control Pad."

	para "Confirm: A Button"
	line "Cancel:  B Button"
	done

UnknownText_0x1c415b::
	text "Is this OK?"
	done

UnknownText_0x1c4168::
	text "The clock has been"
	line "reset."
	done

UnknownText_0x1c4183::
	text "Too much time has"
	line "elapsed. Please"
	cont "try again."
	prompt

UnknownText_0x1c41b1::
	text "If you trade that"
	line "#MON, you won't"
	cont "be able to battle."
	prompt

UnknownText_0x1c41e6::
	text "Your friend's"
	line "@"
	text_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

UnknownText_0x1c4212::
	text "Trade @"
	text_ram wceef
	text_start
	line "for @"
	text_ram wStringBuffer1
	text "?"
	done

_WouldYouLikeToSaveTheGameText::
	text "Would you like to"
	line "save the game?"
	done

_SavingDontTurnOffThePowerText::
	text "SAVING… DON'T TURN"
	line "OFF THE POWER."
	done

_SavedTheGameText::
	text "<PLAYER> saved"
	line "the game."
	done

_AlreadyASaveFileText::
	text "There is already a"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

_AnotherSaveFileText::
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

_SaveFileCorruptedText::
	text "The save file is"
	line "corrupted!"
	prompt

_ChangeBoxSaveText::
	text "When you change a"
	line "#MON BOX, data"
	cont "will be saved. OK?"
	done

_MoveMonWOMailSaveText::
	text "Each time you move"
	line "a #MON, data"
	cont "will be saved. OK?"
	done

UnknownText_0x1c4693::
	text "The window save"
	line "area was exceeded."
	done

UnknownText_0x1c46b7::
	text "No windows avail-"
	line "able for popping."
	done

UnknownText_0x1c46dc::
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event."
	done

_BGEventText::
	text "BG event"
	done

_CoordinatesEventText::
	text "Coordinates event"
	done

_ReceivedItemText::
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

_PutItemInPocketText::
	text "<PLAYER> put the"
	line "@"
	text_ram wStringBuffer1
	text " in"
	cont "the @"
	text_ram wStringBuffer3
	text "."
	prompt

_PocketIsFullText::
	text "The @"
	text_ram wStringBuffer3
	text_start
	line "is full…"
	prompt

UnknownText_0x1c4b92::
	text "Congratulations!"
	line "Your @"
	text_ram wStringBuffer2
	db "@@"

UnknownText_0x1c4baf::
	text_start

	para "evolved into"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "Huh? @"
	text_ram wStringBuffer2
	text_start
	line "stopped evolving!"
	prompt

UnknownText_0x1c4be3::
	text "What? @"
	text_ram wStringBuffer2
	text_start
	line "is evolving!"
	done

_MartHowManyText::
	text "How many?"
	done

_MartFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbShopLadyIntroText::
	text "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #MON may"
	line "not like them."

	para "Hehehehe…"
	done

_HerbalLadyHowManyText::
	text "How many?"
	done

_HerbalLadyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_HerbalLadyThanksText::
	text "Thank you, dear."
	line "Hehehehe…"
	done

_HerbalLadyPackFullText::
	text "Oh? Your PACK is"
	line "full, dear."
	done

_HerbalLadyNoMoneyText::
	text "Hehehe… You don't"
	line "have the money."
	done

_HerbalLadyComeAgainText::
	text "Come again, dear."
	line "Hehehehe…"
	done

_BargainShopIntroText::
	text "Hiya! Care to see"
	line "some bargains?"

	para "I sell rare items"
	line "that nobody else"

	para "carries--but only"
	line "one of each item."
	done

_BargainShopFinalPriceText::
	text_ram wStringBuffer2
	text " costs"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Want it?"
	done

_BargainShopThanksText::
	text "Thanks."
	done

_BargainShopPackFullText::
	text "Uh-oh, your PACK"
	line "is chock-full."
	done

_BargainShopSoldOutText::
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

_BargainShopNoFundsText::
	text "Uh-oh, you're"
	line "short on funds."
	done

_BargainShopComeAgainText::
	text "Come by again"
	line "sometime."
	done

_PharmacyIntroText::
	text "What's up? Need"
	line "some medicine?"
	done

_PharmacyHowManyText::
	text "How many?"
	done

_PharmacyFinalPriceText::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text "(S)"
	line "will cost ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

_PharmacyThanksText::
	text "Thanks much!"
	done

_PharmacyPackFullText::
	text "You don't have any"
	line "more space."
	done

_PharmacyNoMoneyText::
	text "Huh? That's not"
	line "enough money."
	done

_PharmacyComeAgainText::
	text "All right."
	line "See you around."
	done

;unused
_NothingToSellText::
	text "You don't have"
	line "anything to sell."
	prompt

_MartSellHowManyText::
	text "How many?"
	done

_MartSellPriceText::
	text "I can pay you"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Is that OK?"
	done

_MartWelcomeText::
	text "Welcome! How may I"
	line "help you?"
	done

_MartThanksText::
	text "Here you are."
	line "Thank you!"
	done

_MartNoMoneyText::
	text "You don't have"
	line "enough money."
	done

_MartPackFullText::
	text "You can't carry"
	line "any more items."
	done

_MartCantBuyText::
	text "Sorry, I can't buy"
	line "that from you."
	done

_MartComeAgainText::
	text "Please come again!"
	done

_MartAskMoreText::
	text "Can I do anything"
	line "else for you?"
	done

_MartBoughtText::
	text "Got ¥@"
	text_decimal hMoneyTemp, 3, 6
	text " for"
	line "@"
	text_ram wStringBuffer2
	text "(S)."
	done

UnknownText_0x1c5049::
	text "Bet how many"
	line "coins?"
	done
