BillPhoneCalleeScript:
	checktime DAY
	iftrue .daygreet
	checktime NITE
	iftrue .nitegreet
	writetext BillPhoneMornGreetingText
	promptbutton
	sjump .main

.daygreet
	writetext BillPhoneDayGreetingText
	promptbutton
	sjump .main

.nitegreet
	writetext BillPhoneNiteGreetingText
	promptbutton
	sjump .main

.main
	writetext BillPhoneGenericText
	promptbutton
	readvar VAR_BOXSPACE
	getnum STRING_BUFFER_3
	ifequal 0, .full
	ifless PARTY_LENGTH, .nearlyfull
	writetext BillPhoneNotFullText
	end

.nearlyfull
	writetext BillPhoneNearlyFullText
	end

.full
	writetext BillPhoneFullText
	end

BillPhoneCallerScript:
	writetext BillPhoneNewlyFullText
	waitbutton
	end
