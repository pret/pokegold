CantSurfText_::
	text "You can't SURF"
	line "here."
	prompt

AlreadySurfingText_::
	text "You're already"
	line "SURFING."
	prompt

AskSurfText_::
	text "The water is calm."
	line "Want to SURF?"
	done

Text_UsedWaterfall_::
	text_from_ram wStringBuffer2
	text " used"
	line "WATERFALL!"
	done

Text_CantDoWaterfall_::
	text "Wow, it's a huge"
	line "waterfall."
	done

Text_AskUseWaterfall_::
	text "Do you want to use"
	line "WATERFALL?"
	done

Text_UsedDig_::
	text_from_ram wStringBuffer2
	text " used"
	line "DIG!"
	done

Text_UsedEscapeRope_::
	text "<PLAYER> used an"
	line "ESCAPE ROPE."
	done

Text_CantUseDigEscapeRopeHere_::
	text "Can't use that"
	line "here."
	done

Text_ReturnToLastMonCenter_::
	text "Return to the last"
	line "#MON CENTER."
	done

Text_CantUseTeleportHere_::
	text "Can't use that"
	line "here."

	para ""
	done

Text_AlreadyUsingStrength_::
	text "A #MON is using"
	line "STRENGTH already."
	prompt

Text_UsedStrength_::
	text_from_ram wStringBuffer2
	text " used"
	line "STRENGTH!"
	done

Text_AllowedToMoveBoulders_::
	text_from_ram wStringBuffer1
	text " can"
	line "move boulders."
	prompt

Text_AskStrength_::
	text "A #MON may be"
	line "able to move this."

	para "Want to use"
	line "STRENGTH?"
	done

Text_BouldersMayNowBeMoved_::
	text "Boulders may now"
	line "be moved!"
	done

Text_MonMayBeAbleToMove_::
	text "A #MON may be"
	line "able to move this."
	done

Text_UsedWhirlpool_::
	text_from_ram wStringBuffer2
	text " used"
	line "WHIRLPOOL!"
	prompt

Text_MightyWhirlpool_::
	text "It's a vicious"
	line "whirlpool!"

	para "A #MON may be"
	line "able to pass it."
	done

Text_AskWhirlpool_::
	text "A whirlpool is in"
	line "the way."

	para "Want to use"
	line "WHIRLPOOL?"
	done

Text_DidAHeadbutt_::
	text_from_ram wStringBuffer2
	text " did a"
	line "HEADBUTT!"
	prompt

Text_NothingFromHeadbutt_::
	text "Nope. Nothing…"
	done

Text_AskHeadbutt_::
	text "A #MON could be"
	line "in this tree."

	para "Want to HEADBUTT"
	line "it?"
	done

Text_UsedRockSmash_::
	text_from_ram wStringBuffer2
	text " used"
	line "ROCK SMASH!"
	prompt

Text_MayBeBreakable_::
	text "A #MON may be"
	line "able to break it."
	done

Text_AskRockSmash_::
	text "This rock looks"
	line "breakable."

	para "Want to use ROCK"
	line "SMASH?"
	done

Text_OhABite_::
	text "Oh!"
	line "A bite!"
	prompt

Text_NotEvenANibble_::
	text "Not even a nibble!"
	prompt

Text_NothingHereToFish_::
	text "Looks like there's"
	line "nothing here."
	prompt

Text_CantGetOffBike_::
	text "You can't get off"
	line "here!"
	done

Text_GotOnTheBike_::
	text "<PLAYER> got on the"
	line "@"
	text_from_ram wStringBuffer2
	text "."
	done

Text_GotOffTheBike_::
	text "<PLAYER> got off"
	line "the @"
	text_from_ram wStringBuffer2
	text "."
	done

Text_AskCut_::
	text "This tree can be"
	line "CUT!"

	para "Want to use CUT?"
	done

Text_MonCanCutThis_::
	text "This tree can be"
	line "CUT!"
	done

UnknownText_0x1c0a1c::
	text "<PLAYER> found"
	line "@"
	text_from_ram wStringBuffer3
	text "!"
	done

