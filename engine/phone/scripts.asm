UnusedPhoneScript:
	writetext UnusedPhoneText
	end

MomPhoneCalleeScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .script_10401f
	checkevent EVENT_DUDE_TALKED_TO_YOU
	iftrue MomPhoneLectureScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue MomPhoneNoGymQuestScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue MomPhoneNoPokedexScript
	sjump MomPhoneNoPokemonScript

.script_10401f
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue MomPhoneHangUpScript
	writetext MomPhoneGreetingText
	promptbutton
	getcurlandmarkname STRING_BUFFER_3
	readvar VAR_ROOFPALETTE
	ifequal 1, MomPhonePalette1
	ifequal 2, MomPhonePalette2
	sjump MomPhoneOther

MomPhoneLandmark:
	writetext MomPhoneLandmarkText
	promptbutton
	sjump MomSavingMoney

MomPhonePalette1:
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

MomPhonePalette2:
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
	sjump MomPhoneWontSaveMoneyScript

.SavingNoMoney:
	writetext MomImportantToSaveText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneWontSaveMoneyScript

.NoMoney:
	writetext MomYoureNotSavingText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneWontSaveMoneyScript

.HasMoney:
	getmoney STRING_BUFFER_3, MOMS_MONEY
	writetext MomYouveSavedText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	sjump MomPhoneWontSaveMoneyScript

MomPhoneSaveMoneyScript:
	setflag ENGINE_MOM_SAVING_MONEY
	writetext MomOKIllSaveText
	promptbutton
	sjump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript:
	clearflag ENGINE_MOM_SAVING_MONEY
	writetext MomPhoneWontSaveMoneyText
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
	sjump MomPhoneWontSaveMoneyScript

BillPhoneCalleeScript:
	checktime DAY
	iftrue Script_104148
	checktime NITE
	iftrue Script_10414f
	writetext Text_104ec4
	promptbutton
	sjump Script_104156
Script_104148:
	writetext Text_104f0d
	promptbutton
	sjump Script_104156
Script_10414f:
	writetext Text_104f52
	promptbutton
	sjump Script_104156
Script_104156:
	writetext Text_104f9b
	promptbutton
	readvar $10
	getnum STRING_BUFFER_3
	ifequal $00, Script_10416e
	ifless $06, Script_10416a
	writetext Text_104fc7
	end
Script_10416a:
	writetext Text_105024
	end
Script_10416e:
	writetext Text_10508a
	end

BillPhoneCallerScript:
	writetext Text_1050ef
	waitbutton
	end

ElmPhoneCalleeScript:
	readvar $14
	ifequal $01, Script_1041da
	checkevent $0055
	iftrue Script_1041cc
	checkevent $002d
	iffalse Script_10418f
	checkevent $0054
	iftrue Script_1041c5
Script_10418f:
	checkevent $002d
	iftrue Script_1041c1
	checkevent $0701
	iftrue Script_1041bd
	checkevent $001f
	iftrue Script_1041b9
	checkevent $0043
	iftrue Script_1041b5
	checkevent $001e
	iftrue Script_1041b1
	writetext Text_105199
	end
Script_1041b1:
	writetext Text_1051e6
	end
Script_1041b5:
	writetext Text_105221
	end
Script_1041b9:
	writetext Text_105272
	end
Script_1041bd:
	writetext Text_1052b9
	end
Script_1041c1:
	writetext Text_105305
	end
Script_1041c5:
	writetext Text_105358
	setevent $0077
	end
Script_1041cc:
	random 2
	ifequal $00, Script_1041d6
	writetext Text_1053bc
	end
Script_1041d6:
	writetext Text_10541f
	end
Script_1041da:
	writetext Text_105484
	specialphonecall SPECIALCALL_NONE
	end

ElmPhoneCallerScript:
	readvar $14
	ifequal $02, Script_1041fe
	ifequal $03, Script_104208
	ifequal $04, Script_104215
	ifequal $05, Script_10421c
	ifequal $08, Script_10421c
	writetext Text_105484
	specialphonecall SPECIALCALL_NONE
	end
Script_1041fe:
	writetext Text_1055b4
	specialphonecall SPECIALCALL_NONE
	setevent $0043
	end
Script_104208:
	writetext Text_105624
	specialphonecall SPECIALCALL_NONE
	clearevent $0700
	setevent $0701
	end
Script_104215:
	writetext Text_1056a3
	specialphonecall SPECIALCALL_NONE
	end
Script_10421c:
	writetext Text_1057a6
	specialphonecall SPECIALCALL_NONE
	end
Script_104223:
	writetext Text_1057fa
	specialphonecall SPECIALCALL_NONE
	end

JackPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $17, $01
	scall Script_10485c
	sjump Script_1048f0

JackPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $17, $01
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_10424c
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_10424c:
	getstring STRING_BUFFER_5, Text_1049ae
	setevent $0260
	sjump Script_104950

BeverlyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $3e, $01
	scall Script_104875
	sjump Script_104901

BeverlyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $3e, $01
	scall Script_1048a7
	scall PhoneScript_Random2
	ifequal $00, Script_104278
	scall PhoneScript_Random2
	ifequal $00, Script_1049a1
	sjump Script_104901
Script_104278:
	getstring STRING_BUFFER_5, Text_1049ae
	setevent $0262
	sjump Script_104957

HueyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $28, $02
	scall Script_10485c
	sjump Script_1048c0

HueyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $28, $02
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_10429d
	sjump Script_1048c0
Script_10429d:
	getstring STRING_BUFFER_5, Text_1049bc
	setevent $0264
	sjump Script_104950

GavenPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $1b, $0a
	scall Script_10485c
	sjump Script_1048f0

GavenPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $1b, $0a
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_1042c9
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_1042c9:
	getstring STRING_BUFFER_5, Text_1049e7
	setevent $026c
	sjump Script_104950

BethPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $1c, $09
	scall Script_104875
	sjump Script_104901

BethPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $1c, $09
	scall Script_1048a7
	scall PhoneScript_Random2
	ifequal $00, Script_1042f5
	scall PhoneScript_Random2
	ifequal $00, Script_1049a1
	sjump Script_104901
Script_1042f5:
	getstring STRING_BUFFER_5, Text_1049e7
	setevent $026e
	sjump Script_104957

JosePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $18, $0e
	scall Script_10485c
	sjump Script_1048f0

JosePhoneCallerScript:
	gettrainername STRING_BUFFER_3, $18, $0e
	scall PhoneScript_Random4
	ifequal $00, Script_10495e
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_104328
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_104328:
	getstring STRING_BUFFER_5, Text_1049f0
	setevent $0270
	sjump Script_104950

ReenaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $1c, $0a
	scall Script_104875
	sjump Script_104901

ReenaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $1c, $0a
	scall Script_1048a7
	scall PhoneScript_Random2
	ifequal $00, Script_104354
	scall PhoneScript_Random2
	ifequal $00, Script_1049a1
	sjump Script_104901
Script_104354:
	getstring STRING_BUFFER_5, Text_1049f0
	setevent $0272
	sjump Script_104957

JoeyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $16, $01
	scall Script_10485c
	sjump Script_1048f0

JoeyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $16, $01
	scall Script_10488e
	checkflag $0045
	iffalse Script_10437c
	scall PhoneScript_Random2
	ifequal $00, Script_104386
Script_10437c:
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_104386:
	getstring STRING_BUFFER_5, Text_1049f9
	setevent $0274
	sjump Script_104950

WadePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $24, $04
	scall Script_10485c
	scall PhoneScript_Random2
	ifequal $00, Script_1043b2
	checkflag $0050
	iftrue Script_1043b2
	readvar $0b
	ifequal $02, Script_104983
	ifequal $04, Script_104983
	ifequal $06, Script_104983
Script_1043b2:
	sjump Script_1048f0

WadePhoneCallerScript:
	gettrainername STRING_BUFFER_3, $24, $04
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_1043d7
	checkflag $0050
	iftrue Script_1043d7
	readvar $0b
	ifequal $02, Script_104983
	ifequal $04, Script_104983
	ifequal $06, Script_104983
Script_1043d7:
	checkflag $0045
	iffalse Script_1043e4
	scall PhoneScript_Random2
	ifequal $00, Script_1043ee
Script_1043e4:
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_1043ee:
	getstring STRING_BUFFER_5, Text_104a02
	setevent $0276
	sjump Script_104950

RalphPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $25, $02
	scall Script_10485c
	sjump Script_1048f0

RalphPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $25, $02
	scall Script_10488e
	checkflag $0045
	iffalse Script_104416
	scall PhoneScript_Random2
	ifequal $00, Script_104427
Script_104416:
	scall PhoneScript_Random2
	ifequal $00, Script_104431
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_104427:
	getstring STRING_BUFFER_5, Text_104a0b
	setevent $0278
	sjump Script_104950
Script_104431:
	checkflag ENGINE_SWARM
	iftrue Script_1048f0
	getmonname STRING_BUFFER_4, QWILFISH
	getstring STRING_BUFFER_5, Text_104a0b
	setval FISHSWARM_QWILFISH
	special ActivateFishingSwarm
	sjump Script_104975

LizPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $35, $01
	scall Script_104875
	sjump Script_104901

LizPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $35, $01
	scall Script_1048a7
	checkflag $0045
	iffalse Script_104464
	scall PhoneScript_Random2
	ifequal $00, Script_10446e
Script_104464:
	scall PhoneScript_Random2
	ifequal $00, Script_1049a1
	sjump Script_104901
Script_10446e:
	getstring STRING_BUFFER_5, Text_104a0b
	setevent $027a
	sjump Script_104957

AnthonyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $2c, $05
	scall Script_10485c
	sjump Script_1048f0

AnthonyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $2c, $05
	scall Script_10488e
	checkflag $0045
	iffalse Script_104496
	scall PhoneScript_Random2
	ifequal $00, Script_1044a7
Script_104496:
	scall PhoneScript_Random2
	ifequal $00, Script_1044b1
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_1044a7:
	getstring STRING_BUFFER_5, Text_104a14
	setevent $027c
	sjump Script_104950
Script_1044b1:
	checkflag ENGINE_SWARM
	iftrue Script_1048f0
	getmonname STRING_BUFFER_4, DUNSPARCE
	getstring STRING_BUFFER_5, Text_1049d3
	swarm DARK_CAVE_VIOLET_ENTRANCE
	sjump Script_10497c

ToddPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $36, $02
	scall Script_10485c
	sjump Script_1048f0

ToddPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $36, $02
	scall Script_10488e
	checkflag $0045
	iffalse Script_1044e2
	scall PhoneScript_Random2
	ifequal $00, Script_1044ec
Script_1044e2:
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_1044ec:
	getstring STRING_BUFFER_5, Text_104a1d
	setevent $027e
	sjump Script_104950

GinaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $35, $02
	scall Script_104875
	checkflag $0012
	iftrue Script_104991
	sjump Script_104901

GinaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $35, $02
	scall Script_1048a7
	checkflag $0012
	iftrue Script_104991
	checkflag $0045
	iffalse Script_104520
	scall PhoneScript_Random2
	ifequal $00, Script_10452a
Script_104520:
	scall PhoneScript_Random2
	ifequal $00, Script_1049a1
	sjump Script_104901
Script_10452a:
	getstring STRING_BUFFER_5, Text_104a1d
	setevent $0280
	sjump Script_104957

IrwinPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $31, $01
	scall Script_10485c
	checkflag $0012
	iftrue Script_10498a
	sjump Script_1048f0

IrwinPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $31, $01
	scall Script_10488e
	checkflag $0012
	iftrue Script_10498a
	scall PhoneScript_Random2
	ifequal $00, Script_104562
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_104562:
	getstring STRING_BUFFER_5, Text_104a26
	setevent $0282
	sjump Script_104950

ArniePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $24, $08
	scall Script_10485c
	sjump Script_1048f0

ArniePhoneCallerScript:
	gettrainername STRING_BUFFER_3, $24, $08
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_104595
	scall PhoneScript_Random2
	ifequal $00, Script_10459f
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_104595:
	getstring STRING_BUFFER_5, Text_104a26
	setevent $0284
	sjump Script_104950
Script_10459f:
	checkflag ENGINE_SWARM
	iftrue Script_1048f0
	getmonname STRING_BUFFER_4, YANMA
	getstring STRING_BUFFER_5, Text_104a26
	swarm ROUTE_35
	sjump Script_10496e

AlanPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $17, $03
	scall Script_10485c
	sjump Script_1048f0

AlanPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $17, $03
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_1045d4
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_1045d4:
	getstring STRING_BUFFER_5, Text_104a2f
	setevent $0286
	sjump Script_104950

DanaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $19, $0a
	scall Script_104875
	sjump Script_104901

DanaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $19, $0a
	scall Script_1048a7
	scall PhoneScript_Random2
	ifequal $00, Script_104600
	scall PhoneScript_Random2
	ifequal $00, Script_1049a1
	sjump Script_104901
Script_104600:
	getstring STRING_BUFFER_5, Text_104a41
	setevent $028a
	sjump Script_104957

ChadPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $17, $0a
	scall Script_10485c
	sjump Script_1048f0

ChadPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $17, $0a
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_104633
	scall PhoneScript_Random2
	ifequal $00, Script_104646
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_104633:
	checkflag ENGINE_SWARM
	iftrue Script_1048f0
	getmonname STRING_BUFFER_4, SNUBBULL
	getstring STRING_BUFFER_5, Text_104a41
	swarm ROUTE_38
	sjump Script_10496e
Script_104646:
	getstring STRING_BUFFER_5, Text_104a41
	setevent $028c
	sjump Script_104950

DerekPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $3b, $02
	scall Script_10485c
	scall PhoneScript_Random2
	ifequal $00, Script_104672
	checkflag $0050
	iftrue Script_104672
	readvar $0b
	ifequal $02, Script_104983
	ifequal $04, Script_104983
	ifequal $06, Script_104983
Script_104672:
	sjump Script_1048f0

DerekPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $3b, $02
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_104697
	checkflag $0050
	iftrue Script_104697
	readvar $0b
	ifequal $02, Script_104983
	ifequal $04, Script_104983
	ifequal $06, Script_104983
Script_104697:
	scall PhoneScript_Random2
	ifequal $00, Script_1046a8
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_1046a8:
	getstring STRING_BUFFER_5, Text_104a4a
	setevent $028e
	sjump Script_104950

ChrisPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $25, $07
	scall Script_10485c
	sjump Script_1048f0

ChrisPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $25, $07
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_1046d4
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_1046d4:
	getstring STRING_BUFFER_5, Text_104a53
	setevent $0290
	sjump Script_104950

BrentPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $1e, $06
	scall Script_10485c
	sjump Script_1048f0

BrentPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $1e, $06
	scall PhoneScript_Random4
	ifequal $00, Script_10495e
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_104707
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_104707:
	getstring STRING_BUFFER_5, Text_104a5c
	setevent $0292
	sjump Script_104950

TiffanyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $35, $14
	scall Script_104875
	sjump Script_104901

TiffanyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $35, $14
	scall PhoneScript_Random4
	ifequal $00, Script_104962
	scall Script_1048a7
	scall PhoneScript_Random2
	ifequal $00, Script_10473a
	scall PhoneScript_Random2
	ifequal $00, Script_1049a1
	sjump Script_104901
Script_10473a:
	getstring STRING_BUFFER_5, Text_104a5c
	setevent $0294
	sjump Script_104957

VancePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $18, $07
	scall Script_10485c
	sjump Script_1048f0

VancePhoneCallerScript:
	gettrainername STRING_BUFFER_3, $18, $07
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_104766
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_104766:
	getstring STRING_BUFFER_5, Text_104a65
	setevent $0296
	sjump Script_104950

WiltonPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $25, $0a
	scall Script_10485c
	sjump Script_1048f0

WiltonPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $25, $0a
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_104799
	scall PhoneScript_Random2
	ifequal $00, Script_1047ae
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_104799:
	checkflag ENGINE_SWARM
	iftrue Script_1048f0
	getmonname STRING_BUFFER_4, $df
	getstring STRING_BUFFER_5, Text_104a65
	setval FISHSWARM_REMORAID
	special ActivateFishingSwarm
	sjump Script_104975
Script_1047ae:
	getstring STRING_BUFFER_5, Text_104a65
	setevent $0298
	sjump Script_104950

KenjiPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $32, $08
	scall Script_10485c
	sjump Script_1048f0

KenjiPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $32, $08
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_1047da
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_1047da:
	getstring STRING_BUFFER_5, Text_104a6e
	setevent $029a
	sjump Script_104950

ParryPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $2c, $09
	scall Script_10485c
	sjump Script_1048f0

ParryPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $2c, $09
	scall Script_10488e
	scall PhoneScript_Random2
	ifequal $00, Script_10480d
	scall PhoneScript_Random2
	ifequal $00, Script_104820
	scall PhoneScript_Random2
	ifequal $00, Script_104998
	sjump Script_1048f0
Script_10480d:
	checkflag ENGINE_SWARM
	iftrue Script_1048f0
	getmonname STRING_BUFFER_4, MARILL
	getstring STRING_BUFFER_5, Text_1049dd
	swarm MOUNT_MORTAR_1F_OUTSIDE
	sjump Script_10497c

Script_104820:
	getstring STRING_BUFFER_5, Text_104a6e
	setevent $029c
	sjump Script_104950

ErinPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, $35, $0a
	scall Script_104875
	sjump Script_104901

ErinPhoneCallerScript:
	gettrainername STRING_BUFFER_3, $35, $0a
	scall Script_1048a7
	scall PhoneScript_Random2
	ifequal $00, Script_10484c
	scall PhoneScript_Random2
	ifequal $00, Script_1049a1
	sjump Script_104901
Script_10484c:
	getstring STRING_BUFFER_5, Text_104a77
	setevent $029e
	sjump Script_104957

PhoneScript_Random2:
	random 2
	end

PhoneScript_Random4:
	random 4
	end

Script_10485c:
	checktime DAY
	iftrue Script_10486b
	checktime NITE
	iftrue Script_104870
	writetext Text_105862
	promptbutton
	end

Script_10486b:
	writetext Text_10588a
	promptbutton
	end

Script_104870:
	writetext Text_1058b3
	promptbutton
	end

Script_104875:
	checktime DAY
	iftrue Script_104884
	checktime NITE
	iftrue Script_104889
	writetext Text_1058db
	promptbutton
	end

