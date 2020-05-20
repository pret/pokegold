INCLUDE "engine/phone/scripts/unused.asm"
INCLUDE "engine/phone/scripts/mom.asm"
INCLUDE "engine/phone/scripts/bill.asm"
INCLUDE "engine/phone/scripts/elm.asm"

JackPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

JackPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneNationalParkText
	setevent EVENT_JACK_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

BeverlyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

BeverlyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneNationalParkText
	setevent EVENT_BEVERLY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

HueyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Huey

HueyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	sjump Phone_GenericCall_Huey

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneLighthouseText
	setevent EVENT_HUEY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

GavenPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

GavenPhoneCallerScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute26Text
	setevent EVENT_GAVEN_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

BethPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

BethPhoneCallerScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute26Text
	setevent EVENT_BETH_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

JosePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

JosePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	scall PhoneScript_Random4
	ifequal 0, Phone_WrongNumber_JoseBrent
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute27Text
	setevent EVENT_JOSE_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ReenaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

ReenaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute27Text
	setevent EVENT_REENA_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

JoeyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

JoeyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute30Text
	setevent EVENT_JOEY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

WadePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	scall PhoneScript_AnswerPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .Generic
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .Generic
	readvar VAR_WEEKDAY
	ifequal TUESDAY, PhoneScript_BugCatchingContest
	ifequal THURSDAY, PhoneScript_BugCatchingContest
	ifequal SATURDAY, PhoneScript_BugCatchingContest

.Generic:
	sjump Phone_GenericCall_Male

WadePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, PhoneScript_BugCatchingContest
	ifequal THURSDAY, PhoneScript_BugCatchingContest
	ifequal SATURDAY, PhoneScript_BugCatchingContest

.NoContest:
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute31Text
	setevent EVENT_WADE_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

RalphPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

RalphPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, .QwilfishSwarm
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute32Text
	setevent EVENT_RALPH_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

.QwilfishSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, QWILFISH
	getstring STRING_BUFFER_5, PhoneRoute32Text
	setval FISHSWARM_QWILFISH
	special ActivateFishingSwarm
	sjump PhoneScript_SwarmFish

LizPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

LizPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall PhoneScript_GreetPhone_Female
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute32Text
	setevent EVENT_LIZ_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

AnthonyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, HIKER, ANTHONY2
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

AnthonyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, HIKER, ANTHONY2
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, .DunsparceSwarm
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute33Text
	setevent EVENT_ANTHONY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

.DunsparceSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, DUNSPARCE
	getstring STRING_BUFFER_5, PhoneDarkCaveText
	swarm DARK_CAVE_VIOLET_ENTRANCE
	sjump PhoneScript_SwarmCave

ToddPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, CAMPER, TODD1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ToddPhoneCallerScript:
	gettrainername STRING_BUFFER_3, CAMPER, TODD1
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute34Text
	setevent EVENT_TODD_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

GinaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	scall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue GinaRocketRumorScript
	sjump Phone_GenericCall_Female

GinaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	scall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue GinaRocketRumorScript
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .NoBattle
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle

.NoBattle:
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute34Text
	setevent EVENT_GINA_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

IrwinPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	scall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue IrwinRocketRumorScript
	sjump Phone_GenericCall_Male

IrwinPhoneCallerScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	scall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue IrwinRocketRumorScript
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute35Text
	setevent EVENT_IRWIN_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ArniePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ArniePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, .YanmaSwarm
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute35Text
	setevent EVENT_ARNIE_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

.YanmaSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, YANMA
	getstring STRING_BUFFER_5, PhoneRoute35Text
	swarm ROUTE_35
	sjump PhoneScript_SwarmGrass

AlanPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

AlanPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute36Text
	setevent EVENT_ALAN_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

DanaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, LASS, DANA1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

DanaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, LASS, DANA1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute38Text
	setevent EVENT_DANA_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

ChadPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ChadPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .SnubbullSwarm
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.SnubbullSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, SNUBBULL
	getstring STRING_BUFFER_5, PhoneRoute38Text
	swarm ROUTE_38
	sjump PhoneScript_SwarmGrass

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute38Text
	setevent EVENT_CHAD_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

DerekPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall PhoneScript_AnswerPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .Generic
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .Generic
	readvar VAR_WEEKDAY
	ifequal TUESDAY, PhoneScript_BugCatchingContest
	ifequal THURSDAY, PhoneScript_BugCatchingContest
	ifequal SATURDAY, PhoneScript_BugCatchingContest

.Generic:
	sjump Phone_GenericCall_Male

DerekPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, PhoneScript_BugCatchingContest
	ifequal THURSDAY, PhoneScript_BugCatchingContest
	ifequal SATURDAY, PhoneScript_BugCatchingContest

.NoContest:
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute39Text
	setevent EVENT_DEREK_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ChrisPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, CHRIS1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ChrisPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, CHRIS1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute42Text
	setevent EVENT_CHRIS_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

BrentPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

BrentPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall PhoneScript_Random4
	ifequal 0, Phone_WrongNumber_JoseBrent
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute43Text
	setevent EVENT_BRENT_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

TiffanyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

TiffanyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	scall PhoneScript_Random4
	ifequal 0, Phone_WrongNumber_Tiffany
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute43Text
	setevent EVENT_TIFFANY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

VancePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

VancePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute44Text
	setevent EVENT_VANCE_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

WiltonPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

WiltonPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .RemoraidSwarm
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.RemoraidSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, REMORAID
	getstring STRING_BUFFER_5, PhoneRoute44Text
	setval FISHSWARM_REMORAID
	special ActivateFishingSwarm
	sjump PhoneScript_SwarmFish

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute44Text
	setevent EVENT_WILTON_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

KenjiPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI3
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

KenjiPhoneCallerScript:
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI3
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute45Text
	setevent EVENT_KENJI_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ParryPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	scall PhoneScript_AnswerPhone_Male
	sjump Phone_GenericCall_Male

ParryPhoneCallerScript:
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .MarillSwarm
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Male
	sjump Phone_GenericCall_Male

.MarillSwarm:
	checkflag ENGINE_SWARM
	iftrue Phone_GenericCall_Male
	getmonname STRING_BUFFER_4, MARILL
	getstring STRING_BUFFER_5, PhoneMtMortarText
	swarm MOUNT_MORTAR_1F_OUTSIDE
	sjump PhoneScript_SwarmCave

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute45Text
	setevent EVENT_PARRY_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Male

ErinPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	scall PhoneScript_AnswerPhone_Female
	sjump Phone_GenericCall_Female

ErinPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, ERIN1
	scall PhoneScript_GreetPhone_Female
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	scall PhoneScript_Random2
	ifequal 0, Phone_CheckIfUnseenRare_Female
	sjump Phone_GenericCall_Female

.WantsBattle:
	getstring STRING_BUFFER_5, PhoneRoute46Text
	setevent EVENT_ERIN_READY_FOR_REMATCH
	sjump PhoneScript_WantsToBattle_Female

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

Phone_GenericCall_Huey:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal 0, Phone_LookingAwesome_Huey
	writetext PhoneMaleReallyEnergeticText
	promptbutton
	sjump PhoneScript_SeeYouLater

UnusedPhone_GenericCall_Female:
	special RandomPhoneMon
	scall PhoneScript_Random2
	ifequal 0, UnusedPhone_DressedUp_Female
	writetext PhoneFemaleTopShapeText
	promptbutton
	sjump PhoneScript_ByeBye

Phone_LookingAwesome_Huey:
	writetext PhoneMaleLookingAwesomeText
	promptbutton
	sjump PhoneScript_ByeBye

UnusedPhone_DressedUp_Female:
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

PhoneNationalParkText:
	db "NATIONAL PARK@"

PhoneLighthouseText:
	db "LIGHTHOUSE@"

; unreferenced
PhoneUndergroundText:
	db "UNDERGROUND@"

PhoneDarkCaveText:
	db "DARK CAVE@"

PhoneMtMortarText:
	db "MT.MORTAR@"

PhoneRoute26Text:
	db "ROUTE 26@"

PhoneRoute27Text:
	db "ROUTE 27@"

PhoneRoute30Text:
	db "ROUTE 30@"

PhoneRoute31Text:
	db "ROUTE 31@"

PhoneRoute32Text:
	db "ROUTE 32@"

PhoneRoute33Text:
	db "ROUTE 33@"

PhoneRoute34Text:
	db "ROUTE 34@"

PhoneRoute35Text:
	db "ROUTE 35@"

PhoneRoute36Text:
	db "ROUTE 36@"

; unreferenced
PhoneRoute37Text:
	db "ROUTE 37@"

PhoneRoute38Text:
	db "ROUTE 38@"

PhoneRoute39Text:
	db "ROUTE 39@"

PhoneRoute42Text:
	db "ROUTE 42@"

PhoneRoute43Text:
	db "ROUTE 43@"

PhoneRoute44Text:
	db "ROUTE 44@"

PhoneRoute45Text:
	db "ROUTE 45@"

PhoneRoute46Text:
	db "ROUTE 46@"