UnknownText_0x1c0a2c::
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items!"
	done

UnknownText_0x1c0a4e::
	text "<PLAYER> is out of"
	line "useable #MON!"

	para "<PLAYER> whited"
	line "out!"
	done

UnknownText_0x1c0a77::
	text "Yes! ITEMFINDER"
	line "indicates there's"
	cont "an item nearby."
	prompt

UnknownText_0x1c0aa9::
	text "Nope! ITEMFINDER"
	line "isn't responding."
	prompt

UnknownText_0x1c0acc::
	text_from_ram wStringBuffer3
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
	text_from_ram wStringBuffer3
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
	deciram wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_from_ram wStringBuffer2
	text "(S)?"
	done

Text_ThrewAway_::
	text "Threw away"
	line "@"
	text_from_ram wStringBuffer2
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
	text_from_ram wStringBuffer2
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
	text_from_ram wStringBuffer2
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

UnknownText_0x1c0cc6::
	text "<USER>'s"
	line "@"
	text_from_ram wStringBuffer2
	db "@@"

UnknownText_0x1c0cd0::
	interpret_data
	text "<SCROLL>went way up!"
	prompt

UnknownText_0x1c0ce0::
	text " went up!"
	prompt

UnknownText_0x1c0ceb::
	text "<TARGET>'s"
	line "@"
	text_from_ram wStringBuffer2
	db "@@"

UnknownText_0x1c0cf5::
	interpret_data
	text "<SCROLL>sharply fell!"
	prompt

UnknownText_0x1c0d06::
	text " fell!"
	prompt

UnknownText_0x1c0d0e::
	text "<USER>@@"

UnknownText_0x1c0d12::
	text_start
	line "made a whirlwind!"
	prompt

UnknownText_0x1c0d26::
	text_start
	line "took in sunlight!"
	prompt

UnknownText_0x1c0d3a::
	text_start
	line "lowered its head!"
	prompt

UnknownText_0x1c0d4e::
	text_start
	line "is glowing!"
	prompt

UnknownText_0x1c0d5c::
	text_start
	line "flew up high!"
	prompt

UnknownText_0x1c0d6c::
	text_start
	line "dug a hole!"
	prompt

UnknownText_0x1c0db0::
	text "Huh?"

	para "@@"

UnknownText_0x1c0db8::
	text_start
	done

UnknownText_0x1c0dba::
	text_from_ram wStringBuffer1
	text " came"
	line "out of its EGG!@"
	sound_caught_mon
	text_waitbutton
	db "@"

UnknownText_0x1c0dd8::
	text "Give a nickname to"
	line "@"
	text_from_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c0df3::
	text "It's @"
	text_from_ram wBreedMon2Nick
	text_start
	line "that was left with"
	cont "the DAY-CARE LADY."
	done

UnknownText_0x1c0e24::
	text "It's @"
	text_from_ram wDayCareMan + 1
	text_start
	line "that was left with"
	cont "the DAY-CARE MAN."
	done

UnknownText_0x1c0e54::
	text "It's brimming with"
	line "energy."
	prompt

UnknownText_0x1c0e6f::
	text "It has no interest"
	line "in @"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0e8d::
	text "It appears to care"
	line "for @"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0eac::
	text "It's friendly with"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0ec6::
	text "It shows interest"
	line "in @"
	text_from_ram wStringBuffer1
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
	text_from_ram wStringBuffer1
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

Text_CaughtBugMon_::
	text "Caught @"
	text_from_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c10cf::
	text "Switch #MON?"
	done

UnknownText_0x1c10dd::
	text "You already caught"
	line "a @"
	text_from_ram wStringBuffer1
	text "."
	prompt

ContestJudging_FirstPlaceText::
	text "This Bug-Catching"
	line "Contest winner is@"
	interpret_data
	text "…"

	para "@"
	text_from_ram wBugContestWinnerName
	text ","
	line "who caught a"
	cont "@"
	text_from_ram wStringBuffer1
	text "!@@"