Script_104884:
	writetext Text_105904
	promptbutton
	end

Script_104889:
	writetext Text_10592c
	promptbutton
	end

Script_10488e:
	checktime DAY
	iftrue Script_10489d
	checktime NITE
	iftrue Script_1048a2
	writetext Text_105955
	promptbutton
	end

Script_10489d:
	writetext Text_105989
	promptbutton
	end

Script_1048a2:
	writetext Text_1059b5
	promptbutton
	end

Script_1048a7:
	checktime DAY
	iftrue Script_1048b6
	checktime NITE
	iftrue Script_1048bb
	writetext Text_1059e4
	promptbutton
	end

Script_1048b6:
	writetext Text_105a15
	promptbutton
	end

Script_1048bb:
	writetext Text_105a3f
	promptbutton
	end

Script_1048c0:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal $00, Script_1048e2
	writetext Text_105a70
	promptbutton
	sjump Script_104966

Script_1048d1:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal $00, Script_1048e9
	writetext Text_105ab5
	promptbutton
	sjump Script_10496a

Script_1048e2:
	writetext Text_105b0d
	promptbutton
	sjump Script_10496a

Script_1048e9:
	writetext Text_105b42
	promptbutton
	sjump Script_10496a

Script_1048f0:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal $00, Script_104912
	writetext Text_105a70
	promptbutton
	sjump Script_104920

Script_104901:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal $00, Script_104919
	writetext Text_105ab5
	promptbutton
	sjump Script_104931

Script_104912:
	writetext Text_105b0d
	promptbutton
	sjump Script_104920

Script_104919:
	writetext Text_105b42
	promptbutton
	sjump Script_104931

Script_104920:
	special RandomPhoneWildMon
	scall PhoneScript_Random2
	ifequal $00, Script_104942
	writetext Text_105b7b
	promptbutton
	sjump Script_104966

Script_104931:
	special RandomPhoneWildMon
	scall PhoneScript_Random2
	ifequal $00, Script_104949
	writetext Text_105bcb
	promptbutton
	sjump Script_10496a

Script_104942:
	writetext Text_105c27
	promptbutton
	sjump Script_104966

Script_104949:
	writetext Text_105c76
	promptbutton
	sjump Script_10496a

Script_104950:
	writetext Text_105cdb
	promptbutton
	sjump Script_104966

Script_104957:
	writetext Text_105d37
	promptbutton
	sjump Script_10496a

Script_10495e:
	writetext Text_105da0
	end

Script_104962:
	writetext Text_105de2
	end

Script_104966:
	writetext Text_105e2e
	end

Script_10496a:
	writetext Text_105e3e
	end

Script_10496e:
	writetext Text_105e48
	promptbutton
	sjump Script_104966

Script_104975:
	writetext Text_105e9c
	promptbutton
	sjump Script_104966

Script_10497c:
	writetext Text_105efa
	promptbutton
	sjump Script_104966

Script_104983:
	writetext Text_105f50
	promptbutton
	sjump Script_104966

Script_10498a:
	writetext Text_105fa4
	promptbutton
	sjump Script_104966

Script_104991:
	writetext Text_106014
	promptbutton
	sjump Script_10496a

Script_104998:
	scall Script_1049aa
	iffalse Script_104966
	sjump Script_1048f0

Script_1049a1:
	scall Script_1049aa
	iffalse Script_10496a
	sjump Script_104901

Script_1049aa:
	special RandomUnseenWildMon
	end

Text_1049ae:
	db "NATIONAL PARK@"

Text_1049bc:
	db "LIGHTHOUSE@"

; unreferenced
Text_1049c7:
	db "UNDERGROUND@"

Text_1049d3:
	db "DARK CAVE@"

Text_1049dd:
	db "MT.MORTAR@"

Text_1049e7:
	db "ROUTE 26@"

Text_1049f0:
	db "ROUTE 27@"

Text_1049f9:
	db "ROUTE 30@"

Text_104a02:
	db "ROUTE 31@"

Text_104a0b:
	db "ROUTE 32@"

Text_104a14:
	db "ROUTE 33@"

Text_104a1d:
	db "ROUTE 34@"

Text_104a26:
	db "ROUTE 35@"

Text_104a2f:
	db "ROUTE 36@"

; unreferenced
Text_104a38:
	db "ROUTE 37@"

Text_104a41:
	db "ROUTE 38@"

Text_104a4a:
	db "ROUTE 39@"

Text_104a53:
	db "ROUTE 42@"

Text_104a5c:
	db "ROUTE 43@"

Text_104a65:
	db "ROUTE 44@"

Text_104a6e:
	db "ROUTE 45@"