BikeShopPhoneCallerScript:
	writetext BikeShopPhoneCallerText
	clearflag ENGINE_BIKE_SHOP_CALL_ENABLED
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

BillPhoneMornGreetingText:
	text "Good morning!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneDayGreetingText:
	text "Good day!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneNiteGreetingText:
	text "Good evening!"

	para "This is the #-"
	line "MON STORAGE SYSTEM"

	para "ADMINISTRATION"
	line "SERVICE."
	done

BillPhoneGenericText:
	text "Who's calling?"

	para "<PLAYER>, is it?"
	line "Hang on a sec…"

	para "<……>"
	line "<……>"
	done

BillPhoneNotFullText:
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

BillPhoneNearlyFullText:
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

BillPhoneFullText:
	text "Thanks for"
	line "waiting!"

	para "<PLAYER>, your BOX"
	line "is full!"

	para "You'll have to"
	line "switch BOXES if"

	para "you want to catch"
	line "more #MON."
	done

BillPhoneNewlyFullText:
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

ElmPhoneHealYourMonText:
	text "Hello, <PLAYER>?"

	para "Try not to overdo"
	line "it."

	para "Be sure to heal"
	line "your #MON if"
	cont "they are hurt."
	done

ElmPhoneSawMrPokemonText:
	text "Hello, <PLAYER>?"

	para "Did you meet MR."
	line "#MON? Great!"
	cont "Come back safely!"
	done

ElmPhonePokemonStolenText:
	text "<PLAYER>? I'm very"
	line "upset now."

	para "We had a #MON"
	line "stolen from here."

	para "How could anyone"
	line "do that?"
	done

ElmPhoneCheckingTheEggText:
	text "Hello, <PLAYER>?"

	para "We're checking the"
	line "EGG now. It does"

	para "appear to be a"
	line "#MON EGG."
	done

ElmPhoneAssistantText:
	text "Hello, <PLAYER>?"

	para "Did you see my"
	line "assistant? He's at"

	para "the #MON CENTER"
	line "in VIOLET CITY."
	done

ElmPhoneHowIsTheEggText:
	text "Hello, <PLAYER>?"

	para "How's the EGG? Has"
	line "anything changed?"

	para "If anything hap-"
	line "pens, please call."
	done

ElmPhoneEggHatchedText:
	text "Hello, <PLAYER>?"
	line "How is the EGG?"

	para "What? It hatched?"
	line "Wow! What kind of"
	cont "#MON is it?"

	para "Please come show"
	line "me now!"
	done

ElmPhoneDiscoveredHatchTimeText:
	text "Hello, <PLAYER>?"

	para "I just made a new"
	line "discovery."

	para "The time it takes"
	line "for an EGG to"

	para "hatch depends on"
	line "the #MON."
	done

ElmPhoneInvestigatingEggMovesText:
	text "Hello, <PLAYER>?"

	para "It's still a"
	line "mystery what kinds"

	para "of moves hatched"
	line "#MON have."

	para "We're investigat-"
	line "ing that now."
	done

ElmPhoneDiscoveredPokerusText:
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

ElmPhoneDisasterText:
	text "H-hello? <PLAYER>?"
	line "It's a disaster!"

	para "Uh, um, it's just"
	line "terrible!"

	para "What should I do?"
	line "It… Oh, no…"

	para "Please get back"
	line "here now!"
	done

ElmPhoneEggAssistantText:
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

ElmPhoneRadioTowerRocketTakeoverText:
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

ElmPhoneGiftText:
	text "Hello, <PLAYER>?"

	para "I have something"
	line "here for you."

	para "Could you swing by"
	line "my LAB?"

	para "See you later!"
	done

ElmPhoneGotAholdOfSomethingNeatText:
	text "Hello, <PLAYER>?"
	line "How's it going?"

	para "I got ahold of"
	line "something neat."

	para "Swing by my LAB"
	line "and pick it up!"

	para "See you later!"
	done

PhoneMaleAnswerMornText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Good morning,"
	line "<PLAYER>!"
	done

PhoneMaleAnswerDayText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "How's it going,"
	line "<PLAYER>?"
	done

PhoneMaleAnswerNiteText:
	text "Hello. This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Good evening,"
	line "<PLAYER>!"
	done

PhoneFemaleAnswerMornText:
	text "Hi. This is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Hi, <PLAYER>!"
	line "Good morning."
	done

PhoneFemaleAnswerDayText:
	text "Hi. This is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Hi, <PLAYER>!"
	line "How are you?"
	done

PhoneFemaleAnswerNiteText:
	text "Hi. This is"
	line "@"
	text_ram wStringBuffer3
	text "."

	para "Hi, <PLAYER>!"
	line "Good evening."
	done