ContestJudging_FirstPlaceScoreText::
	text_start

	para "The winning score"
	line "was @"
	deciram wBugContestFirstPlaceScore, 2, 3
	text " points!"
	prompt

ContestJudging_SecondPlaceText::
	text "Placing second was"
	line "@"
	text_from_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_from_ram wStringBuffer1
	text "!@@"

ContestJudging_SecondPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	deciram wBugContestSecondPlaceScore, 2, 3
	text " points!"
	prompt

ContestJudging_ThirdPlaceText::
	text "Placing third was"
	line "@"
	text_from_ram wBugContestWinnerName
	text ","

	para "who caught a"
	line "@"
	text_from_ram wStringBuffer1
	text "!@@"

ContestJudging_ThirdPlaceScoreText::
	text_start

	para "The score was"
	line "@"
	deciram wBugContestThirdPlaceScore, 2, 3
	text " points!"
	prompt

UnknownText_0x1c1203::
	text "Let me measure"
	line "that MAGIKARP."

	para "…Hm, it measures"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c123a::
	text "CURRENT RECORD"

	para "@"
	text_from_ram wStringBuffer1
	text " caught by"
	line "@"
	text_from_ram wMagikarpRecordHoldersName
	text_waitbutton
	db "@"

UnknownText_0x1c1261::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_from_ram wStringBuffer1
	text " in"
	line "your party."
	prompt

UnknownText_0x1c12ae::
	text "Congratulations!"

	para "We have a match"
	line "with the ID number"

	para "of @"
	text_from_ram wStringBuffer1
	text " in"
	line "your PC BOX."
	prompt

UnknownText_0x1c12fc::
	text "Give a nickname to"
	line "the @"
	text_from_ram wStringBuffer1
	text " you"
	cont "received?"
	done

UnknownText_0x1c1328::
	text "Bzzzzt! You must"
	line "have a #MON to"
	cont "use this!"
	prompt

UnknownText_0x1c1353::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

UnknownText_0x1c1368::
	text "What do you want"
	line "to do?"
	done

_PlayersPCHowManyWithdrawText::
	text "How many do you"
	line "want to withdraw?"
	done

_PlayersPCWithdrewItemsText::
	text "Withdrew @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_from_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "There's no room"
	line "for more items."
	prompt

UnknownText_0x1c13df::
	text "No items here!"
	prompt

_PlayersPCHowManyDepositText::
	text "How many do you"
	line "want to deposit?"
	done

_PlayersPCDepositItemsText::
	text "Deposited @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_from_ram wStringBuffer2
	text "(S)."
	prompt

_PlayersPCNoRoomDepositText::
	text "There's no room to"
	line "store items."
	prompt

UnknownText_0x1c144d::
	text "<PLAYER> turned on"
	line "the PC."
	prompt

UnknownText_0x1c1462::
	text "Access whose PC?"
	done

UnknownText_0x1c1474::
	text "BILL's PC"
	line "accessed."

	para "#MON Storage"
	line "System opened."
	prompt

UnknownText_0x1c14a4::
	text "Accessed own PC."

	para "Item Storage"
	line "System opened."
	prompt

UnknownText_0x1c14d2::
	text "PROF.OAK's PC"
	line "accessed."

	para "#DEX Rating"
	line "System opened."
	prompt

UnknownText_0x1c1505::
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
	text_from_ram wStringBuffer3
	text " #MON seen"
	line "@"
	text_from_ram wStringBuffer4
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

UnknownText_0x1c1a6c::
	text "Would you like to"
	line "end the Contest?"
	done

UnknownText_0x1c1a90::
	text "Toss out how many"
	line "@"
	text_from_ram wStringBuffer2
	text "(S)?"
	done

UnknownText_0x1c1aad::
	text "Throw away @"
	deciram wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_from_ram wStringBuffer2
	text "(S)?"
	done

UnknownText_0x1c1aca::
	text "Discarded"
	line "@"
	text_from_ram wStringBuffer1
	text "(S)."
	prompt

UnknownText_0x1c1adf::
	text "That's too impor-"
	line "tant to toss out!"
	prompt

