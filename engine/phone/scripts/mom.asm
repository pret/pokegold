MomPhoneCalleeScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .started_quest
	checkevent EVENT_DUDE_TALKED_TO_YOU
	iftrue MomPhoneLectureScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue MomPhoneNoGymQuestScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue MomPhoneNoPokedexScript
	sjump MomPhoneNoPokemonScript

.started_quest
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue MomPhoneHangUpScript
	writetext MomPhoneGreetingText
	promptbutton
	getcurlandmarkname STRING_BUFFER_3
	readvar VAR_ENVIRONMENT
	ifequal TOWN, MomPhoneInTown
	ifequal ROUTE, MomPhoneOnRoute
	sjump MomPhoneOther

MomPhoneLandmark:
	writetext MomPhoneLandmarkText
	promptbutton
	sjump MomSavingMoney

MomPhoneInTown:
	readvar VAR_MAPGROUP
	ifequal GROUP_NEW_BARK_TOWN, .newbark
	ifequal GROUP_CHERRYGROVE_CITY, .cherrygrove
	ifequal GROUP_VIOLET_CITY, .violet
	ifequal GROUP_AZALEA_TOWN, .azalea
	ifequal GROUP_GOLDENROD_CITY, .goldenrod
	writetext MomPhoneGenericAreaText
	promptbutton
	sjump MomSavingMoney

.newbark
	writetext MomPhoneNewBarkText
	promptbutton
	sjump MomSavingMoney

.cherrygrove
	writetext MomPhoneCherrygroveText
	promptbutton
	sjump MomSavingMoney

.violet
	getstring STRING_BUFFER_4, .text_sprout_tower
	sjump MomPhoneLandmark
.text_sprout_tower
	db "SPROUT TOWER@"

.azalea
	getstring STRING_BUFFER_4, .text_slowpoke_well
	sjump MomPhoneLandmark
.text_slowpoke_well
	db "SLOWPOKE WELL@"

.goldenrod
	getstring STRING_BUFFER_4, .text_radio_tower
	sjump MomPhoneLandmark
.text_radio_tower
	db "RADIO TOWER@"

MomPhoneOnRoute:
	writetext MomOtherAreaText
	promptbutton
	sjump MomSavingMoney

MomPhoneOther:
	writetext MomDeterminedText
	promptbutton
	sjump MomSavingMoney

MomSavingMoney:
	checkflag ENGINE_MOM_SAVING_MONEY
	iffalse .NotSaving
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .SavingHasMoney
	sjump .SavingNoMoney

.NotSaving:
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .HasMoney
	sjump .NoMoney

.SavingHasMoney:
	getmoney STRING_BUFFER_3, MOMS_MONEY
	writetext MomCheckBalanceText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

.SavingNoMoney:
	writetext MomImportantToSaveText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

.NoMoney:
	writetext MomYoureNotSavingText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

.HasMoney:
	getmoney STRING_BUFFER_3, MOMS_MONEY
	writetext MomYouveSavedText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript

MomPhoneSaveMoneyScript:
	setflag ENGINE_MOM_SAVING_MONEY
	writetext MomOKIllSaveText
	promptbutton
	sjump MomPhoneHangUpScript

MomPhoneStopSavingMoneyScript:
	clearflag ENGINE_MOM_SAVING_MONEY
	writetext MomPhoneStopSavingMoneyText
	promptbutton
	sjump MomPhoneHangUpScript

MomPhoneHangUpScript:
	writetext MomPhoneHangUpText
	end

MomPhoneNoPokemonScript:
	writetext MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript:
	writetext MomPhoneNoPokedexText
	end

MomPhoneNoGymQuestScript:
	writetext MomPhoneNoGymQuestText
	end

MomPhoneLectureScript:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	setflag ENGINE_MOM_ACTIVE
	specialphonecall SPECIALCALL_NONE
	writetext MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneStopSavingMoneyScript
