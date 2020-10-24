ElmPhoneCalleeScript:
	readvar VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_POKERUS, .pokerus
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue .discovery
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse .next
	checkevent EVENT_TOGEPI_HATCHED
	iftrue .egghatched
.next
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .eggunhatched
	checkevent EVENT_ELMS_AIDE_IN_LAB
	iftrue .assistant
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .checkingegg
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .stolen
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue .sawmrpokemon
	writetext ElmPhoneHealYourMonText
	end

.sawmrpokemon
	writetext ElmPhoneSawMrPokemonText
	end

.stolen
	writetext ElmPhonePokemonStolenText
	end

.checkingegg
	writetext ElmPhoneCheckingTheEggText
	end

.assistant
	writetext ElmPhoneAssistantText
	end

.eggunhatched
	writetext ElmPhoneHowIsTheEggText
	end

.egghatched
	writetext ElmPhoneEggHatchedText
	setevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	end

.discovery
	random 2
	ifequal 0, .nextdiscovery
	writetext ElmPhoneDiscoveredHatchTimeText
	end

.nextdiscovery
	writetext ElmPhoneInvestigatingEggMovesText
	end

.pokerus
	writetext ElmPhoneDiscoveredPokerusText
	specialphonecall SPECIALCALL_NONE
	end

ElmPhoneCallerScript:
	readvar VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_ROBBED, .disaster
	ifequal SPECIALCALL_ASSISTANT, .assistant
	ifequal SPECIALCALL_WEIRDBROADCAST, .rocket
	ifequal SPECIALCALL_SSTICKET, .gift
	ifequal SPECIALCALL_MASTERBALL, .gift
	writetext ElmPhoneDiscoveredPokerusText
	specialphonecall SPECIALCALL_NONE
	end

.disaster
	writetext ElmPhoneDisasterText
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	end

.assistant
	writetext ElmPhoneEggAssistantText
	specialphonecall SPECIALCALL_NONE
	clearevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_ELMS_AIDE_IN_LAB
	end

.rocket
	writetext ElmPhoneRadioTowerRocketTakeoverText
	specialphonecall SPECIALCALL_NONE
	end

.gift
	writetext ElmPhoneGiftText
	specialphonecall SPECIALCALL_NONE
	end

.neat ; unreferenced
	writetext ElmPhoneGotAholdOfSomethingNeatText
	specialphonecall SPECIALCALL_NONE
	end