UnknownText_0x1c1b03::
	text "OAK: <PLAYER>!"
	line "This isn't the"
	cont "time to use that!"
	done

UnknownText_0x1c1b2c::
	text "Took @"
	text_from_ram wMonOrItemNameBuffer
	text "'s"
	line "@"
	text_from_ram wStringBuffer1
	text " and"

	para "made it hold"
	line "@"
	text_from_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b57::
	text "Made @"
	text_from_ram wMonOrItemNameBuffer
	text_start
	line "hold @"
	text_from_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b6f::
	text "Please remove the"
	line "MAIL first."
	prompt

UnknownText_0x1c1b8e::
	text_from_ram wMonOrItemNameBuffer
	text " isn't"
	line "holding anything."
	prompt

UnknownText_0x1c1baa::
	text "Item storage space"
	line "full."
	prompt

UnknownText_0x1c1bc4::
	text "Took @"
	text_from_ram wStringBuffer1
	text_start
	line "from @"
	text_from_ram wMonOrItemNameBuffer
	text "."
	prompt

UnknownText_0x1c1bdc::
	text_from_ram wMonOrItemNameBuffer
	text " is"
	line "already holding"

	para "@"
	text_from_ram wStringBuffer1
	text "."
	line "Switch items?"
	done

UnknownText_0x1c1c09::
	text "This item can't be"
	line "held."
	prompt

UnknownText_0x1c1c22::
	text "The MAIL will lose"
	line "its message. OK?"
	done

UnknownText_0x1c1c47::
	text "MAIL detached from"
	line "@"
	text_from_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c1c62::
	text "There's no space"
	line "for removing MAIL."
	prompt

UnknownText_0x1c1c86::
	text "Send the removed"
	line "MAIL to your PC?"
	done

UnknownText_0x1c1ca9::
	text "Your PC's MAILBOX"
	line "is full."
	prompt

UnknownText_0x1c1cc4::
	text "The MAIL was sent"
	line "to your PC."
	prompt

UnknownText_0x1c1ce3::
	text "Not enough HP!"
	prompt

UnknownText_0x1c1cf3::
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
	text_waitbutton
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
	text_from_ram wStringBuffer1
	text " appears"
	cont "to be abnormal!"
	prompt

UnknownText_0x1c4212::
	text "Trade @"
	text_from_ram wTemporaryBuffer
	text_start
	line "for @"
	text_from_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c454b::
	text "Would you like to"
	line "save the game?"
	done

UnknownText_0x1c456d::
	text "SAVING… DON'T TURN"
	line "OFF THE POWER."
	done

UnknownText_0x1c4590::
	text "<PLAYER> saved"
	line "the game."
	done

UnknownText_0x1c45a3::
	text "There is already a"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

UnknownText_0x1c45d9::
	text "There is another"
	line "save file. Is it"
	cont "OK to overwrite?"
	done

UnknownText_0x1c460d::
	text "The save file is"
	line "corrupted!"
	prompt

UnknownText_0x1c462a::
	text "When you change a"
	line "#MON BOX, data"
	cont "will be saved. OK?"
	done

UnknownText_0x1c465f::
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

BGEventText_::
	text "BG event"
	done

CoordinatesEventText_::
	text "Coordinates event"
	done

UnknownText_0x1c4719::
	text "<PLAYER> received"
	line "@"
	text_from_ram wStringBuffer4
	text "."
	done

UnknownText_0x1c472c::
	text "<PLAYER> put the"
	line "@"
	text_from_ram wStringBuffer1
	text " in"
	cont "the @"
	text_from_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1c474b::
	text "The @"
	text_from_ram wStringBuffer3
	text_start
	line "is full…"
	prompt

UnknownText_0x1c4b92::
	text "Congratulations!"
	line "Your @"
	text_from_ram wStringBuffer2
	db "@@"

UnknownText_0x1c4baf::
	text_start

	para "evolved into"
	line "@"
	text_from_ram wStringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "Huh? @"
	text_from_ram wStringBuffer2
	text_start
	line "stopped evolving!"
	prompt