PhoneMaleGreetMornText:
	text "<PLAYER>, good"
	line "morning!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "How are you doing?"
	done

PhoneMaleGreetDayText:
	text "<PLAYER>, howdy!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "Isn't it nice out?"
	done

PhoneMaleGreetNiteText:
	text "<PLAYER>, good"
	line "evening!"

	para "It's me, @"
	text_ram wStringBuffer3
	text "."
	line "Got a minute?"
	done

PhoneFemaleGreetMornText:
	text "Good morning,"
	line "<PLAYER>."

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "Did I wake you?"
	done

PhoneFemaleGreetDayText:
	text "Hello, <PLAYER>."

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "How are things?"
	done

PhoneFemaleGreetNiteText:
	text "Good evening,"
	line "<PLAYER>."

	para "This is @"
	text_ram wStringBuffer3
	text "."
	line "Were you awake?"
	done

PhoneMaleReallyEnergeticText:
	text "How are your"
	line "#MON doing?"

	para "My @"
	text_ram wStringBuffer4
	text "'s"
	line "really energetic."
	cont "It's a handful!"
	done

PhoneFemaleTopShapeText:
	text "How are your"
	line "#MON doing?"

	para "I always keep my"
	line "@"
	text_ram wStringBuffer4
	text " in top"

	para "shape by going to"
	line "#MON CENTERS."
	done

PhoneMaleLookingAwesomeText:
	text "My @"
	text_ram wStringBuffer4
	text "'s"
	line "looking awesome."

	para "I wish I could"
	line "show you."
	done

PhoneFemaleDressedUpText:
	text "I dressed up my"
	line "@"
	text_ram wStringBuffer4
	text "."

	para "It looks even"
	line "cuter than before."
	done

PhoneMaleManagedToBeatText:
	text "Oh, yeah, I man-"
	line "aged to beat a"
	cont "tough @"
	text_ram wStringBuffer4
	text "."

	para "I need to make my"
	line "party stronger."
	done

PhoneFemaleTypeAdvantageText:
	text "You have to hear"
	line "this! I battled"

	para "@"
	text_ram wStringBuffer4
	text " the"
	line "other day."

	para "It was easy! I had"
	line "a type advantage."
	done

PhoneMaleAlmostCaughtText:
	text "Hey, listen!"
	line "I almost caught"

	para "@"
	text_ram wStringBuffer4
	text " the"
	line "other day."

	para "Oh, it was soooo"
	line "close too!"
	done

PhoneFemaleMissedCatchingText:
	text "Guess what happen-"
	line "ed the other day."

	para "I missed catching"
	line "@"
	text_ram wStringBuffer4
	text " again."

	para "Maybe I'm not very"
	line "good at this…"
	done

PhoneMaleWantsToBattleText:
	text "Want to battle?"
	line "It's not going to"

	para "be a repeat of the"
	line "last time we met."

	para "I'll be around"
	line "@"
	text_ram wStringBuffer5
	text "."
	done

PhoneFemaleWantsToBattleText:
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

PhoneWrongNumberKazText:
	text "Hello? This is"
	line "@"
	text_ram wStringBuffer3
	text "…"

	para "Uh-oh… You're not"
	line "KAZ! Sorry, wrong"
	cont "number."
	done

PhoneWrongNumberAudreyText:
	text "Hello, this is"
	line "@"
	text_ram wStringBuffer3
	text ". How are"
	cont "you doing, AUDREY?"

	para "Huh? <PLAYER>?"
	line "Oops! My mistake!"
	done

PhoneSeeYouLaterText:
	text "See you later!"
	done

PhoneByeByeText:
	text "Bye-bye!"
	done

PhoneSwarmGrassText:
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

PhoneSwarmFishText:
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

PhoneSwarmCaveText:
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

PhoneBugCatchingContestText:
	text "They're holding"
	line "the Bug-Catching"

	para "Contest today at"
	line "the PARK."

	para "<PLAYER>, are you"
	line "going to go?"
	done

IrwinRocketTakeoverRumorText:
	text "<PLAYER>, did you"
	line "know?"

	para "I hear GOLDENROD's"
	line "RADIO TOWER was"

	para "taken over by TEAM"
	line "ROCKET."

	para "But what exactly"
	line "is TEAM ROCKET?"
	done

GinaRocketTakeoverRumorText:
	text "<PLAYER>, did you"
	line "hear the news?"

	para "TEAM ROCKET has"
	line "taken over the"

	para "RADIO TOWER in"
	line "GOLDENROD CITY."

	para "I wonder if the"
	line "workers are OK…"
	done

BikeShopPhoneCallerText:
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