Text_104a77:
	db "ROUTE 46@"

BikeShopPhoneCallerScript:
	writetext Text_10608d
	clearflag $0013
	specialphonecall SPECIALCALL_NONE
	end

UnusedPhoneText:
	text "Good morning."
	done

MomPhoneGreetingText:
	text "Hello?"

	para "Oh, hi, <PLAYER>!"
	line "Working hard?"
	done

MomPhoneLandmarkText:
	text "Oh, so you're in"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Isn't that where"
	line "@"
	text_ram wStringBuffer4
	text ""

	para "is? Did you go"
	line "take a look?"
	done

MomPhoneGenericAreaText:
	text "Really, you're in"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "I've never gone"
	line "there. That's kind"
	cont "of neat, <PLAYER>."
	done

MomPhoneNewBarkText:
	text "What? You're in"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Come see your MOM"
	line "sometime!"
	done

MomPhoneCherrygroveText:
	text "You're visiting"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "How about coming"
	line "home for a bit?"
	done

MomOtherAreaText:
	text "Wow, you're in"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "Good luck on your"
	line "#MON quest!"
	done

MomDeterminedText:
	text "That sounds really"
	line "tough."

	para "But, <PLAYER>, I"
	line "know you're really"

	para "determined. You'll"
	line "be OK, right?"
	done

MomCheckBalanceText:
	text "By the way, you've"
	line "saved up ¥@"
	text_ram wStringBuffer3
	text "."

	para "Do you want to"
	line "keep on saving?"
	done

MomImportantToSaveText:
	text "It's important to"
	line "save your money."
	done

MomYoureNotSavingText:
	text "Oh, <PLAYER>,"
	line "you're not saving"

	para "any money. Would"
	line "you like to save?"
	done

MomYouveSavedText:
	text "By the way, you've"
	line "saved up ¥@"
	text_ram wStringBuffer3
	text "."

	para "Want to start"
	line "saving again?"
	done

MomOKIllSaveText:
	text "OK. I'll save your"
	line "money."
	done

MomPhoneWontSaveMoneyText:
	text "OK. I'll stop"
	line "saving your money."
	done

MomPhoneHangUpText:
	text "<PLAYER>, keep it"
	line "up! I'm rooting"
	cont "for you, baby!"
	done

MomPhoneNoPokemonText:
	text "Hello?"

	para "Oh, hi, <PLAYER>!"
	line "Wasn't PROF.ELM"
	cont "waiting for you?"
	done

MomPhoneNoPokedexText:
	text "Hello?"

	para "Oh, hi, <PLAYER>!"
	line "You're on a big"

	para "mission for PROF."
	line "ELM? Be good!"
	done

MomPhoneNoGymQuestText:
	text "Hello?"

	para "Hi, <PLAYER>! If"
	line "you're done with"

	para "your errand come"
	line "on home, dear."
	done

MomPhoneLectureText:
	text "Hello?"

	para "…… <PLAYER>?"
	line "I heard from PROF."

	para "ELM that you went"
	line "on a long trip."

	para "I wish you would"
	line "have told me…"

	para "What about money?"
	line "Should I save it?"
	done

Text_104ec4:
	text "Good morning!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

Text_104f0d:
	text "Good day!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

Text_104f52:
	text "Good evening!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

Text_104f9b:
	text "Who's calling?"

	para "<PLAYER>, is it?"
	line "Hang on a sec…"

	para "<……>"
	line "<……>"
	done

Text_104fc7:
	text "Thanks for"
	line "waiting!"

	para "<PLAYER>, your BOX"
	line "has room for @"
	text_ram wStringBuffer3
	text ""
	cont "more #MON."

	para "Get out there and"
	line "fill it up!"
	done

Text_105024:
	text "Thanks for"
	line "waiting!"

	para "<PLAYER>, your BOX"
	line "has room for only"
	cont "@"
	text_ram wStringBuffer3
	text " more #MON."

	para "Maybe you should"
	line "switch your BOX."
	done

Text_10508a:
	text "Thanks for"
	line "waiting!"

	para "<PLAYER>, your BOX"
	line "is full!"

	para "You'll have to"
	line "switch BOXES if"

	para "you want to catch"
	line "more #MON."
	done

Text_1050ef:
	text "Hi, <PLAYER>?"
	line "It's me, BILL!"

	para "Thanks for using"
	line "my STORAGE SYSTEM."

	para "That last #MON"
	line "you sent filled"
	cont "your BOX up."

	para "You'll have to"
	line "switch BOXES if"

	para "you want to catch"
	line "more #MON."

	para "Bye now!"
	done