UnknownText_0x1c4be3::
	text "What? @"
	text_from_ram wStringBuffer2
	text_start
	line "is evolving!"
	done

UnknownText_0x1c4bfd::
	text "How many?"
	done

UnknownText_0x1c4c08::
	deciram wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_from_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	deciram hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4c28::
	text "Hello, dear."

	para "I sell inexpensive"
	line "herbal medicine."

	para "They're good, but"
	line "a trifle bitter."

	para "Your #MON may"
	line "not like them."

	para "Hehehehe…"
	done

UnknownText_0x1c4ca3::
	text "How many?"
	done

UnknownText_0x1c4cae::
	deciram wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_from_ram wStringBuffer2
	text "(S)"
	line "will be ¥@"
	deciram hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4cce::
	text "Thank you, dear."
	line "Hehehehe…"
	done

UnknownText_0x1c4cea::
	text "Oh? Your PACK is"
	line "full, dear."
	done

UnknownText_0x1c4d08::
	text "Hehehe… You don't"
	line "have the money."
	done

UnknownText_0x1c4d2a::
	text "Come again, dear."
	line "Hehehehe…"
	done

UnknownText_0x1c4d47::
	text "Hiya! Care to see"
	line "some bargains?"

	para "I sell rare items"
	line "that nobody else"

	para "carries--but only"
	line "one of each item."
	done

UnknownText_0x1c4db0::
	text_from_ram wStringBuffer2
	text " costs"
	line "¥@"
	deciram hMoneyTemp, 3, 6
	text ". Want it?"
	done

UnknownText_0x1c4dcd::
	text "Thanks."
	done

UnknownText_0x1c4dd6::
	text "Uh-oh, your PACK"
	line "is chock-full."
	done

UnknownText_0x1c4df7::
	text "You bought that"
	line "already. I'm all"
	cont "sold out of it."
	done

UnknownText_0x1c4e28::
	text "Uh-oh, you're"
	line "short on funds."
	done

UnknownText_0x1c4e46::
	text "Come by again"
	line "sometime."
	done

UnknownText_0x1c4e5f::
	text "What's up? Need"
	line "some medicine?"
	done

UnknownText_0x1c4e7e::
	text "How many?"
	done

UnknownText_0x1c4e89::
	deciram wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_from_ram wStringBuffer2
	text "(S)"
	line "will cost ¥@"
	deciram hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4eab::
	text "Thanks much!"
	done

UnknownText_0x1c4eb9::
	text "You don't have any"
	line "more space."
	done

UnknownText_0x1c4ed8::
	text "Huh? That's not"
	line "enough money."
	done

UnknownText_0x1c4ef6::
	text "All right."
	line "See you around."
	done

UnknownText_0x1c4f12::
	text "You don't have"
	line "anything to sell."
	prompt

UnknownText_0x1c4f33::
	text "How many?"
	done

UnknownText_0x1c4f3e::
	text "I can pay you"
	line "¥@"
	deciram hMoneyTemp, 3, 6
	text "."

	para "Is that OK?"
	done

UnknownText_0x1c4f62::
	text "Welcome! How may I"
	line "help you?"
	done

UnknownText_0x1c4f80::
	text "Here you are."
	line "Thank you!"
	done

UnknownText_0x1c4f9a::
	text "You don't have"
	line "enough money."
	done

UnknownText_0x1c4fb7::
	text "You can't carry"
	line "any more items."
	done

UnknownText_0x1c4fd7::
	text "Sorry, I can't buy"
	line "that from you."
	done

UnknownText_0x1c4ff9::
	text "Please come again!"
	done

UnknownText_0x1c500d::
	text "Can I do anything"
	line "else for you?"
	done

UnknownText_0x1c502e::
	text "Got ¥@"
	deciram hMoneyTemp, 3, 6
	text " for"
	line "@"
	text_from_ram wStringBuffer2
	text "(S)."
	done

UnknownText_0x1c5049::
	text "Bet how many"
	line "coins?"
	done
