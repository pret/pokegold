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
	sjump Phone_GenericCall_Male_SkipMon

HueyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	scall PhoneScript_GreetPhone_Male
	scall PhoneScript_Random2
	ifequal 0, .WantsBattle
	sjump Phone_GenericCall_Male_SkipMon

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

INCLUDE "engine/phone/scripts/generic.asm"

INCLUDE "data/phone/text/landmarks.asm"