Text_105199:
	text "Hello, <PLAYER>?"

	para "Try not to overdo"
	line "it."

	para "Be sure to heal"
	line "your #MON if"
	cont "they are hurt."
	done

Text_1051e6:
	text "Hello, <PLAYER>?"

	para "Did you meet MR."
	line "#MON? Great!"
	cont "Come back safely!"
	done

Text_105221:
	text "<PLAYER>? I'm very"
	line "upset now."

	para "We had a #MON"
	line "stolen from here."

	para "How could anyone"
	line "do that?"
	done

Text_105272:
	text "Hello, <PLAYER>?"

	para "We're checking the"
	line "EGG now. It does"

	para "appear to be a"
	line "#MON EGG."
	done

Text_1052b9:
	text "Hello, <PLAYER>?"

	para "Did you see my"
	line "assistant? He's at"

	para "the #MON CENTER"
	line "in VIOLET CITY."
	done

Text_105305:
	text "Hello, <PLAYER>?"

	para "How's the EGG? Has"
	line "anything changed?"

	para "If anything hap-"
	line "pens, please call."
	done

Text_105358:
	text "Hello, <PLAYER>?"
	line "How is the EGG?"

	para "What? It hatched?"
	line "Wow! What kind of"
	cont "#MON is it?"

	para "Please come show"
	line "me now!"
	done

Text_1053bc:
	text "Hello, <PLAYER>?"

	para "I just made a new"
	line "discovery."

	para "The time it takes"
	line "for an EGG to"

	para "hatch depends on"
	line "the #MON."
	done

Text_10541f:
	text "Hello, <PLAYER>?"

	para "It's still a"
	line "mystery what kinds"

	para "of moves hatched"
	line "#MON have."

	para "We're investigat-"
	line "ing that now."
	done

Text_105484:
	text "Hello, <PLAYER>?"

	para "I discovered an"
	line "odd thing."

	para "Apparently there's"
	line "something called"

	para "#RUS that in-"
	line "fects #MON."

	para "Yes, it's like a"
	line "virus, so it's"
	cont "called #RUS."

	para "It multiplies fast"
	line "and infects other"

	para "#MON too. But"
	line "that's all."

	para "It doesn't seem to"
	line "do anything, and"

	para "it goes away over"
	line "time."

	para "I guess it's"
	line "nothing to worry"
	cont "about. Bye!"
	done

Text_1055b4:
	text "H-hello? <PLAYER>?"
	line "It's a disaster!"

	para "Uh, um, it's just"
	line "terrible!"

	para "What should I do?"
	line "It… Oh, no…"

	para "Please get back"
	line "here now!"
	done

Text_105624:
	text "Hello, <PLAYER>? We"
	line "discovered some-"

	para "thing about the"
	line "EGG!"

	para "My assistant is at"
	line "the #MON CENTER"

	para "in VIOLET CITY. "
	line "Could you talk to"
	cont "him?"
	done

Text_1056a3:
	text "<PLAYER>, how are"
	line "things going?"

	para "I called because"
	line "something weird is"

	para "happening with the"
	line "radio broadcasts."

	para "They were talking"
	line "about TEAM ROCKET."

	para "<PLAYER>, do you"
	line "know anything"
	cont "about it?"

	para "Maybe TEAM ROCKET"
	line "has returned. No,"

	para "that just can't"
	line "be true."

	para "Sorry to bug you."
	line "Take care!"
	done

Text_1057a6:
	text "Hello, <PLAYER>?"

	para "I have something"
	line "here for you."

	para "Could you swing by"
	line "my LAB?"

	para "See you later!"
	done

Text_1057fa:
	text "Hello, <PLAYER>?"
	line "How's it going?"

	para "I got ahold of"
	line "something neat."

	para "Swing by my LAB"
	line "and pick it up!"

	para "See you later!"
	done

Text_105862:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Good morning,"
	line "<PLAYER>!"
	done

Text_10588a:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "How's it going,"
	line "<PLAYER>?"
	done

Text_1058b3:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Good evening,"
	line "<PLAYER>!"
	done

Text_1058db:
	text "Hi. This is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Hi, <PLAYER>!"
	line "Good morning."
	done

Text_105904:
	text "Hi. This is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Hi, <PLAYER>!"
	line "How are you?"
	done

Text_10592c:
	text "Hi. This is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Hi, <PLAYER>!"
	line "Good evening."
	done

Text_105955:
	text "<PLAYER>, good"
	line "morning!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "How are you doing?"
	done

Text_105989:
	text "<PLAYER>, howdy!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "Isn't it nice out?"
	done

Text_1059b5:
	text "<PLAYER>, good"
	line "evening!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "Got a minute?"
	done

Text_1059e4:
	text "Good morning,"
	line "<PLAYER>."

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "Did I wake you?"
	done

