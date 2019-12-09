GiveParkBalls:
	xor a
	ld [wContestMon], a
	ld a, 20
	ld [wParkBalls], a
	farcall StartBugContestTimer
	ret

BugCatchingContestBattleScript::
	writecode VAR_BATTLETYPE, BATTLETYPE_CONTEST
	randomwildmon
	startbattle
	reloadmapafterbattle
	copybytetovar wParkBalls
	iffalse $79C5
	end

BugCatchingContestOverScript::
	playsound SFX_ELEVATOR_END
	opentext
	writetext $79D1
	waitbutton
	jump $79CD
	
BugCatchingContestOutOfBallsScript:
	playsound SFX_ELEVATOR_END
	opentext
	writetext $79D6
	waitbutton
	
BugCatchingContestReturnToGateScript:
	closetext
	jumpstd bugcontestresultswarp
	
BugCatchingContestTimeUpText:
	text_jump _BugCatchingContestTimeUpText
	db "@"

BugCatchingContestIsOverText:
	text_jump _BugCatchingContestIsOverText
	db "@"