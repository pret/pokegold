PhoneScript_Random2:
	random 2
	end

PhoneScript_Random4:
	random 4
	end

PhoneScript_AnswerPhone_Male:
	checktime DAY
	iftrue .day
	checktime NITE
	iftrue .nite
	writetext PhoneMaleAnswerMornText
	promptbutton
	end
.day
	writetext PhoneMaleAnswerDayText
	promptbutton
	end
.nite
	writetext PhoneMaleAnswerNiteText
	promptbutton
	end

PhoneScript_AnswerPhone_Female:
	checktime DAY
	iftrue .day
	checktime NITE
	iftrue .nite
	writetext PhoneFemaleAnswerMornText
	promptbutton
	end
.day
	writetext PhoneFemaleAnswerDayText
	promptbutton
	end
.nite
	writetext PhoneFemaleAnswerNiteText
	promptbutton
	end

PhoneScript_GreetPhone_Male:
	checktime DAY
	iftrue .day
	checktime NITE
	iftrue .nite
	writetext PhoneMaleGreetMornText
	promptbutton
	end
.day
	writetext PhoneMaleGreetDayText
	promptbutton
	end
.nite
	writetext PhoneMaleGreetNiteText
	promptbutton
	end

PhoneScript_GreetPhone_Female:
	checktime DAY
	iftrue .day
	checktime NITE
	iftrue .nite
	writetext PhoneFemaleGreetMornText
	promptbutton
	end
.day
	writetext PhoneFemaleGreetDayText
	promptbutton
	end
.nite
	writetext PhoneFemaleGreetNiteText
	promptbutton
	end

; Huey
Phone_GenericCall_Male_SkipMon:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal 0, Phone_LookingAwesome_Male_SkipMon
	writetext PhoneMaleReallyEnergeticText
	promptbutton
	sjump PhoneScript_SeeYouLater

; unused
Phone_GenericCall_Female_SkipMon:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal 0, Phone_DressedUp_Female_SkipMon
	writetext PhoneFemaleTopShapeText
	promptbutton
	sjump PhoneScript_ByeBye

; Huey
Phone_LookingAwesome_Male_SkipMon:
	writetext PhoneMaleLookingAwesomeText
	promptbutton
	sjump PhoneScript_ByeBye

; unused
Phone_DressedUp_Female_SkipMon:
	writetext PhoneFemaleDressedUpText
	promptbutton
	sjump PhoneScript_ByeBye

Phone_GenericCall_Male:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal 0, Phone_LookingAwesome_Male
	writetext PhoneMaleReallyEnergeticText
	promptbutton
	sjump Phone_FoundAMon_Male

Phone_GenericCall_Female:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal 0, Phone_DressedUp_Female
	writetext PhoneFemaleTopShapeText
	promptbutton
	sjump Phone_FoundAMon_Female

Phone_LookingAwesome_Male:
	writetext PhoneMaleLookingAwesomeText
	promptbutton
	sjump Phone_FoundAMon_Male

Phone_DressedUp_Female:
	writetext PhoneFemaleDressedUpText
	promptbutton
	sjump Phone_FoundAMon_Female

Phone_FoundAMon_Male:
	special RandomPhoneWildMon
	scall PhoneScript_Random2
	ifequal 0, PhoneScript_AlmostCaught_Male
	writetext PhoneMaleManagedToBeatText
	promptbutton
	sjump PhoneScript_SeeYouLater

Phone_FoundAMon_Female:
	special RandomPhoneWildMon
	scall PhoneScript_Random2
	ifequal 0, PhoneScript_MissedCatching_Female
	writetext PhoneFemaleTypeAdvantageText
	promptbutton
	sjump PhoneScript_ByeBye

PhoneScript_AlmostCaught_Male:
	writetext PhoneMaleAlmostCaughtText
	promptbutton
	sjump PhoneScript_SeeYouLater

PhoneScript_MissedCatching_Female:
	writetext PhoneFemaleMissedCatchingText
	promptbutton
	sjump PhoneScript_ByeBye

PhoneScript_WantsToBattle_Male:
	writetext PhoneMaleWantsToBattleText
	promptbutton
	sjump PhoneScript_SeeYouLater

PhoneScript_WantsToBattle_Female:
	writetext PhoneFemaleWantsToBattleText
	promptbutton
	sjump PhoneScript_ByeBye

Phone_WrongNumber_JoseBrent:
	writetext PhoneWrongNumberKazText
	end

Phone_WrongNumber_Tiffany:
	writetext PhoneWrongNumberAudreyText
	end

PhoneScript_SeeYouLater:
	writetext PhoneSeeYouLaterText
	end

PhoneScript_ByeBye:
	writetext PhoneByeByeText
	end

PhoneScript_SwarmGrass:
	writetext PhoneSwarmGrassText
	promptbutton
	sjump PhoneScript_SeeYouLater

PhoneScript_SwarmFish:
	writetext PhoneSwarmFishText
	promptbutton
	sjump PhoneScript_SeeYouLater

PhoneScript_SwarmCave:
	writetext PhoneSwarmCaveText
	promptbutton
	sjump PhoneScript_SeeYouLater

PhoneScript_BugCatchingContest:
	writetext PhoneBugCatchingContestText
	promptbutton
	sjump PhoneScript_SeeYouLater

IrwinRocketRumorScript:
	writetext IrwinRocketTakeoverRumorText
	promptbutton
	sjump PhoneScript_SeeYouLater

GinaRocketRumorScript:
	writetext GinaRocketTakeoverRumorText
	promptbutton
	sjump PhoneScript_ByeBye

Phone_CheckIfUnseenRare_Male:
	scall PhoneScriptRareWildMon
	iffalse PhoneScript_SeeYouLater
	sjump Phone_GenericCall_Male

Phone_CheckIfUnseenRare_Female:
	scall PhoneScriptRareWildMon
	iffalse PhoneScript_ByeBye
	sjump Phone_GenericCall_Female

PhoneScriptRareWildMon:
	special RandomUnseenWildMon
	end