Text_105a15:
	text "Hello, <PLAYER>."

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "How are things?"
	done

Text_105a3f:
	text "Good evening,"
	line "<PLAYER>."

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "Were you awake?"
	done

Text_105a70:
	text "How are your"
	line "#MON doing?"

	para "My @"
	text_ram wStringBuffer4
	text "'s"
	line "really energetic."
	cont "It's a handful!"
	done

Text_105ab5:
	text "How are your"
	line "#MON doing?"

	para "I always keep my"
	line "@"
	text_ram wStringBuffer4
	text " in top"

	para "shape by going to"
	line "#MON CENTERS."
	done

Text_105b0d:
	text "My @"
	text_ram wStringBuffer4
	text "'s"
	line "looking awesome."

	para "I wish I could"
	line "show you."
	done

Text_105b42:
	text "I dressed up my"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "It looks even"
	line "cuter than before."
	done

Text_105b7b:
	text "Oh, yeah, I man-"
	line "aged to beat a"
	cont "tough @"
	text_ram wStringBuffer4
	text "."

	para "I need to make my"
	line "party stronger."
	done

Text_105bcb:
	text "You have to hear"
	line "this! I battled"

	para "@"
	text_ram wStringBuffer4
	text " the"
	line "other day."

	para "It was easy! I had"
	line "a type advantage."
	done

Text_105c27:
	text "Hey, listen!"
	line "I almost caught"

	para "@"
	text_ram wStringBuffer4
	text " the"
	line "other day."

	para "Oh, it was soooo"
	line "close too!"
	done

Text_105c76:
	text "Guess what happen-"
	line "ed the other day."

	para "I missed catching"
	line "@"
	text_ram wStringBuffer4
	text " again."

	para "Maybe I'm not very"
	line "good at this…"
	done

Text_105cdb:
	text "Want to battle?"
	line "It's not going to"

	para "be a repeat of the"
	line "last time we met."

	para "I'll be around"
	line "@"
	text_ram wStringBuffer5
	text "."
	done

Text_105d37:
	text "Do you want to"
	line "battle? I'm going"
	cont "to win this time!"

	para "I'll be waiting"
	line "for you around"

	para "@"
	text_ram wStringBuffer5
	text "."
	line "Look for me, OK?"
	done

Text_105da0:
	text "Hello? This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Uh-oh… You're not"
	line "KAZ! Sorry, wrong"
	cont "number."
	done

Text_105de2:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text ". How are"
	cont "you doing, AUDREY?"

	para "Huh? <PLAYER>?"
	line "Oops! My mistake!"
	done

Text_105e2e:
	text "See you later!"
	done

Text_105e3e:
	text "Bye-bye!"
	done

Text_105e48:
	text "You have to see"
	line "this! It's wild!"

	para "A whole bunch of"
	line "@"
	text_ram wStringBuffer4
	text " have"

	para "shown up around"
	line "@"
	text_ram wStringBuffer5
	text "!"
	done

Text_105e9c:
	text "It's amazing!"

	para "On @"
	text_ram wStringBuffer5
	text ","
	line "@"
	text_ram wStringBuffer4
	text " are"

	para "biting like there"
	line "is no tomorrow."

	para "<PLAYER>, bring"
	line "your ROD, buddy!"
	done

Text_105efa:
	text "A friend just told"
	line "me this."

	para "He saw a lot of"
	line "@"
	text_ram wStringBuffer4
	text " in"
	cont "@"
	text_ram wStringBuffer5
	text "."

	para "<PLAYER>, you ought"
	line "to go look."
	done

Text_105f50:
	text "They're holding"
	line "the Bug-Catching"

	para "Contest today at"
	line "the PARK."

	para "<PLAYER>, are you"
	line "going to go?"
	done

Text_105fa4:
	text "<PLAYER>, did you"
	line "know?"

	para "I hear GOLDENROD's"
	line "RADIO TOWER was"

	para "taken over by TEAM"
	line "ROCKET."

	para "But what exactly"
	line "is TEAM ROCKET?"
	done

Text_106014:
	text "<PLAYER>, did you"
	line "hear the news?"

	para "TEAM ROCKET has"
	line "taken over the"

	para "RADIO TOWER in"
	line "GOLDENROD CITY."

	para "I wonder if the"
	line "workers are OK…"
	done

Text_10608d:
	text "Hi, <PLAYER>!"
	line "Our BICYCLE sales"

	para "have gone through"
	line "the roof!"

	para "We owe it all to"
	line "your advertising"

	para "by riding around"
	line "on our BICYCLE."

	para "As our way of say-"
	line "ing thanks, please"

	para "keep that BICYCLE."
	line "Thanks again!"
	done

